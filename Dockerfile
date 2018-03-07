FROM ubuntu:16.04

RUN apt update && apt install -y curl libncurses5-dev alex nodejs && (curl -sSL https://get.haskellstack.org/ | sh)
RUN ln -s /usr/bin/nodejs /usr/bin/node

RUN useradd -m ghcjs
WORKDIR /home/ghcjs/.build-compiler
ADD stack.yaml stack.yaml
RUN chown -R ghcjs:ghcjs /home/ghcjs/.build-compiler

USER ghcjs
RUN stack setup &&\
    rm -f  /home/ghcjs/.stack/programs/x86_64-linux/ghc-7.10.3.installed &&\
    rm -rf /home/ghcjs/.stack/programs/x86_64-linux/ghc-7.10.3 &&\
    rm -f  /home/ghcjs/.stack/programs/x86_64-linux/*.tar.{xz,gz}

WORKDIR /home/ghcjs
ENV PATH=/home/ghcjs/.stack/programs/x86_64-linux/ghcjs-0.2.0.9006030_ghc-7.10.3/bin/:$PATH
