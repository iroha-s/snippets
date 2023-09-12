#!/bin/bash

BRANCH=${3:-main}
GIT_REPO_URL="https://raw.githubusercontent.com/iroha-s/snippet/${BRANCH}"
echo "branch名: $BRANCH"

template_id=${1:-9001}
template_os=${2:-ubuntu-jammy}
storage=${3:-local-lvm}
VALUE=9000

echo ""
echo "template_id: ${template_id}"
echo "template_os: ${template_os}"
echo "storage: ${storage}"
echo ""

if [ "$template_id" -gt $VALUE ]; then
    # ここに VALUE の値が 0 より大きかった場合の処理を記載します。
    echo "${GIT_REPO_URL}/proxmox/create_template/${template_os}.sh ${template_id} ${template_os} ${storage}"
    /bin/bash <(curl -H 'Cache-Control: no-cache, no-store' -s "${GIT_REPO_URL}/proxmox/create_template/${template_os}.sh") ${template_id} ${template_os} ${storage}
    # /bin/bash <(curl -s https://raw.githubusercontent.com/iroha-s/snippet/develop/proxmox/create_template/ubuntu-jammy.sh)
    # source "$(dirname "$0")"/"echo_test.sh" $template_id $template_os
else
    echo -e "\033[31mcreate_id が $VALUE より小さいです。\033[m"
    exit 1 # 終了します。
fi

exit 0
