FROM python:3.12-slim

# Ensure all packages are updated to the latest security patches
RUN apt-get update && apt-get upgrade -y

ARG USERNAME=dev_user
ARG GROUPNAME=apol
ARG UID=1000
ARG GID=1000

#Group and USER
RUN groupadd -g $GID $GROUPNAME \
&& useradd -m -s /bin/bash -u $UID -g $GID $USERNAME \
&& apt-get update && apt-get install -y sudo git curl \
&& echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
&& chmod 0440 /etc/sudoers.d/$USERNAME 

USER $USERNAME
