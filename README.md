# Initial setup

## SSH Hardening
Change the bellow values in the respective files

### 1. sshd_config
```sh
sudo vim /etc/ssh/sshd_config
```
PasswordAuthentication no
PermitRootLogin no
UsePAM no

### 2. sshd_config.d/50-cloud-init.conf
```sh
sudo vim /etc/ssh/sshd_config.d/50-cloud-init.conf
```
PasswordAuthentication no

### 3. /etc/pam.d/chsh
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

## Run setup script

### 1. Clone the repo
```sh
git clone https://SandunRathsara@github.com/SandunRathsara/vps-dotfiles.git ~/.dotfiles
```

### 2. CD into dotfiles directory
```sh
cd ~/.dotfiles
```
### 3. Give execution permission to the setup file
```sh
sudo chmod +x ./setup.sh
```
### 4. Run the setup file
```sh
./setup.sh
```
