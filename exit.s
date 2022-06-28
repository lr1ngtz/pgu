# PURPOSE: Simple program that exits and returns a
# status code back to the Linux kernel
# ASSEMBLE as exit.s -o exit.o
# LINK ld exit.o -o exit
#
# INPUT: none
#
# OUTPUT: returns a status code.
# This can be viewed by typing echo $?
# after running the program
#
#VARIABLES:
# %eax holds the system call number
# %ebx holds the return status

# The .section command breaks the program
# up into sections, data section - where you list
# any memory storage you'll need for data.
 .section .data

# text section - there instructions live.
 .section .text
 .globl _start
_start:
# this is the linux kernel command
# number (system call) for exiting a program
movl $1, %eax

# this is the status number we will
# return to the operating system.
# Change this around and it will
# return different things to echo $?
movl $0, %ebx #

# this wakes up the kernel to run
# the exit command
int $0x80 

