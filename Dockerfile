FROM ubuntu:22.04

# 非対話モードにしておく
ENV DEBIAN_FRONTEND=noninteractive
# ポート中継に必要なsocatをインストール
RUN apt update && apt install -y \
    socat \
    && apt clean && rm -rf /var/lib/apt/lists/*

ARG ENGINE_NAME="COEIROINK_LINUX_CPU_v.2.11.2"
COPY ./${ENGINE_NAME} /opt/${ENGINE_NAME}
COPY ./start.sh /opt/${ENGINE_NAME}/start.sh
WORKDIR /opt/${ENGINE_NAME}

# バイナリやシェルスクリプトに実行権限を付与
RUN chmod +x ./engine/engine
RUN chmod +x ./start.sh
CMD ["./start.sh"]
