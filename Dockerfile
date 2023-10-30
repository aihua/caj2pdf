# syntax=docker/dockerfile:1

FROM python:slim

WORKDIR /app

# Use the mirror from aliyun.com
COPY sources.list /etc/apt/

COPY . .

RUN apt-get update && apt-get -y upgrade && apt-get install -y mupdf-tools \
    && pip3 install --no-cache-dir -r requirements.txt -i https://mirrors.aliyun.com/pypi/simple/ --trusted-host=mirrors.aliyun.com

# Compile libjbigdec.so if not using the compiled shared libary(.so file) in the git repository.
# WORKDIR /app/lib
# RUN apt-get install -y  build-essential libjbig2dec0-dev \
#    && cc -Wall -fPIC --shared -o bin/libjbigdec.so jbigdec.cc JBigDecode.cc
# WORKDIR /app

ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/app/lib/bin
