#!/usr/bin/bash

# Install apt packages
apt_install() {
  sudo apt update && sudo apt upgrade -y
  sudo apt install build-essential stow zsh fzf unzip tmux neofetch btop
}

# Inspall yazi packages
snap_install() {
  sudo snap install --classic bash-language-server
  sudo snap install --classic nvim
  sudo snap install aws-cli --classic
}

# Manual setup of powerlevel10k shell
setup_powerlevel10k() {
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
}

# Special function to install yazi
install_yazi() {
  wget -qO ~/downloads/yazi.zip https://github.com/sxyazi/yazi/releases/latest/download/yazi-x86_64-unknown-linux-gnu.zip
  unzip -q ~/downloads/yazi.zip -d ~/downloads/yazi-temp
  sudo mv ~/downloads/yazi-temp/*/yazi /usr/local/bin
}

# Install lazygit
install_lazygit() {
  cd ~/downloads

  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  tar xf lazygit.tar.gz lazygit
  sudo install lazygit -D -t /usr/local/bin/

  cd -
}

# Install lazydocker
install_lazydocker() {
  cd ~/downloads

  # map different architecture variations to the available binaries
  ARCH=$(uname -m)
  case $ARCH in
  i386 | i686) ARCH=x86 ;;
  armv6*) ARCH=armv6 ;;
  armv7*) ARCH=armv7 ;;
  aarch64*) ARCH=arm64 ;;
  esac

  # prepare the download URL
  GITHUB_LATEST_VERSION=$(curl -L -s -H 'Accept: application/json' https://github.com/jesseduffield/lazydocker/releases/latest | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
  GITHUB_FILE="lazydocker_${GITHUB_LATEST_VERSION//v/}_$(uname -s)_${ARCH}.tar.gz"
  GITHUB_URL="https://github.com/jesseduffield/lazydocker/releases/download/${GITHUB_LATEST_VERSION}/${GITHUB_FILE}"

  curl -Lo lazydocker.tar.gz $GITHUB_URL
  tar xf lazydocker.tar.gz
  sudo install lazydocker -D -t /usr/local/bin/

  cd -
}

# Special function to setup tpm for tmux
setup_tpm() {
  # clone the tpm repo
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  # install the plugins
  ~/.tmux/plugins/tpm/bin/install_plugins
}

main() {
  # Create downloads folder
  mkdir -p ~/downloads

  # Install apt packages
  apt_install
  # Install snap packages
  snap_install

  # Simlink farm
  stow .

  # Setup powerlevel10k
  setup_powerlevel10k

  # Install yazi
  install_yazi

  # Install lazygit
  install_lazygit

  # Install lazydocker
  install_lazydocker

  # Setup tmux
  setup_tpm

  # Change the default shell
  chsh -s /usr/bin/zsh
}

main "$@"
