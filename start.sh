#!/bin/bash

# バイナリの起動をログファイルを使って監視
./engine/engine > engine.log 2>&1 &

# "Uvicorn running" が出るまで（エンジン起動まで）ループで待機
while ! grep -q "Uvicorn running on" engine.log; do
    sleep 0.2
done

color="\033[1;32m"
color_default="\033[0m"


# エンジン起動後にカスタムメッセージを表示
echo -e "${color}INFO${color_default}    running on http://127.0.0.1:50033 (Press CTRL+C to quit)"

# socatでポート中継
socat TCP-LISTEN:50033,fork TCP:127.0.0.1:50032
