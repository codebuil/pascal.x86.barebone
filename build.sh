gcc -S $1 -o $1.s
cp format.asm out.s
cat $1.s >> out.s
as -o out.o out.s
gcc link.ld out.o -o out.elf 

