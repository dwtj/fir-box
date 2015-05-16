#!/bin/bash -

# Download and install Command Line Tools
if [[ ! -x /usr/bin/gcc ]]; then
    xcode-select --install
fi
