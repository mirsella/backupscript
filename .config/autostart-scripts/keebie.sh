#!/bin/sh
while true; do
  (cd /home/mirsella/.config/keebie
  /usr/bin/python keebie.py > /var/log/keebie.log)
  # /usr/bin/pypy keebie.py --device usb-Razer_Razer_Naga_Chroma-if02-event-kbd > /var/log/keebie.log)
done