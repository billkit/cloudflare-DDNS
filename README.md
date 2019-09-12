# 使用说明
修改 cf-ddns-v6.sh 文件中的`auth_email`、`auth_key`、`zone_name`、`record_name`

```
auth_email="xxxxxxx@gmail.com"
auth_key=aa8c3c52882613177943xxxxxxxxxxxxxxxxx
## your cloudflare account key above
zone_name="xxxx.ga"
record_name="www.xxxx.ga"
```

`/usr/local/bin/cf-ddns.sh`

`crontab -e`

`
*/10 * * * *  /usr/local/bin/cf-ddns.sh >/dev/null 2>&1
`
