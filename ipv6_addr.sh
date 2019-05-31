#!/bin/vbash
#  This script will grep the external accessible IPv6 for the specified interface.

Interface=$1

if [ $# -eq 0 ];
then
   Interface=ens192
else
   Interface=$1
fi
      
# /sbin/ip -6 addr show dev $Interface| awk -F '[ \t]+|/' '$3 == "::1" { next;} $3 ~ /^fe80::/ { next ; } /inet6/ {print $3}'
# 显示24 开头的公网 ipv6 地址
/sbin/ip -6 addr show dev $Interface| grep '24'|awk -F '[ \t]+|/' '$3 == "fdd2::" { next;} $3 ~ /^fe80:/ { next ; } /inet6/ {print $3}'
