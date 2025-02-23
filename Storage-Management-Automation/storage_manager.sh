#!/bin/bash

#Display usage instructions
usage() {
  echo "Usage: $0 {create_lv|create_fs|mount_fs|resize_lv|resize_fs|create_snapshot|list_snapshots|remove_snapshot} [options]"
  exit 1
}

#Create a logical volume from a given volume group
#Usage: create_lv <vg_name> <lv_name> <size>
create_lv() {
  if [ $# -ne 3 ]; then
    echo "Usage: $0 create_lv <vg_name> <lv_name> <size>"
    exit 1
  fi
  local vg_name="$1"
  local lv_name="$2"
  local size="$3"
  echo "Creating logical volume '$lv_name' in volume group '$vg_name' with size $size..."
  lvcreate -L "$size" -n "$lv_name" "$vg_name"
  if [ $? -eq 0 ]; then
    echo "Logical volume '$lv_name' created successfully."
  else
    echo "Error: Failed to create logical volume '$lv_name'."
  fi
}

#Create a filesystem on a logical volume
#Usage: create_fs <lv_path> <fs_type> (Supported fs_type: ext4, xfs)
create_fs() {
  if [ $# -ne 2 ]; then
    echo "Usage: $0 create_fs <lv_path> <fs_type>"
    exit 1
  fi
  local lv_path="$1"
  local fs_type="$2"
  echo "Creating filesystem of type '$fs_type' on $lv_path..."
  if [ "$fs_type" == "ext4" ]; then
    mkfs.ext4 "$lv_path"
  elif [ "$fs_type" == "xfs" ]; then
    mkfs.xfs "$lv_path"
  else
    echo "Error: Unsupported filesystem type '$fs_type'. Supported types: ext4, xfs."
    exit 1
  fi
  if [ $? -eq 0 ]; then
    echo "Filesystem created successfully on $lv_path."
  else
    echo "Error: Failed to create filesystem on $lv_path."
  fi
}

#Mount a filesystem at a specified mount point
#Usage: mount_fs <lv_path> <mount_point>
mount_fs() {
  if [ $# -ne 2 ]; then
    echo "Usage: $0 mount_fs <lv_path> <mount_point>"
    exit 1
  fi
  local lv_path="$1"
  local mount_point="$2"
  echo "Mounting $lv_path at $mount_point..."
  mkdir -p "$mount_point"
  mount "$lv_path" "$mount_point"
  if [ $? -eq 0 ]; then
    echo "Mounted $lv_path at $mount_point successfully."
  else
    echo "Error: Failed to mount $lv_path at $mount_point."
  fi
}

#Resize a logical volume
#Usage: resize_lv <lv_path> <new_size>
resize_lv() {
  if [ $# -ne 2 ]; then
    echo "Usage: $0 resize_lv <lv_path> <new_size>"
    exit 1
  fi
  local lv_path="$1"
  local new_size="$2"
  echo "Resizing logical volume $lv_path to size $new_size..."
  lvresize -L "$new_size" "$lv_path" -y
  if [ $? -eq 0 ]; then
    echo "Logical volume resized successfully."
  else
    echo "Error: Failed to resize logical volume."
  fi
}

#Resize a filesystem after logical volume resize
#Usage: resize_fs <lv_path> <mount_point>
resize_fs() {
  if [ $# -ne 2 ]; then
    echo "Usage: $0 resize_fs <lv_path> <mount_point>"
    exit 1
  fi
  local lv_path="$1"
  local mount_point="$2"
  
  #Determine the filesystem type on the logical volume
  local fs_type
  fs_type=$(blkid -o value -s TYPE "$lv_path")
  
  echo "Resizing filesystem on $lv_path (type: $fs_type)..."
  if [ "$fs_type" == "ext4" ]; then
    resize2fs "$lv_path"
  elif [ "$fs_type" == "xfs" ]; then
    xfs_growfs "$mount_point"
  else
    echo "Error: Unsupported filesystem type '$fs_type' for resizing."
    exit 1
  fi
  
  if [ $? -eq 0 ]; then
    echo "Filesystem resized successfully."
  else
    echo "Error: Failed to resize filesystem."
  fi
}

#Create a snapshot of a logical volume
#Usage: create_snapshot <vg_name> <lv_name> <snapshot_name> <snapshot_size>
create_snapshot() {
  if [ $# -ne 4 ]; then
    echo "Usage: $0 create_snapshot <vg_name> <lv_name> <snapshot_name> <snapshot_size>"
    exit 1
  fi
  local vg_name="$1"
  local lv_name="$2"
  local snapshot_name="$3"
  local snapshot_size="$4"
  echo "Creating snapshot '$snapshot_name' of logical volume '$lv_name' with size $snapshot_size..."
  lvcreate -s -L "$snapshot_size" -n "$snapshot_name" "/dev/$vg_name/$lv_name"
  if [ $? -eq 0 ]; then
    echo "Snapshot '$snapshot_name' created successfully."
  else
    echo "Error: Failed to create snapshot '$snapshot_name'."
  fi
}

#List all snapshots in a volume group
#Usage: list_snapshots <vg_name>
list_snapshots() {
  if [ $# -ne 1 ]; then
    echo "Usage: $0 list_snapshots <vg_name>"
    exit 1
  fi
  local vg_name="$1"
  echo "Listing snapshots in volume group '$vg_name'..."
  lvs --options lv_name,origin,lv_attr --noheadings | grep "snapshot"
}

#Remove a snapshot
#Usage: remove_snapshot <vg_name> <snapshot_name>
remove_snapshot() {
  if [ $# -ne 2 ]; then
    echo "Usage: $0 remove_snapshot <vg_name> <snapshot_name>"
    exit 1
  fi
  local vg_name="$1"
  local snapshot_name="$2"
  echo "Removing snapshot '$snapshot_name' from volume group '$vg_name'..."
  lvremove -y "/dev/$vg_name/$snapshot_name"
  if [ $? -eq 0 ]; then
    echo "Snapshot '$snapshot_name' removed successfully."
  else
    echo "Error: Failed to remove snapshot '$snapshot_name'."
  fi
}

#Process the command provided by the user
if [ $# -lt 1 ]; then
  usage
fi

command="$1"
shift

case "$command" in
  create_lv)
    create_lv "$@"
    ;;
  create_fs)
    create_fs "$@"
    ;;
  mount_fs)
    mount_fs "$@"
    ;;
  resize_lv)
    resize_lv "$@"
    ;;
  resize_fs)
    resize_fs "$@"
    ;;
  create_snapshot)
    create_snapshot "$@"
    ;;
  list_snapshots)
    list_snapshots "$@"
    ;;
  remove_snapshot)
    remove_snapshot "$@"
    ;;
  *)
    echo "Error: Unknown command '$command'"
    usage
    ;;
esac
