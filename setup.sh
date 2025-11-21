#!/bin/sh

# Installing standard packages.
sudo apt-get install --yes neofetch zsh git wget curl jq uidmap build-essential bsdmainutils cmake guix
sudo apt-get update --yes

# Installing dotfiles.
curl --silent https://api.github.com/meta | jq --raw-output '"github.com "+.ssh_keys[]' >> $HOME/.ssh/known_hosts
cd $HOME && yes | sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply --ssh jvanhare
$HOME/bin/chezmoi update --force

# Updating guix.
guix pull -C channels.scm --url=https://codeberg.org/guix/guix-mirror
