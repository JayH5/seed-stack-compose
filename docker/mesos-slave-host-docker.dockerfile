FROM praekelt/mesos

# Install Docker. We only need the client but there doesn't seem any easy way to just install that yet
RUN $APT_GET_INSTALL apt-transport-https
RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D && \
    echo "deb https://apt.dockerproject.org/repo debian-jessie main" > /etc/apt/sources.list.d/docker.list
RUN $APT_GET_INSTALL docker-engine

# Docker containers are the only thing that (partially) makes sense to run from a container
RUN echo "docker" > /etc/mesos-slave/containerizers

# Mount the host cgroup and docker socket
VOLUME ["/sys/fs/cgroup", "/var/run/docker.sock"]

CMD ["mesos-slave"]
