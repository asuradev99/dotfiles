# Dotfiles



### Starting from Scratch

Here is a complete set of instructions to set up an Arch + btrfs install with my config files: 


1. Get an Arch linux ISO and do steps `1.1` through `1.9` in the [Arch Linux installation guide](https://wiki.archlinux.org/title/installation_guide).

- For step `1.9`, my selected layout is 

| Mount point | Partition | Partition type | FS Type     | Bootable flag | Size   |
|-------------|-----------|---------------------|-----------|----|--------|
| `/boot/efi`       | `/dev/sda1`  or `/dev/nvme0n1p1` | EFI System Partition| FAT32 | Yes           | 512 MiB|
| [SWAP]      | `/dev/sda2` or `/dev/nvme0n1p2`| Linux swap | SWAP          | No            | 16 GiB |
| /           | `/dev/sda3` or `/dev/nvme0n1p3` | Linux | BTRFS       | No            | --- |


2. Now we format the filesystem and create the requisite BTRFS subvolumes, excluding directories that shouldn't be kept in snapshots.

First, format the partitions, then mount the main one: 

  ```
  mkfs.fat -F 32 /dev/sda1
  mkfs.btrfs /dev/sda3
  mount /dev/sda3 /mnt
  ```

  Next, create the subvolumes: 

```
btrfs su cr /mnt/@ 
btrfs su cr /mnt/@home 
btrfs su cr /mnt/@root 
btrfs su cr /mnt/@srv 
btrfs su cr /mnt/@log 
btrfs su cr /mnt/@cache 
btrfs su cr /mnt/@tmp

umount /mnt
```

Now to prepare the fstab file, we need to mount the subvolumes in a specific way: 
```
#mount root partition with compression and other settings
mount -o defaults,noatime,compress=zstd,commit=120,subvol=@ /dev/sda3 /mnt

#make the required directories 
mkdir -p /mnt/{home,root,srv,var/log,var/cache,tmp}

TODO

```







```hyprland fish exa kitty zathura nvim eww nwg-look adwaita-dark```
