# 本脚本适用于各 Linux 发行版、macOS、群晖及Openwrt/LEDE路由系统。
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
```
root@frp:~# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: ens192: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 00:0c:29:d9:e0:15 brd ff:ff:ff:ff:ff:ff
    inet 10.0.0.238/24 brd 10.0.0.255 scope global ens192
       valid_lft forever preferred_lft forever
```
其中的`ens192`就是网卡的名称。
如果 ipv6 地址非 24 开头，把`ipv6_addr.sh`文件中最后一行中`24`改为正确的IPV6地址开头。

三、执行脚本


`/usr/local/bin/cf-ddns.sh`

`crontab -e`

`
*/10 * * * *  /usr/local/bin/cf-ddns.sh >/dev/null 2>&1
`
