wget https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img
qm create $1 --memory 2048 --net0 virtio,bridge=vmbr0
qm importdisk $1 jammy-server-cloudimg-amd64.img $3
qm set $1 --scsihw virtio-scsi-pci --scsi0 $3:vm-$1-disk-0
qm set $1 --ide2 $3:cloudinit
qm set $1 --boot c --bootdisk scsi0
qm set $1 --serial0 socket --vga serial0
qm template $1
qm set $1 --name $2
rm -f jammy-server-cloudimg-amd64.img
