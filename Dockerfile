ARG UBUNTU_VERSION=xenial
FROM ubuntu:$UBUNTU_VERSION
ARG UBUNTU_VERSION

LABEL maintainer "srz_zumix <https://github.com/srz-zumix>"

RUN apt-get update && \
    apt-get install -y software-properties-common apt-transport-https ca-certificates wget && \
    wget -O - https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB 2>/dev/null | apt-key add - && \
    add-apt-repository -y "deb https://apt.repos.intel.com/oneapi all main" && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        g++ \
        git \
        make \
        intel-oneapi-compiler-dpcpp-cpp-and-cpp-classic \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    echo ". /opt/intel/oneapi/setvars.sh" >> ~/.bashrc

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
