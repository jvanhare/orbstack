#!/bin/sh

# Installing standard packages.
sudo apt-get install --yes neofetch zsh git wget curl jq uidmap build-essential bsdmainutils cmake guix
sudo apt-get update --yes

# Installing dotfiles.
curl --silent https://api.github.com/meta | jq --raw-output '"github.com "+.ssh_keys[]' >> $HOME/.ssh/known_hosts
cd $HOME && yes | sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply --ssh jvanhare
$HOME/bin/chezmoi update --force

# Updating guix.
wget -O channels.scm https://raw.githubusercontent.com/jvanhare/orbstack/refs/heads/master/channels.scm
export GUIX_PROFILE="$HOME/.config/guix/current"
export PATH="$GUIX_PROFILE/bin:$PATH"
export INFOPATH="$GUIX_PROFILE/share/info:$INFOPATH"
export MANPATH="$GUIX_PROFILE/share/man:$MANPATH"
guix pull -C channels.scm --url=https://codeberg.org/guix/guix-mirror
