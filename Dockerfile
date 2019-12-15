FROM ubuntu:18.04

LABEL mantainer="Sebastian Fiorentino <sfiorentino@mobeats.io>"

WORKDIR /tmp/pythonbuild

RUN apt-get update
RUN apt-get -y install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget curl
RUN wget https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tgz
RUN tar -xf Python-3.7.4.tgz

WORKDIR /tmp/pythonbuild/Python-3.7.4 

RUN sh configure --enable-optimizations --enable-loadable-sqlite-extensions
RUN make -j 8
RUN make altinstall

WORKDIR /tmp/pythonbuild
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3.7 get-pip.py

EXPOSE 8000