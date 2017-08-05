FROM ubuntu:14.04
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install make \
                       vim \
                       python-setuptools \
                       wget \
                       git \
                       build-essential \
                       python-dev
RUN easy_install pip
RUN pip install docker-py six boto
RUN git clone git://github.com/ansible/ansible.git --recursive /tmp/ansible
RUN cd /tmp/ansible; git submodule --init --recursive; make; make install
ENV ANSIBLE_HOST_KEY_CHECKING=False
WORKDIR /ansible
CMD ["/bin/bash"]
                       
