#!/bin/bash

POWERON_STATE="ON" # Change this to "OFF" if you want that your Sonoff will be OFF when powered 

python -m esptool \
            -p $ESPPORT \
            --baud 115200 \
            write_flash \
            -fs 8m \
            -fm dout \
            -ff 40m \
            0x0 ./firmware/rboot.bin \
            0x1000 ./firmware/blank_config.bin \
            0x2000 ./firmware/Sonoff_$POWERON_STATE.bin
