# Storage Management Automation

This project provides a bash script to automate common storage management tasks on servers. The script is designed for system administrators and performs operations such as creating logical volumes, making filesystems, mounting them, resizing volumes and filesystems, and managing snapshots for backup purposes.

## Features

- **Create Logical Volumes:** Easily create logical volumes from specified volume groups.
- **Create Filesystems:** Format logical volumes with a chosen filesystem (supports `ext4` and `xfs`).
- **Mount Filesystems:** Mount the newly created filesystems to desired mount points.
- **Resize Volumes and Filesystems:** Resize logical volumes and automatically adjust the filesystem size.
- **Snapshot Management:** Create, list, and remove snapshots for backup and recovery.

## Requirements

- Linux operating system with LVM installed.
- Tools such as `lvcreate`, `lvresize`, `mkfs.ext4`, `mkfs.xfs`, `mount`, `resize2fs`, and `xfs_growfs` should be available.
- Root or sudo privileges to perform storage operations.

## Usage

Run the script with the following commands:

```bash
# Create a Logical Volume
./storage_manager.sh create_lv myvg mylv 10G

# Create a Filesystem (ext4 or xfs)
./storage_manager.sh create_fs /dev/myvg/mylv ext4

# Mount a Filesystem
./storage_manager.sh mount_fs /dev/myvg/mylv /mnt/data

# Resize a Logical Volume
./storage_manager.sh resize_lv /dev/myvg/mylv +5G

# Resize a Filesystem
./storage_manager.sh resize_fs /dev/myvg/mylv /mnt/data

# Create a Snapshot
./storage_manager.sh create_snapshot myvg mylv mylv_snap 1G

# List Snapshots
./storage_manager.sh list_snapshots myvg

# Remove a Snapshot
./storage_manager.sh remove_snapshot myvg mylv_snap
```

PS - My first long Bash script...feels good to see it working! 😃
