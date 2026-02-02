# Java Secure Chat Application

This is a secure chat application implemented in Java that provides end-to-end encryption using RSA, AES, and DES algorithms. Users can exchange messages and share files securely with each other.

## Features

- Secure end-to-end encryption using RSA, AES, and DES algorithms
- User-friendly GUI for easy communication and file sharing
- Option to save chat logs and encrypted files for future reference
- Cross-platform compatibility with support for Windows, Linux, and macOS

## Usage

- Launch the application using start_both.bat insied of the dist folder
- Enter your username and click on the "Connect" button to join the chat room.
- Start sending and receiving messages with other users in the chat room.
- To share a file, click on the "Share File" button and select the file you want to share.
- When you receive a file from another user, you will be prompted to save the file to your local machine.

## Security

This chat application uses RSA, AES, and DES encryption algorithms to provide end-to-end encryption for all messages and files exchanged between users. RSA is used to encrypt the AES key, which is then used to encrypt the messages and files using AES and DES. This ensures that all communication is secure and cannot be intercepted or read by unauthorized parties.