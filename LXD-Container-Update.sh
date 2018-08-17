#!/bin/bash

echo "Starting update for LXD - Containers!"
onlineC="$(lxc list -c ns | awk '!/NAME/{ if ( $4 == "RUNNING" ) print $2}')"
for c in $onlineC
do
	echo "$c updating ..."
	lxc exec $c -- /bin/bash -c "apt-get -qq update"
	lxc exec $c -- /bin/bash -c "apt-get -qq upgrade -y"
	lxc exec $c -- /bin/bash -c "apt-get -qq autoremove -y"
done
echo "All containers are up to date!"
