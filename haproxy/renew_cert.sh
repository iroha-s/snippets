#!/bin/sh
main() {
    haproxy $1
}

haproxy() {
    # 引数の有無をチェックする
    if [ $# != 1 ]; then
        echo "missing argument"
        # エラー終了
        exit 1
    fi

    SITE=$1

    mkdir -p /etc/haproxy/certs
    mkdir -p certs

    # cat files to make combined .pem for haproxy
    cat /etc/letsencrypt/live/$SITE/fullchain.pem /etc/letsencrypt/live/$SITE/privkey.pem > ./certs/$SITE.pem

    # reload haproxy
    # systemctl restart haproxy.service
}

main $1