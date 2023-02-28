FROM ubuntu:latest

RUN apt-get update && apt-get install acl

COPY iac.sh /usr/local/bin/iac.sh