#!/usr/bin/env bash

## Do not run this from within a VM

base=https://github.com/docker/machine/releases/download/v0.16.0
curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine
sudo mv /tmp/docker-machine /usr/local/bin/docker-machine
chmod +x /usr/local/bin/docker-machine

promptbase=https://raw.githubusercontent.com/docker/machine/v0.16.0
for i in docker-machine-prompt.bash docker-machine-wrapper.bash docker-machine.bash
do
  sudo wget "$promptbase/contrib/completion/bash/${i}" -P /etc/bash_completion.d
done
