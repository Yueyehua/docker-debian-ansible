FROM yueyehua/debian-python:latest
MAINTAINER Richard Delaplace "rdelaplace@yueyehua.net"
LABEL version="1.0.0"

# Install python3-pip tools
RUN \
  apt-get -qq update && \
  apt-get -qq install -y python3-pip && \
  apt-get -qq clean autoclean;

# Install Ansible and linters
RUN \
  pip3 install ansible ansible-lint && \
  pip3 install -U distribute;

# Mask failing services
RUN \
  systemctl mask -- \
    sys-fs-fuse-connections.mount \
    dev-hugepages.mount \
    systemd-tmpfiles-setup.service;

VOLUME ["/sys/fs/cgroup", "/run", "/run/lock"]
CMD  ["/lib/systemd/systemd"]
