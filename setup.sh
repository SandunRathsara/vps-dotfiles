#!/usr/bin/zsh

# Install apt packages
apt_install() {
  sudo apt install build-essential stow zsh unzip tmux
}

# Inspall yazi packages
snap_install() {
  sudo snap install --classic bash-language-server
  sudo snap install --classic nvim
}

# Special function to install yazi
install_yazi() {
  wget -qO ~/downloads/yazi.zip https://github.com/sxyazi/yazi/releases/latest/download/yazi-x86_64-unknown-linux-gnu.zip
  unzip -q ~/downloads/yazi.zip -d ~/downloads/yazi-temp
  sudo mv ~/downloads/yazi-temp/*/yazi /usr/local/bin
}

# Special function to setup tpm for tmux
setup_tpm() {
  # clone the tpm repo
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  # install the plugins
  ~/.tmux/plugins/tpm/bin/install_plugins
}

main() {
  # Simlink farm
  stow .

  # Create downloads folder
  mkdir -p ~/downloads

  # Install apt packages
  apt_install
  # Install snap packages
  snap_install

  # Install yazi
  install_yazi

  # Setup tmux
  setup_tpm
}

main "$@"
