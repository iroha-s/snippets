### local-lvm の場合 
```bash
export BRANCH=main
/bin/bash <(curl -s https://raw.githubusercontent.com/iroha-s/snippet/${BRANCH}/proxmox/create_vm/main.sh) 9001 ubuntu-jammy $BRANCH
```

```bash
export BRANCH=main
/bin/bash <(curl -s https://raw.githubusercontent.com/iroha-s/snippet/${BRANCH}/proxmox/create_template/main.sh) 9001 ubuntu-jammy $BRANCH
```

### local-zfs の場合
```bash
export BRANCH=main
/bin/bash <(curl -s https://raw.githubusercontent.com/iroha-s/snippet/${BRANCH}/proxmox/create_vm/main.sh) 9001 ubuntu-jammy $BRANCH local-zfs
```

```bash
export BRANCH=main
/bin/bash <(curl -s https://raw.githubusercontent.com/iroha-s/snippet/${BRANCH}/proxmox/create_template/main.sh) 9001 ubuntu-jammy $BRANCH local-zfs
```