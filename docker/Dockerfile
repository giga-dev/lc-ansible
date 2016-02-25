FROM ansible/ubuntu14.04-ansible:stable
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
MAINTAINER Barak <barakb@gmail.com>

RUN apt-get update

RUN sudo apt-get -y install git

RUN git clone https://github.com/giga-dev/lc-ansible.git /lc-ansible