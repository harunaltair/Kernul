### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# global properties
properties() { '
kernel.string=SleepX Kernel by ImSleep
do.devicecheck=1
do.modules=0
do.systemless=0
do.cleanup=1
do.cleanuponabort=0
device.name1=peridot
supported.versions=14 - 16
supported.patchlevels=
supported.vendorpatchlevels=
'; } # end properties

### AnyKernel install
## boot shell variables
block=boot
is_slot_device=auto
ramdisk_compression=auto
patch_vbmeta_flag=auto
no_magisk_check=1

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh

# Print banner if it exists
if [ -f "$AKHOME/banner" ]; then
  ui_print " "
  while IFS= read -r line; do
    ui_print "$line"
  done < "$AKHOME/banner"
  ui_print " "
else
  ui_print "  SleepX Kernel Installer"
fi

ui_print "=========================================="
ui_print "      Device: Xiaomi POCO F6 (Peridot)"
ui_print "      Kernel: SleepX Kernel"
ui_print "      Author: ImSleep"
ui_print "=========================================="
ui_print " "
ui_print "Installing..."


# boot install
split_boot
if [ -f "split_img/ramdisk.cpio" ]; then
    unpack_ramdisk
    write_boot
else
    flash_boot
fi
## end boot install
