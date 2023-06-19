#!/bin/bash

create_id=${1:-9001}
template_id=${2:-9001}
template_os=${3:-ubuntu-jammy}


cat <<__EOT__
指定された引数は、
  $create_id
  $template_id
  $template_os
の$#個です。
__EOT__

VALUE=100
if [ "$create_id" -ge $VALUE ]; then
    # ここに VALUE の値が 0 より大きかった場合の処理を記載します。
    # source "$(dirname "$0")"/"create.sh" $create_id
    source "$(dirname "$0")"/"echo_test.sh" $create_id $template_id #for Debug
else
    echo -e "\033[31mcreate_id が $VALUE より小さいです。\033[m"
    exit 1 # 終了します。
fi

exit 0
