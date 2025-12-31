ARG VERSION=1.23
FROM golang:${VERSION}-bookworm

LABEL author="SleepyNeko Studios" maintainer="admin@sleepyneko.com"

# 1. 安裝基礎工具 (包含 Git, SSL 支援,時區, iproute2 用於除錯)
RUN apt-get update && apt-get install -y \
    git \
    curl \
    ca-certificates \
    tzdata \
    iproute2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 2. 建立 Container 使用者
RUN useradd -m -d /home/container container

# 3. [Shield 核心] 注入自簽 CA
COPY ./discord-shield.crt /usr/local/share/ca-certificates/discord-shield.crt
RUN update-ca-certificates

# 4. 設定環境變數 (確保 Go 信任系統憑證)
ENV SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
ENV USER=container HOME=/home/container

USER container
WORKDIR /home/container

# 5. 複製 Entrypoint
COPY --chown=container:container ./go/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
