printf "\ec\e[44;37m\n"
rm *.o
rm *.elf
rm *.img
rm *.exe
rm *.dll
nasm -felf32 -o boot.o boot.S
fpc -Cn -CcCDECL -O2 -Xs -Xs -Xt -Pi386 -Tlinux  kernel.pas
gcc link.ld boot.o kernel.o -o kernels.elf -nostdlib
objcopy kernels.elf -O binary kernel.bin
qemu-system-i386 -kernel kernels.elf
