FROM node
MAINTAINER awaterman@salesforce.com
LABEL Description="Vendor=\"Salesforce.com\" Version=\"1.0\""
RUN apt-get update && \
apt-get install -y libc6 vim && \
mkdir /home/cookie && \
groupadd -r cookie && useradd -r -g cookie cookie && \
usermod -a -G sudo cookie && \
chown -R cookie:cookie /home/cookie && \
chmod -R a+w /usr/local/lib/node_modules && \
chmod -R a+w /usr/local/bin
WORKDIR /home/cookie
USER cookie
RUN npm install -g istanbul
# Install dependencies
RUN npm install psl@1.1.31
ENV term=xterm-256color

