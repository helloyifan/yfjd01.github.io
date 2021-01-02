## cURL

curl is a command line tool to transfer data to or from a server, using any of the supported protocols (HTTP, FTP, IMAP, POP3, SCP, SFTP, SMTP, TFTP, TELNET, LDAP or FILE).


```
curl [options] [URL...]
```

URL : The most basic uses of curl is typing the command followed by the URL.

```
curl https://www.yifandai.ca
```

The URL syntax is protocol dependent and multiple URLs can be written as sets like:
```
curl http://site.{one, two, three}.com
```

URLs with numeric sequence series can be written as:


```
curl ftp://ftp.example.com/file[1-20].jpeg

```

Progress Meter: curl displays a progress meter during use to indicate the transfer rate, amount of data transferred, time left etc.

```
curl -# -o ftp://ftp.example.com/file.zip
```


**-u** : curl also provides options to download files from user authenticated FTP servers.

```
curl -u {username}:{password} [FTP_URL]
```

**-T** : This option helps to upload a file to the FTP server.

```
curl -u {username}:{password} -T {filename} {FTP_Location}
```

