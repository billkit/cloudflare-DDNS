# 使用说明
一、修改 `cloudflare-v6` 文件中的`auth_email`、`auth_key`、`zone_name`、`record_name`

```
auth_email="登陆Cloudflare 的邮箱"
auth_key=授权码
## your cloudflare account key above
zone_name="顶级域名"
record_name="需要解析的二级域名"
```
二、修改` ipv6_addr.sh`文件，把`Interface=ens192`中的`ens192`改成系统网卡的名称，

查看系统网卡名称可以使用命令`ip a`。
`/usr/local/bin/cf-ddns.sh`

`crontab -e`

`
*/10 * * * *  /usr/local/bin/cf-ddns.sh >/dev/null 2>&1
`
