FROM jenkins:2.0

USER root
RUN apt-get -qq update \
      && apt-get -qq install -y sudo vim  \
      && rm -rf /var/lib/apt/lists/*

RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
USER jenkins

RUN curl -fsSL https://get.docker.com/ | sh
RUN curl -fsSL https://get.docker.com/gpg | sudo apt-key add -
