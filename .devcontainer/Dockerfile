FROM mcr.microsoft.com/devcontainers/cpp:1-ubuntu-24.04

ARG REINSTALL_CMAKE_VERSION_FROM_SOURCE="3.22.2"

# Optionally install the cmake for vcpkg
COPY ./reinstall-cmake.sh /tmp/

RUN if [ "${REINSTALL_CMAKE_VERSION_FROM_SOURCE}" != "none" ]; then \
        chmod +x /tmp/reinstall-cmake.sh && /tmp/reinstall-cmake.sh ${REINSTALL_CMAKE_VERSION_FROM_SOURCE}; \
    fi \
    && rm -f /tmp/reinstall-cmake.sh

# [Optional] Uncomment this section to install additional vcpkg ports.
# RUN su vscode -c "${VCPKG_ROOT}/vcpkg install <your-port-name-here>"

# [Optional] Uncomment this section to install additional packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

ENV LANG=en_US.UTF-8
RUN apt update
RUN apt install -y build-essential libssl-dev \
    autoconf \
    cmake \
    git \
    libbz2-dev \
    libcurl4-openssl-dev \
    libncurses-dev \
    libboost-dev \
    libboost-thread-dev \
    libboost-iostreams-dev \
    libboost-date-time-dev \
    libboost-system-dev \
    libboost-filesystem-dev \
    libboost-program-options-dev \
    libboost-chrono-dev \
    libboost-test-dev \
    libboost-context-dev \
    libboost-regex-dev \
    libboost-coroutine-dev \
    libtool \
    doxygen \
    libzstd-dev \
    lzma-dev \
    liblz-dev \
    liblzma-dev \
    liblz1 \
    libgnatcoll-lzma-dev \
    ca-certificates

RUN apt upgrade -y


