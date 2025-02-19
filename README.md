# Initial setup

## SSH Hardening
Change the bellow values in the respective files

### 1. sshd_config
```sh
sudo vim /etc/ssh/sshd_config
```
- PasswordAuthentication no
- PermitRootLogin no
- UsePAM no

### 2. sshd_config.d/50-cloud-init.conf
```sh
sudo vim /etc/ssh/sshd_config.d/50-cloud-init.conf
```
- PasswordAuthentication no

## Enable chsh to run without password

```sh
sudo vim /etc/pam.d/chsh
```
Replace following line,
```
auth      required      pam_shells.so
```
With Following,
```
auth     sufficient      pam_shells.so
```

## Setup the server
### Steps
- 1. Clone the repo
- 2. cd into .dotfiles directory
- 3. Give execution permission to the setup file
- 4. Run the setup file

```sh
git clone https://SandunRathsara@github.com/SandunRathsara/vps-dotfiles.git ~/.dotfiles
cd ~/.dotfiles
sudo chmod +x ./setup.sh
./setup.sh
```
