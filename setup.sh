#!/usr/bin/zsh

# declar -a apt_packs=(
#   build-essential stow zsh
# )

snap_install() {
  sudo snap install --classic bash-language-server
  sudo snap install --classic nvim
}

main() {
  # install apt packs
  snap_install

  # Simlink farm
  stow .

  #=== Setup tmux config with tpm
  # clone the tpm repo
  # git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  # install the plugins
  # ~/.tmux/plugins/tpm/bin/install_plugins
}

main "$@"
