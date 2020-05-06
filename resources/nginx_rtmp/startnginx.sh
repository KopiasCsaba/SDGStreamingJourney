#!/bin/bash
cd "$(dirname "$0")"

# See documentation on this at docs/howtos/direct_rtmp_with_nginx.md

/opt/own/sbin/nginx -c nginx.conf -p .
