#!/bin/bash -
set -e

BREW_CMD=/usr/local/bin/brew

# Download and install Command Line Tools, if needed.
if [[ ! -x /usr/bin/gcc ]]; then
    xcode-select --install
fi

# Download and install Homebrew, if needed.
if [[ ! -x "$BREW_CMD" ]]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Download and install Ansible, if needed.
if [[ ! -x /usr/local/bin/ansible ]]; then
    "$BREW_CMD" update
    "$BREW_CMD" install ansible
fi
