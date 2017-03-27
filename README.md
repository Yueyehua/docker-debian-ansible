debian-ansible
==============

This is a Debian Jessie docker image with ansible.
Linters is also installed in order to work with kitchen
for test purpose.

Prerequisites
-------------

- Docker

Usage
-----

```text
docker pull yueyehua/debian-ansible
docker run \
  -d \                                           # daemonize
  --privileged \                                 # for systemd
  -v /sys/fs/cgroup:/sys/fs/cgroup:ro \          # for systemd
  --name ansible \                               # container name
  -h ansible \                                   # hostname
  yueyehua/debian-ansible
docker exec -ti ansible bash
[Do something here]
docker stop ansible
docker rm ansible
```
