# syntax=docker/dockerfile:1

FROM python:slim

WORKDIR /app

# Use the mirror from aliyun.com
COPY sources.list /etc/apt/

COPY requirements.txt requirements.txt
RUN apt-get update && apt-get -y upgrade && apt-get install -y mupdf-tools \
    && pip3 install --no-cache-dir -r requirements.txt -i https://mirrors.aliyun.com/pypi/simple/ --trusted-host=mirrors.aliyun.com

COPY . .


ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/app/lib/bin
