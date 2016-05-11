#docker #command #trick #cheatsheet

### show details about a container, including port mapping etc
```
docker inspect nostalgic_morse
```
```
docker inspect -f '{{ .NetworkSettings.IPAddress  }}' nostalgic_morse //narrow down the finding
```

### run a command
```
docker run ubuntu:14.04 /bin/echo 'Hello world'
```

### run interactive shell
```
docker run -t -i ubuntu:14.04 /bin/bash
```
or
```
docker run -t -i ubuntu:14.04
```
`-t` pseudo TTY
`-i` interactive shell

### daemonized infinity hello world
```
docker run -d ubuntu:14.04 /bin/sh -c "while true; do echo hello world; sleep 1; done"
```

### start a python app
```
docker run -d -P training/webapp python app.py
```

`-P` map port in container to host

### start app with port mapping
```
docker run -d -p 28888:5000 training/webapp python app.py
```

### list the port info
```
docker port nostalgic_morse 5000
```
output:
```
0.0.0.0:49155
```

### log that act like `tail -f` (logs will outout STDOUT)
```
docker logs -f nostalgic_morse
```

### find tags for a repo
```
dtf training/webapp
```

### find boot2docker ip
```
boot2docker ip
```


### container basic ops
```
docker [start|stop|rm] nostalgic_morse
```
`rm` support `-f` to forcefully stop and remove


### show docker images
```
docker images
```

### images search
```
docker search node
```
will find node.js official repo

### pull images
```
docker pull centos
```


# 2 ways to create own image

### first way:

```
docker run -t -i training/sinatra /bin/bash
gem install json
docker commit -m "Added json gem" -a "Kate Smith" 0b2616b0e5a8 ouruser/sinatra:v2
```

### second way:
```
mkdir sinatra
cd sinatra
touch Dockerfile
```
Dockerfile:
```
FROM ubuntu:14.04
MAINTAINER Kate Smith <ksmith@example.com>
RUN apt-get update && apt-get install -y ruby ruby-dev
RUN gem install sinatra
```


### forward ssh key
```
docker run --name="integration_test" --privileged -t -i -v $(dirname $SSH_AUTH_SOCK):$(dirname $SSH_AUTH_SOCK) -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK ubuntu:latest /bin/bash
```

### docker default network is `bridge`
```
docker run -itd --name=networktest ubuntu
```

will add this container to bridge

### disconnect container from network
```
docker network disconnect bridge networktest
```

### create new bridge network
```
docker network create -d bridge my-bridge-network
```
`-d` driver (default is bridge, so can left off)

# bind to ip
```
docker run -d -p 127.0.0.1:80:5000 training/webapp python app.py
```

# bind to ip (dynamic port)
```
docker run -d -p 127.0.0.1::5000 training/webapp python app.py
```


# learning resource

https://github.com/jenkinsci/docker/blob/master/Dockerfile
https://github.com/docker-library/postgres/blob/master/Dockerfile.template
https://github.com/docker-library/postgres/blob/master/docker-entrypoint.sh
https://github.com/docker-library/rails/blob/master/Dockerfile
https://github.com/docker-library/rails/blob/master/update.sh
