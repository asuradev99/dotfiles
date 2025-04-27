# Dotfiles



### Surface Pro Pre-Installation Instructions

(Taken from [SurfaceLinux Installation Guide]())

1. **Make a bootable USB**
    - Self-expanatory

2. **Shrink the windows partition**
    - This step can be skipped if you don't want to keep a Windows install
    - Go to Control Panel -> System and Security -> Administrative Tools -> Computer Management -> Storage -> Disk Management.
    - Right click on the Windows partition and shrink the volume as much as you'd like (a minimum of 50 GB is recommended).

3. **[Disable secure boot](https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/disabling-secure-boot)**
   - Only do this if your distribution doesn't support Secure Boot.
   - Fedora, Debian / Ubuntu and openSUSE all support it, while Arch installation media doesn't. (can enable after install)
   - If the USB doesn't boot because of verification errors, just disable it.

4. **[Boot into UEFI to change the boot order to allow booting from USB](https://support.microsoft.com/en-us/help/4023511/surface-boot-surface-from-a-usb-device)**.  If you're leaving secure boot enabled, make sure that it allows non-MS signatures ("Microsoft & 3rd party CA") 

5. **Install your distribution via a bootable USB.**
   - Tip: You can use the `toram` boot param on Ubuntu (or `copytoram=y` on Arch) which will copy the resources to RAM,
     allowing you to disconnect the USB and plug in an external keyboard.
   - Due to EFI installation bug happen on somewhere (This confirmed that the bug happens on Ubuntu, not sure if other distribution have this similar bug, see [this](https://itsfoss.com/intsall-ubuntu-on-usb/) for more information)
     - To install on other place than local disk: if you have any ESP-flagged partitions on local disk and any connected disks, you have to disconnect that disk (unmounting is not enough) from installer's system or the another way temporarily removing ESP-flagged. Then proceed installing. After that, restore removed-ESP-flagged if you have them removed.

Now proceed with the instructions in the steps below: 

### Starting from Scratch with Bootable USB

Here is a complete set of instructions to set up an Arch + btrfs install with my config files: 


#### Partition Formatting and Mounting

1. Get an Arch linux ISO and do steps `1.1` through `1.9` in the [Arch Linux installation guide](https://wiki.archlinux.org/title/installation_guide).

- For step `1.9`, my selected layout is 

| Mount point | Partition | Partition type | FS Type     | Bootable flag | Size   |
|-------------|-----------|---------------------|-----------|----|--------|
| `/boot/efi`       | `/dev/sda1`  or `/dev/nvme0n1p1` | EFI System Partition| FAT32 | Yes           | 512 MiB|
| [SWAP]      | `/dev/sda2` or `/dev/nvme0n1p2`| Linux swap | SWAP          | No            | 16 GiB |
| /           | `/dev/sda3` or `/dev/nvme0n1p3` | Linux | BTRFS       | No            | --- |


2. Now we format the filesystem and create the requisite BTRFS subvolumes, excluding directories that shouldn't be kept in snapshots.

First, format the partitions, then mount the main one: 

```
#format main partitions
mkfs.fat -F 32 /dev/sda1
mkfs.btrfs /dev/sda3

#setup swap partition
mkswap /dev/sda2
swapon /dev/sda2

mount /dev/sda3 /mnt
```

3. Next, create the subvolumes: 

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

To confirm that the correct subvolumes have been created, 

```
btrfs su li /mnt
```

4. Now to prepare the fstab file, we need to mount the subvolumes in a specific way: 
```
#mount root partition with compression and other settings
mount -o defaults,noatime,compress=zstd,commit=120,subvol=@ /dev/sda3 /mnt

#make the required directories 
mkdir -p /mnt/{home,root,srv,var/log,var/cache,tmp}

#mount each of the required subvolumes
mount -o defaults,noatime,compress=zstd,commit=120,subvol=@home /dev/sda3 /mnt/home

mount -o defaults,noatime,compress=zstd,commit=120,subvol=@root /dev/sda3 /mnt/root

mount -o defaults,noatime,compress=zstd,commit=120,subvol=@srv /dev/sda3 /mnt/srv

mount -o defaults,noatime,compress=zstd,commit=120,subvol=@log /dev/sda3 /mnt/var/log

mount -o defaults,noatime,compress=zstd,commit=120,subvol=@cache /dev/sda3 /mnt/var/cache

mount -o defaults,noatime,compress=zstd,commit=120,subvol=@tmp /dev/sda3 /mnt/tmp
```

Then, 

5. Mount the EFI partition: 

```
mkdir -p /mnt/boot/efi

mount /dev/sda1 /mnt/boot/efi
```

Make sure everything is mounted correctly with `lsblk`.

#### Package and Kernel Installation 

6. Select mirror servers in `/etc/pacman.d/mirrorlist`

7. Install essential packages on mounted system: 

```
pacstrap -K /mnt base linux linux-firmware {amd/intel}-ucode linux-firmware networkmanager vim man
```

8. Generate `fstab` file: 

```
genfstab -U /mnt >> /mnt/etc/fstab
```













```hyprland fish alacritty zathura nvim eww nwg-look adwaita-dark ```
