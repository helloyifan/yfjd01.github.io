## SSL Certificate

When we do online shopping, we want to make sure its HTTPS (padlock icon in address bar)

HTTPS is the secure version of HTTP, a protocol used between a browser and a web server
* The "S" at the end of HTTPS stands for secure
* HTTP over Secure Socket Later (Secure socket layer)

HTTPS means all communication between your browser and the web server are encrypted.
Behind HTTPs, SSL certificate plays an important role in building trust between a browser and webserver

By definition, a SSL certificate is a web server's digital certificate
* Issued by a third party, verified identity of a web server and its public key

## Sample flow

1. My browser requests secure pages (HTTPS) from a yahoo web server
2. Yahoo server sends its public key with its SSL certificate which is digitally signed by a third party, or we call Certificate Authority, or simply (CA)
3. Once browser gets certificate, it well check issuers digital signature to make sure the certificate is valid.
    * The digital signature is created by a CA's private key and a CA's public key (which is preinstalled on most browsers)
    * Thus digital signature is verified, once the certificate's signature is verified, the digital certificate can be trusted
    * Green padlock icon appears is shown, it signifies that the web servers public key really belongs to the webserver
4. Exchanges secret, browser creates two copies of a symmetric key (shared secret). It keeps one and gives a copy to the server (which is encrypted by web servers public key)
5. When the web server gets the encrypted symmetric key, it uses private key to decrypted and gets the browsers shared key
    * From now on both ends with use that key