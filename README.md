# [Tuic](https://github.com/EAimTY/tuic)
- **安装Tuic程序**
```
apt -y update && apt -y install wget socat uuid-runtime && wget -O /usr/local/bin/tuic https://github.com/EAimTY/tuic/releases/download/tuic-server-1.0.0-beta0/tuic-server-1.0.0-beta0-x86_64-unknown-linux-gnu && chmod +x /usr/local/bin/tuic
```
- **下载配置文件**
```
wget -O /usr/local/etc/config.json https://raw.githubusercontent.com/TinrLin/Tuic-build-tutorial/main/server.json
```
- **配置开机自启**
```
wget -P /etc/systemd/system https://raw.githubusercontent.com/TinrLin/Tuic-build-tutorial/main/tuic.service
```
- **配置证书**

1.安装acme.sh

```
curl https://get.acme.sh | sh 
```
2.创建 acme.sh 的别名
```
alias acme.sh=~/.acme.sh/acme.sh
```
3.自动更新acme.sh
```
acme.sh --upgrade --auto-upgrade
```
4.设置默认CA
```
acme.sh --set-default-ca --server letsencrypt
```
5.生成证书（www.example.com替换为你的域名）
```
acme.sh --issue -d www.example.com --standalone -k ec-256 --webroot /home/wwwroot/html
```
6.安装证书（www.example.com替换为你的域名）
```
acme.sh --install-cert -d www.example.com --ecc --key-file /etc/ssl/private/private.key --fullchain-file /etc/ssl/private/cert.crt
```
- **修改配置文件**

生成UUID
```
uuidgen
```
生成Passeord
```
openssl rand -base64 32
```
- **查看Tuic运行状态**

```
systemctl daemon-reload && systemctl enable --now tuic.service && systemctl status tuic.service
```

  


