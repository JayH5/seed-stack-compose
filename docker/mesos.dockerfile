FROM praekelt/debian-base

# Add the mesosphere repo
RUN echo "deb http://repos.mesosphere.io/debian/ jessie main" > /etc/apt/sources.list.d/mesosphere.list \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF

# Add the backports repo for OpenJDK 8
RUN echo "deb http://http.debian.net/debian jessie-backports main" > /etc/apt/sources.list.d/jessie-backports.list

# The mesos install messes with the python site-packages
# This breaks later python installs. Install python now to fix things
RUN $APT_GET_INSTALL mesos=0.25.0-0.2.70.debian81 python2.7
