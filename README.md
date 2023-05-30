# [Tuic](https://github.com/EAimTY/tuic)搭建教程
- **更新软件源及安装组件**

```
apt -y update && apt -y install wget socat 
```
- **下载Tuic程序**

```
wget -O /usr/local/bin/tuic https://github.com/EAimTY/tuic/releases/download/tuic-server-1.0.0-alpha0/tuic-server-1.0.0-alpha0-x86_64-unknown-linux-gnu && chmod +x /usr/local/bin/tuic
```
- **下载配置文件**

```
wget -P /usr/local/etc https://github.com/TinrLin/Tuic-build-tutorial/blob/main/server.json
```
- **配置开机自启**

```
wget -P /etc/systemd/system https://github.com/TinrLin/Tuic-build-tutorial/blob/main/tuic.service && systemctl daemon-reload
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
4.切换CA机构
```
acme.sh --set-default-ca --server letsencrypt
```
5.生成证书（www.example.com替换为你的域名）
```
acme.sh --issue -d www.example.com --standalone -k ec-256 --webroot /home/wwwroot/html
```
6.安装证书
```
acme.sh --install-cert -d g.losem1.tk --ecc --key-file /etc/ssl/private/private.key --fullchain-file /etc/ssl/private/cert.crt
```
- **修改配置文件**

1.修改UUID*
```
cat /proc/sys/kernel/random/uuid
```
2.修改Passeord
```
openssl rand -base64 32
```
- **启动并查看启动状态**

```
systemctl enable --now tuic.service && systemctl status tuic.service
```


