echo "Aktuálna verzia kernelu:"
uname -r
read -p 'Verzia ktorá sa bude buildovať (s): ' kernel_version
kernel_version="5.16.15"
wget <a href="https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-$kernel_version.tar.gz" rel="noopener" target="_blank">https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-$kernel_version.tar.gz</a>
Wget <a href="https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-$kernel_version.tar.sign" rel="noopener" target="_blank">https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-$kernel_version.tar.sign</a>
Tar xvzf linux-$kernel_version.tar.gz
cd linux-$kernel_version/
sudo cp -v /boot/config-$(uname -r) .config
sudo apt-get install build-essential linux-source bc kmod cpio flex libncurses5-dev libelf-dev libssl-dev dwarves -y
sudo make menuconfig

sudo make localmodconfig
sudo make bzImage
sudo make modules && sudo make modules_install
Sudo make install
sudo update-grub