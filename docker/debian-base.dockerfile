FROM debian:jessie
MAINTAINER Praekelt Foundation <dev@praekeltfoundation.org>

ADD ./scripts/apt-get-install.sh /apt-get-install.sh
ENV APT_GET_INSTALL /apt-get-install.sh
