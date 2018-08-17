#!/bin/bash

echo "Starting check for LXD - Containers!"
onlineC="$(lxc list -c ns | awk '!/NAME/{ if ( $4 == "RUNNING" ) print $2}')"
for c in $onlineC
do
	echo "$c checking ..."
	lxc exec $c -- /bin/bash -c "cat /var/run/reboot-required"
done
echo "All containers checked!"
