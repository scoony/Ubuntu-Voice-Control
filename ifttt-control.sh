#!/bin/bash

## Config
sync_folder=""

## Reboot
if [[ -f "$sync_folder/reboot.jpg" ]]; then
  rm "$sync_folder/reboot.jpg"
  reboot
fi

## Update
if [[ -f "$sync_folder/update.jpg" ]]; then
  rm "$sync_folder/update.jpg"
  apt update
  apt upgrade
  apt install -f
  apt autoremove
fi

## Restart a service
for service in $sync_folder/service/*.jpg ; do
  rm "$service"
  service_name=`basename "$service" | sed 's/.jpg//g'`
  service $service_name restart
done
