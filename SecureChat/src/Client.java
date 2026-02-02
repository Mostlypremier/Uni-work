
import java.net.ServerSocket;
import java.net.Socket;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.security.*;

public class Client {
    
    private static ObjectOutputStream oos,fileoos;
    private static ObjectInputStream ois,fileois;
    private static Key AESKey,DESKey;
    private static PublicKey publicKeyServer;
    private static PrivateKey clientPrivateKey;

    public static void main(String[] args) throws Exception {
        // Retry logic to wait for server to start
        Socket fileSendSocket = null;
        Socket writeSocket = null;
        ServerSocket ss1 = null;
        Socket readSocket = null;
        
        int maxRetries = 10;
        int retryCount = 0;
        int delayMs = 2000; // 2 seconds between retries
        
        while (retryCount < maxRetries) {
            try {
                fileSendSocket = new Socket("localhost", 9085);
                writeSocket = new Socket("localhost", 9090);
                ss1 = new ServerSocket(9091);
                readSocket = ss1.accept();
                System.out.println("Connected to server successfully!");
                break;
            } catch (IOException e) {
                retryCount++;
                if (retryCount < maxRetries) {
                    System.out.println("Server not available yet. Retrying... (" + retryCount + "/" + maxRetries + ")");
                    Thread.sleep(delayMs);
                } else {
                    System.err.println("Failed to connect to server after " + maxRetries + " attempts.");
                    throw new Exception("Could not connect to server. Make sure the server is running.");
                }
            }
        }
        System.out.println("rs "+readSocket);
        oos = new ObjectOutputStream(writeSocket.getOutputStream());
        ois = new ObjectInputStream(readSocket.getInputStream());
//        fileoos = new ObjectOutputStream(fileSendSocket.getOutputStream());
//        fileois = new ObjectInputStream(fileSendSocket.getInputStream());
        
        System.out.println("\nStart generating RSA key");
         KeyPairGenerator keyGenRSA = KeyPairGenerator.getInstance("RSA");
         keyGenRSA.initialize(1024);
         KeyPair keyRSA = keyGenRSA.generateKeyPair();
         clientPrivateKey = keyRSA.getPrivate();
         PublicKey clientPublicKey = keyRSA.getPublic();
         System.out.println("Finish generating RSA key");

         oos.writeObject(clientPublicKey);
         oos.flush();
         System.out.println("Public key (RSA)of client has been sent to server");
         
         PublicKey serverPublicKey= (PublicKey) ois.readObject();
         
         try {
                AESkeyAndSignature aeSkeyAndSignature = (AESkeyAndSignature) ois.readObject();
                //MessageDecryptionRSA decryptedAESkey = new MessageDecryptionRSA(aeSkeyAndSignature.getCipherKeyAES(), keyRSAPrivate);
                DecryptRSAwithSignature decryptRSAwithSignature = new DecryptRSAwithSignature(aeSkeyAndSignature.getCipherKeyAES(), clientPrivateKey, serverPublicKey, aeSkeyAndSignature.getSignature(),"AES");
                AESKey = decryptRSAwithSignature.getKey();
                System.out.println("Common key(AES) from server received" + AESKey);
                
                 DESKeyAndSignature deSkeyAndSignature = (DESKeyAndSignature) ois.readObject();
                //MessageDecryptionRSA decryptedAESkey = new MessageDecryptionRSA(aeSkeyAndSignature.getCipherKeyAES(), keyRSAPrivate);
                DecryptRSAwithSignature decryptRSAwithSignature1 = new DecryptRSAwithSignature(deSkeyAndSignature.getCipherKeyDES(), clientPrivateKey, serverPublicKey, deSkeyAndSignature.getSignature(),"DES");
                DESKey = decryptRSAwithSignature1.getKey();
                System.out.println("Common key(DES) from server received" + DESKey);
            } catch (Exception e) {
                e.printStackTrace();
            }
        
        new Launcher(readSocket,writeSocket,AESKey,DESKey,ois,oos,fileSendSocket).setVisible(true);
            System.out.println("Hello");
    }
}
