FROM ansible/ubuntu14.04-ansible:stable
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
MAINTAINER Barak <barakb@gmail.com>

RUN apt-get update

RUN apt-get -y install wget
RUN wget --no-verbose -O /tmp/get-pip.py \
    https://bootstrap.pypa.io/get-pip.py

RUN python /tmp/get-pip.py

RUN pip install boto

RUN sudo apt-get -y install git

RUN git clone https://github.com/giga-dev/lc-ansible.git /lc-ansible