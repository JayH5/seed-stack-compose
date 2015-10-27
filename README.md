# seed-stack-compose
An alternative dev environment for the Praekelt Foundation "seed stack"

Uses Vagrant, Docker and docker-compose to set up a dev environment for a Mesos/Marathon cluster.

### Getting started
(Note this will require many large downloads.)

**Step 0:** [Install Vagrant](https://www.vagrantup.com/downloads.html)


**Step 1:** Clone the repo
```sh
git clone https://github.com/JayH5/seed-stack-compose.git
```

**Step 2:** Provision the Vagrant VM
```sh
cd seed-stack-compose
vagrant up
```

**Step 3:** Build the images (they're not in the Docker Hub yet...)
```sh
vagrant ssh
cd seed-stack-compose
./build-images.sh
```

**Step 4:** Launch the cluster
```sh
docker-compose up -d
```

### Further information
* The Mesos cluster runs on the host networking (i.e. `--net=host` was passed to `docker run`).
* Docker containers launched by Mesos run on the host Vagrant VM. There is no Docker-in-Docker magic here.

### Limitations
* Only the Docker Mesos containerizer is currently supported. Running a Mesos app with the Mesos containerizer inside a Docker container is misuse of Docker, in my opinion, as it requires starting up a whole init system. A better fit is using a full VM.
