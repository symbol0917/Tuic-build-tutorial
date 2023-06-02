# [Tuic](https://github.com/EAimTY/tuic)
- **Install the Tuic program**
```
apt -y update && apt -y install wget socat uuid-runtime && wget -O /usr/local/bin/tuic https://github.com/EAimTY/tuic/releases/download/tuic-server-1.0.0-beta0/tuic-server-1.0.0-beta0-x86_64-unknown-linux-gnu && chmod +x /usr/local/bin/tuic
```
- **Download configuration file**
```
wget -O /usr/local/etc/config.json https://raw.githubusercontent.com/TinrLin/Tuic-build-tutorial/main/server.json && wget -P /etc/systemd/system https://raw.githubusercontent.com/TinrLin/Tuic-build-tutorial/main/tuic.service
```

- **Configure certificate**

**Note: replace www.example.com with your domain name**

```
curl https://get.acme.sh | sh && alias acme.sh=~/.acme.sh/acme.sh && acme.sh --upgrade --auto-upgrade && acme.sh --set-default-ca --server letsencrypt && acme.sh --issue -d www.example.com --standalone -k ec-256 --webroot /home/wwwroot/html && acme.sh --install-cert -d www.example.com --ecc --key-file /etc/ssl/private/private.key --fullchain-file /etc/ssl/private/cert.crt 
```

- **Modify the configuration file**

Generate UUID
```
uuidgen
```
Generate password
```
openssl rand -base64 32
```
- **View Tuic running status**

```
systemctl daemon-reload && systemctl enable --now tuic.service && systemctl status tuic.service
```

  


