#!/bin/sh
set -eux

is_setup() {
  echo "Do you setup $1? [y/N]"
  while :
  do
    read -r answer
    case $answer in
      'yes' | 'y') return 0 ;;
      [nN]o | 'N') return 1 ;;
      *) echo "Try again because you input incorrect letter. Do you setup $1? [y/N]" ;;
    esac
  done
}

if [ "$(uname)" = 'Darwin' ]; then
  if is_setup 'Xcode Command Line Tools'; then
    xcode-select --install
  fi

  if is_setup 'Homebrew'; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    if [ "$(uname -m)" = 'arm64' ]; then
      export PATH=$PATH:/opt/homebrew/bin
    fi
  fi
fi

bin/setup

case "$(uname)" in
  "Darwin") ./bin/mitamae local $@ ./bootstrap.rb ;;
  *) ./bin/mitamae local $@ ./bootstrap.rb ;;
esac
