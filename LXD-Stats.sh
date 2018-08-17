#!/bin/bash

echo "The current values of each LXD - Container:"
onlineC="$(lxc list -c ns | awk '!/NAME/{ if ( $4 == "RUNNING" ) print $2}')"
for c in $onlineC
do
	echo "*** LXD-Container: $c ***"
	for stat in boot.autostart boot.autostart.priority boot.autostart.delay limits.memory
	do
		echo "Key: $stat => $(lxc config get $c  $stat)"
	done
		echo ""
done
