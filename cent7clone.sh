#!/bin/bash

read -p "vm number: " NUMBER
COUNTER=0
IMG_DIR=/var/lib/libvirt/images

while [ $COUNTER -lt $NUMBER ]
do
	let n++
	vm=cent7node$n
	result=$(ls $IMG_DIR | grep $vm)
	if [ -z "$result" ];then
		qemu-img create -f qcow2 -b $IMG_DIR/centos7.img $IMG_DIR/${vm}.img 100G &> /dev/null
		cp /root/nsd1809/node.xml /tmp/
		sed -i "s/node/${vm}/" /tmp/node.xml
		virsh define /tmp/node.xml &> /dev/null
		let COUNTER++
	echo -e "create ${vm} ... \t\t\t\t\033[32;1m[Done]\033[0m"
	fi
done
