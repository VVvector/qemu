#!/bin/sh

ip tuntap add dev tun0 mod tun # 创建 tun
ip a add 192.168.100.2/24 dev tun0
ip link set tun0 up

