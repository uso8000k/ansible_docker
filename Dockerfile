# Base container
FROM alpine:latest
MAINTAINER https://github.com/uso8000k/

# Install required packages 
RUN apk update

## for bash toolkit
RUN apk add bash curl openssh-client

## for building Ansible
RUN apk add linux-headers build-base gcc
RUN apk add python-dev libffi-dev openssl-dev
RUN apk add py-pip

## Clean package caches
RUN rm -rf /var/cache/apk/*

# Install Ansible 
RUN pip install -U pip
RUN pip install -U ansible

## Add basic Ansible config
ADD ansible.cfg /root/
