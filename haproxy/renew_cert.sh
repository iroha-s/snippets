#!/bin/sh

SITE=$1

echo $1 $1

# mkdir -p /etc/haproxy/certs

# # move to the correct let's encrypt directory
# cd /etc/letsencrypt/live/$SITE

# # cat files to make combined .pem for haproxy
# cat fullchain.pem privkey.pem > /etc/haproxy/certs/$SITE.pem

# # reload haproxy
# service haproxy reload
