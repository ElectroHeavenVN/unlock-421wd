#!/bin/sh

/userfs/bin/tcapi set InfoVoIP_Common SC_START_STATUS "No"
/userfs/bin/tcapi set InfoVoIPH248_Common START_STATUS "No"
usr/bin/killall sipclient 2>/dev/null
usr/bin/killall mgapp 2>/dev/null
usr/bin/killall tcVoIPApiServer 2>/dev/null
usr/bin/killall -9 sipclient 2>/dev/null
usr/bin/killall -9 mgapp 2>/dev/null
usr/bin/killall -9 tcVoIPApiServer 2>/dev/null
/bin/rm -f /var/run/voip_sip.pid
sleep 3
rmmod pcmDump.ko
rmmod ovdsp.ko
rmmod foip.ko
rmmod acodec_x.ko
rmmod ortp.ko
rmmod ksocket.ko
rmmod slic3.ko
rmmod fxs3.ko
rmmod spi.ko
rmmod lec.ko
rmmod pcm1.ko
rmmod DSPCore.ko
rmmod sys_mod.ko
