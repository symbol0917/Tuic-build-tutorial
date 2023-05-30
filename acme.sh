- 安装acme.sh

`
curl https://get.acme.sh | sh
`

- 创建一个bash的alias，方便你的使用

```
alias acme.sh=~/.acme.sh/acme.sh
```

- 自动更新acme.sh

```
acme.sh --upgrade --auto-upgrade
```

- 切换CA机构

```
acme.sh --set-default-ca --server letsencrypt
```

- 生成证书（www.example.com替换为你的域名）

```
acme.sh --issue -d www.example.com --standalone -k ec-256 --webroot /home/wwwroot/html
```

- 安装证书

```
acme.sh --install-cert -d g.losem1.tk --ecc --key-file /etc/ssl/private/private.key --fullchain-file /etc/ssl/private/cert.crt
```
