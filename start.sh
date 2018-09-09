#!/bin/bash

### Install Command Line Tools
echo "?? :: CLI TOOLS"
which make > /dev/null \
    && echo "ok: CLI already installed!" \
    || xcode-select --install

### Install Homebrew if not installed.
echo "?? :: Homebrew"
which brew > /dev/null \
    && echo "ok: Brew already installed!" \
    || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

### Install Ansible if not installed.
echo "?? :: Ansible"
which ansible > /dev/null \
    && echo "ok: Ansible already installed!" \
    || brew install ansible

### Run the playbook
ansible-playbook -i "localhost," -c local --become-method=su playbook.yml
