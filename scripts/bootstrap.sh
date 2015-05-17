#!/bin/bash -
set -e

# Download and install Command Line Tools, if needed.
if [[ ! -x /usr/bin/gcc ]]; then
    xcode-select --install
fi

# Download and install Homebrew, if needed.
if [[ ! -x /usr/local/bin/brew ]]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Download and install Ansible, if needed.
if [[ ! -x /usr/local/bin/ansible ]]; then
    brew update
    brew install ansible
fi
