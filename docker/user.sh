#!/bin/bash
set -e

printf "\n\033[37;44m---> Creating SSH master user.<---\033[0m\n"

# This file creates master user, assigns /home/master as home, ssh as user group and sets master as password.
# Apart from all that, it grants rm, mkdir, chown, useradd, deluser and chpasswd command usages with
# the help of sudo command. This user now can create a new SSH user and revert what he has done.
# The sftp group will be used for new SFTP users.

useradd -m -d /home/${SSH_MASTER_USER} -G ssh ${SSH_MASTER_USER} -s /bin/bash
echo "${SSH_MASTER_USER}:${SSH_MASTER_PASS}" | chpasswd
echo 'PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin"' >> /home/${SSH_MASTER_USER}/.profile

echo "${SSH_MASTER_USER} ALL=NOPASSWD:/bin/rm" >> /etc/sudoers
echo "${SSH_MASTER_USER} ALL=NOPASSWD:/bin/mkdir" >> /etc/sudoers
echo "${SSH_MASTER_USER} ALL=NOPASSWD:/bin/chown" >> /etc/sudoers
echo "${SSH_MASTER_USER} ALL=NOPASSWD:/usr/sbin/useradd" >> /etc/sudoers
echo "${SSH_MASTER_USER} ALL=NOPASSWD:/usr/sbin/deluser" >> /etc/sudoers
echo "${SSH_MASTER_USER} ALL=NOPASSWD:/usr/sbin/chpasswd" >> /etc/sudoers
echo "${SSH_MASTER_USER} ALL=NOPASSWD:/usr/local/bin/python" >> /etc/sudoers
echo "${SSH_MASTER_USER} ALL= /bin/sh" >> /etc/sudoers

exec "$@"
