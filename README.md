# debian_scripts

Scripts after Debian installation <br>

Sudo no password required:

<code>su</code>
<code>echo "username  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/username</code>

Use:

text mode: <code>bash ./main-menu.sh</code>
dialog mode: <code>bash ./menu.sh</code>

install apache and https configuration with self-signed certificate<br>
install firewall and add basic rules<br>
set grub timeout<br>
install and config mariadb 10.5<br>
install and config php 8.1<br>
create ssh key and add to ssh-agent<br>
config swap to ram<br>
install or remove service using systemd<br>
install utilities ( build-essentials, restricted-extras, Microsoft font compatibility )<br>