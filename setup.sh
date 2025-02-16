#!/usr/bin/bash

# Install apt packages
apt_install() {
  sudo apt update && sudo apt upgrade -y
  sudo apt install build-essential stow zsh unzip tmux neofetch btop
}

# Inspall yazi packages
snap_install() {
  sudo snap install --classic bash-language-server
  sudo snap install --classic nvim
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

  # Setup tmux
  setup_tpm

  # Change the default shell
  chsh -s /usr/bin/zsh
}

main "$@"
