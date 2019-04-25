FROM ubuntu:18.04
RUN apt-get update && apt-get install -y \
libffi-dev \
ca-certificates \
gcc make \
musl-dev \
git \
sshpass \
libxml2-dev \
libxslt-dev \
python3 \
python3-dev \
python3-pip \
rsync
RUN python3 -m pip install ansible==2.5.2
RUN git clone https://github.com/carlniger/napalm-ansible
RUN cp -r napalm-ansible/napalm_ansible/ /usr/local/lib/python3.6/dist-packages/
RUN cd napalm-ansible && python3 setup.py install
RUN sed -i 's/for key in result.keys():/for key in list(result):/g' /usr/local/lib/python3.6/dist-packages/ansible/plugins/action/asa_config.py
