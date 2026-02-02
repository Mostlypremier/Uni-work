@echo off
REM Start both Server and Client in separate windows
echo Starting Cryptography Server and Client...
start "Cryptography Server" cmd /k java -cp "Cryptography.jar" Server
timeout /t 2 /nobreak
start "Cryptography Client" cmd /k java -jar "Cryptography.jar"
