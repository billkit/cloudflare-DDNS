# 本脚本适用于各 Linux 发行版、macOS、群晖。
## 使用说明
一、安装依赖命令
1、Debian/Ubuntu
```
apt update & apt install curl unzip wget -y
```
2、修改 `cloudflare-v6.sh` 文件中的`auth_email`、`auth_key`、`zone_name`、`record_name`。

```
auth_email="登陆Cloudflare 的邮箱"
auth_key=授权码
zone_name="顶级域名"
record_name="需要解析的二级域名"
```

3、修改`ipv6_addr.sh`文件，把`Interface=eth0`中的`eth0`改成系统网卡的名称，

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
赋予执行权限
```
chomd +x cloudflare-v6.sh ipv6_addr.sh
```
查看IPV6 地址

执行`./ipv6_addr.sh`,看到只有一个IPV6 地址说明修改正确。
```
root@Cloud:~/cloudflare-DDNS# ./ipv6_addr.sh 
2409:8855:f24b:b670:200c:292f:fefb:87b1
```

二、执行脚本

```
root@Cloud:~/cloudflare-DDNS# ./cloudflare-v6
Fri Sep 13 00:24:15 CST 2019
Checking AAAA for www.xxxx.ga
Zone ID:  1a2b3c43erfd45566gfdd567ujhgds
Record ID:  2weds34re5t6y8i1qe35t6yfcd456yhnb
Current Content:  2409:9a34:b45b:b690::f23b
New Content:  2409:6a55:f98cb:b56f::b4f3
Content Changed.  Update Cloudflare.
```
定时更新
把脚本加入 `crontab` 定时执行更新


```
crontab -e
```
复制以下语句到`crontab`中，每10 分钟执行一次。

```
*/10 * * * *  /root/cloudflare-v6 >/dev/null 2>&1
```
