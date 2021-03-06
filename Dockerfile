FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    apt-utils \
    curl \
    jq \
    git \
    iputils-ping \
    libcurl4 \
    gnupg \
    lsb-release \
    libunwind8 \
    netcat \
    libssl1.0 \
    python3.8 \
    azure-cli \
    && rm -rf /var/lib/apt/lists/* && echo 'alias python="python3"' >> ~/.bashrc

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg |  gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg &&\
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" |  tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update && apt-get install docker-ce docker-ce-cli containerd.io

ENV TARGETARCH=linux-x64
CMD ["bash"]
