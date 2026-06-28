#!/bin/sh

VENDOR=$2

NIC="br-lan"
BINARY_DIR=/usr/bin
VCS_DIR=/etc/vcs
LOG_DIR=/var/log
VCS_CONTROLLER=vcs-controller
VCS_FILTERD=vcs-filterd
VCS_DEVICE_MONITOR=vcs-device-monitor
VCS_DEVICE_P0F=vcs-device-p0f

if [ "$VENDOR" = "VHT" ];
then
    NIC="br0"
    VCS_DIR=/data/vcs
    LOG_DIR=/data/log/vcs
fi

controller_init() {
    /bin/sh -c "$BINARY_DIR/$VCS_CONTROLLER -f $VCS_DIR/mqtt.conf"
}

controller_deinit() {
    pidof $VCS_CONTROLLER | xargs kill -2
}

filterd_init() {
    /bin/sh -c "$BINARY_DIR/vcs-filterd -n 4 -i $NIC -c $VCS_DIR/filterd.conf -s $VCS_DIR/init.sh -f $VCS_DIR/mqtt.conf -m ipt -p 600 &"
}

filterd_deinit() {
    pidof vcs-filterd | xargs kill -2 &&\
    pidof vcs-filterd | xargs kill -9
}

device_monitor_init() {
    /bin/sh -c "$BINARY_DIR/vcs-device-monitor -f $VCS_DIR/mqtt.conf &"
}

device_monitor_deinit() {
   pidof vcs-device-monitor | xargs kill -2
}

device_detect_init() {
    $BINARY_DIR/vcs-device-p0f -i $NIC -f $VCS_DIR/database.fp -s /tmp/device_pipe -m 100,100 -o /data/log/vcs/vcs_device_p0f.log -d 
}

device_detect_deinit() {
    pidof vcs-device-p0f | xargs kill -9
}

init() {
    filterd_init
    device_monitor_init
    # device_detect_init
}

deinit() {
    filterd_deinit
    device_monitor_deinit
    # device_detect_deinit
}

start() {
    deinit
    sleep 5
    init
}

$@