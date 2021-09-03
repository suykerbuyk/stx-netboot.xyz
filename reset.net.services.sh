#!/bin/sh

set -e

if [ "$EUID" -ne 0 ] ; then
	echo "sudo $0 $@"
	sudo $0 $@
	exit
fi
truncate -s 0 /var/log/nginx/access.log && chown johns:johns /var/log/nginx/access.log
truncate -s 0 /var/log/nginx/error.log && chown johns:johns /var/log/nginx/error.log
systemctl restart nginx && systemctl status nginx
truncate -s 0 /var/log/dnsmasq.log
systemctl restart dnsmasq && systemctl status dnsmasq
chown johns:johns /var/log/dnsmasq.log
