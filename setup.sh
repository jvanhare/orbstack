#!/bin/sh

# Installing standard packages.
sudo apt-get install --yes neofetch zsh git wget curl jq guix build-essential bsdmainutils
sudo apt-get update --yes

# Installing dotfiles.
curl --silent https://api.github.com/meta | jq --raw-output '"github.com "+.ssh_keys[]' >> $HOME/.ssh/known_hosts
cd $HOME && yes | sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply --ssh jvanhare
$HOME/bin/chezmoi update --force

# Updating guix.
guix pull
guix install glibc-locales
guix package -u
