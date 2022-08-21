sudo modprobe nbd max_part=8
sudo qemu-nbd --connect=/dev/nbd0 /var/lib/libvirt/images/WinXP.qcow2
sudo fdisk /dev/nbd0 -l
sudo mount /dev/nbd0p1 /media/WinXP/