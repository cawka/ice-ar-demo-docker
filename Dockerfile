FROM ubuntu:18.04

RUN echo "2019-07-03" && apt update && apt install -y software-properties-common build-essential git
RUN add-apt-repository -y ppa:named-data/ppa && apt update

RUN apt install -y libndn-cxx-dev libcrypto++-dev

RUN mkdir /icear
WORKDIR /icear
RUN git clone https://github.com/danameme/ndncert ndncert && cd ndncert && git checkout a69b5f3a379d3a08f7d4d91098d0162cca2d8394

WORKDIR /icear/ndncert
RUN ./waf configure && \
    ./waf build -j1 && \
    ./waf install && \
    ./waf clean
RUN ldconfig

WORKDIR /

RUN mkdir /cert-home
ENV HOME=/cert-home

