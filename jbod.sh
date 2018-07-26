yum intall lvm2

pvcreate /dev/xvdb
pvcreate /dev/xvdc

vgcreate vg0 /dev/xvd[bc]

lvcreate -l 100%FREE -n lvol1 vg0

mkfs.ext4 /dev/vg0/lvol1

mount /dev/vg0/lvol1 /data

# Auto mount
# vi /etc/fstab

# /dev/vg0/lvol1  /data ext4  defaults  0 0

