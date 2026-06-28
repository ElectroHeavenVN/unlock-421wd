insmod /lib/modules/3.18.21/kernel/drivers/scsi/scsi_mod.ko
insmod /lib/modules/3.18.21/kernel/drivers/scsi/sd_mod.ko
insmod /lib/modules/3.18.21/kernel/drivers/usb/storage/usb-storage.ko
insmod /lib/modules/3.18.21/kernel/fs/nls/nls_cp936.ko
insmod /lib/modules/3.18.21/kernel/fs/nls/nls_utf8.ko
echo 0 > /sys/bus/usb/devices/1-1/authorized
echo 1 > /sys/bus/usb/devices/1-1/authorized

ls /dev/sd*
cat /proc/partitions | grep sd
mkdir -p /tmp/usb
mount -t ext3 /dev/sda1 /tmp/usb