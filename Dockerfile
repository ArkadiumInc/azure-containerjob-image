FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    jq \
    git \
    iputils-ping \
    libcurl4 \
    libicu60 \
    libunwind8 \
    netcat \
    libssl1.0 \
    python3.8 \
    && rm -rf /var/lib/apt/lists/*
    
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash \
  && rm -rf /var/lib/apt/lists/*
ENV TARGETARCH=linux-x64
CMD ["bash"]
