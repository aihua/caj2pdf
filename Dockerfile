# syntax=docker/dockerfile:1

FROM python:3-slim-bullseye

WORKDIR /app

# Use the mirror from aliyun.com
COPY sources.list /etc/apt/

COPY requirements.txt requirements.txt
RUN apt-get update && apt-get -y upgrade && apt-get install -y mupdf-tools && pip3 install -r requirements.txt

COPY . .


ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/app/lib/bin
