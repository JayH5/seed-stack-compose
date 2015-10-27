FROM praekelt/mesos

EXPOSE 5050

CMD ["mesos-master", "--registry=in_memory"]
