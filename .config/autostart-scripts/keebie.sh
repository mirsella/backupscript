#!/bin/sh
while true; do
  (cd /home/mirsella/.config/keebie
  /usr/bin/pypy keebie.py > /var/log/keebie.log)
done
