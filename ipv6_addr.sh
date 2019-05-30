#!/bin/vbash
#  This script will grep the external accessible IPv6 for the specified interface.

Interface=$1

if [ $# -eq 0 ];
then
   Interface=eth0
else
   Interface=$1
fi
      
/sbin/ip -6 addr show dev $Interface| awk -F '[ \t]+|/' '$3 == "::1" { next;} $3 ~ /^fe80::/ { next ; } /inet6/ {print $3}'
