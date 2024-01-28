Tap1:
ip tuntap add dev tap1 mod tap # 创建 tap
ip a add 192.168.1.3/24 dev tap1
ip link set tap1 up

ifconfig enp0s1 192.168.1.6 up

./build/qemu-system-aarch64 -m 1024 -cpu cortex-a57 -M virt -nographic -smp 4 -kernel /home/vec/samba/qemu/env/linux-5.10.54/arch/arm64/boot/Image -append "noinintrd sched_debug root=/dev/vda rootfstype=ext4 rw crashkernel=256M loglevel=8" -drive if=none,file=/home/vec/samba/qemu/env/image/debian/linux_rootfs.ext4,id=hd0 -device virtio-blk-device,drive=hd0 -device e1000,mac=00:16:3e:01:01:01,netdev=net0 -netdev tap,id=net0,ifname=tap1,script=no,downscript=no


Tun0:
ip tuntap add dev tun0 mod tun # 创建 tun
ip a add 192.168.100.2/24 dev tun0
ip link set tun0 up

ifconfig enp0s1 192.168.100.6 up

./build/qemu-system-aarch64 -m 1024 -cpu cortex-a57 -M virt -nographic -smp 4 -kernel /home/vec/samba/qemu/env/linux-5.10.54/arch/arm64/boot/Image -append "noinintrd sched_debug root=/dev/vda rootfstype=ext4 rw crashkernel=256M loglevel=8" -drive if=none,file=/home/vec/samba/qemu/env/image/debian/linux_rootfs.ext4,id=hd0 -device virtio-blk-device,drive=hd0 -device e1000,mac=00:16:3e:01:01:01,netdev=net0 -netdev tap,id=net0,ifname=tun0,script=no,downscript=no
