# Generate mqtt config
#!/bin/sh


config_file=$1

# Default value
DeviceVendor=$(/userfs/bin/tcapi get Gpon_Onu EquipmentId)
DeviceSerial=$(/userfs/bin/tcapi get Gpon_Onu SerialNumber)

sed -i "s/^DeviceVendor = .*/DeviceVendor = $DeviceVendor/" "$config_file"
sed -i "s/^DeviceSerial = .*/DeviceSerial = $DeviceSerial/" "$config_file"

exit 0