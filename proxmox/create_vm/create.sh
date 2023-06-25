# テンプレートから仮想マシンを作成する。
qm clone "${TEMPLATE_VMID}" "${VM_iD}" --name ubuntu
# SSHの認証に使用する公開鍵を設定する。
qm set "${VM_iD}" --sshkey ~/.ssh/id_ed25519.pub
# IPアドレスを設定する。
qm set "${VM_iD}" --ipconfig0 ip="${VM_IPADDRESS}"/24,gw=10.0.10.1 
# ディスクサイズを変更する。
qm resize "${VM_iD}" scsi0 32G

qm clone "${TEMPLATE_VMID}" "${VM_iD}" --name "${VM_NAME}"
qm set "${VM_iD}" --sshkey ~/.ssh/id_ed25519.pub
qm set "${VM_iD}" --ipconfig0 ip="${VM_IPADDRESS}",gw=10.0.0.254
qm resize "${VM_iD}" scsi0 "${DISK_SIZE}"
qm set "${VM_iD}" --memory "${MEM}"
qm start "${VM_iD}"
