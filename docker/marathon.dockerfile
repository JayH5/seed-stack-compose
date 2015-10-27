FROM praekelt/mesos

RUN $APT_GET_INSTALL marathon=0.11.1-1.0.432.debian81

EXPOSE 8080

CMD ["marathon", "--no-logger"]
