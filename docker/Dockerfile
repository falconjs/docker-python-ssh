FROM python:latest

ARG SSH_MASTER_USER
ARG SSH_MASTER_PASS

# replace China source for software downloading
RUN sed -i s@/deb.debian.org/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN sed -i s@/security.debian.org/@/mirrors.aliyun.com/@g /etc/apt/sources.list

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    nano \
    sudo \
    vim \
    openssh-server

# setup ssh config
RUN mv /etc/ssh/ssh_config /etc/ssh/ssh_config.bak
RUN mv /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
COPY ssh_config /etc/ssh/ssh_config
COPY sshd_config /etc/ssh/sshd_config

# execute script to create user in docker
COPY user.sh /usr/local/bin/user.sh
RUN chmod +x /usr/local/bin/user.sh
RUN /usr/local/bin/user.sh

# setup startup script in docker
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# install python package
COPY requirement.txt /home/master/requirement.txt


CMD tail -f /dev/null
