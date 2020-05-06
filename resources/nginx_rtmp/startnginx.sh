#!/bin/bash
cd "$(dirname "$0")"

/opt/own/sbin/nginx -c nginx.conf -p .
