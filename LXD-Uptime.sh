#!/bin/bash

echo "Collecting Uptime for LXD - Containers!"
onlineC="$(lxc list -c ns | awk '!/NAME/{ if ( $4 == "RUNNING" ) print $2}')"
for c in $onlineC
do
	if [ ${#c} -ge 7 ]; then echo -e "$c \t $(lxc exec $c -- /bin/bash -c "uptime")" ;
	else echo -e "$c \t\t $(lxc exec $c -- /bin/bash -c "uptime")" 
	fi
done
