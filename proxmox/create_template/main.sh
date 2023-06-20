#!/bin/bash

BRANCH=${3:-main}
GIT_REPO_URL="https://raw.githubusercontent.com/iroha-s/snippet/${BRANCH}/"
echo "branch名: $BRANCH"

# 実行時に指定された引数の数、つまり変数 $# の値が 3 でなければエラー終了。
# if [ $# -ne 2 ]; then
#     echo "指定された引数は$#個です。" 1>&2
#     echo "実行するには2個の引数が必要です。" 1>&2
#     # exit 1
# fi

# ヒアドキュメントでメッセージを表示する。
# cat <<__EOT__
# 指定された引数は、
#   $1
#   $2
# の$#個です。
# __EOT__

template_id=${1:-9001}
template_os=${2:-ubuntu-jammy}

VALUE=9000
if [ "$template_id" -gt $VALUE ]; then
    # ここに VALUE の値が 0 より大きかった場合の処理を記載します。
    echo "${GIT_REPO_URL}${template_os}.sh ${template_id}"
    /bin/bash <(curl -s "${GIT_REPO_URL}${template_os}.sh ${template_id}")
    echo "${GIT_REPO_URL}"
    # source "$(dirname "$0")"/"echo_test.sh" $template_id $template_os
else
    echo -e "\033[31mcreate_id が $VALUE より小さいです。\033[m"
    exit 1 # 終了します。
fi

exit 0
