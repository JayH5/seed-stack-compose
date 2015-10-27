FROM praekelt/debian-base

RUN $APT_GET_INSTALL zookeeper=3.4.5+dfsg-2

# Remove config, will be written by setup script
RUN rm /etc/zookeeper/conf/zoo.cfg && \
    rm /var/lib/zookeeper/myid

EXPOSE 2181 2888 3888

VOLUME ["/var/lib/zookeeper", "/var/log/zookeeper"]

ENV PATH $PATH:/usr/share/zookeeper/bin

ADD ./scripts/configure-zk-and-run.sh /configure-zk-and-run.sh
CMD ["/configure-zk-and-run.sh", "zkServer.sh", "start-foreground"]
