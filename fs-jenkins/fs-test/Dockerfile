FROM centos:7

RUN yum update -y && yum install -y wget vim initscripts git gem
ENV BRANCH=master

COPY ./run_test.sh /

