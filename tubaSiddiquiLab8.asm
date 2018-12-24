# Tuba Siddiqui
# Lab 8 CS10
# Description: Multitask using context switching exception handler and nops to avoid hazards
# Development Environment: MARS MIPS Simulator
# Solution File: tubaSiddiquiLab8.asm
# Date: 11/26/18
# MAC OSX
# Registers Used:
# a0 - address of string
# v0 - syscall parameter
# $3 - hold sum of $2, $3 (instr 1)
# $4 - get contents of $3 (instr 2)
# $7 - difference of $6, $2 (instr 3)
# $6 - store result of $4, $3 (instr 4)


.data

name:         .asciiz "My family name is Siddiqui\n"
id:           .asciiz "My student ID is 20262796\n"
          
            .text
main:

li $v0, 4                    #4 is the print_string syscall
la $a0, name                 #load addr of name into $a0
syscall                      #do the syscall

li $v0, 4                    #4 is the print_string syscall
la $a0, id                   #load addr of id into $a0
syscall                      #do the syscall

add $3, $2, $3               #instruction 1

#hazard condition: use null operation
#same register in given cycle
nop                          #register 3 is used in instr 2 so need nop to avoid hazards                      

#no nop needed since instr 2 and 3 dont use same reg
#no hazard conditions here
lw $4, 100($3)               #instruction 2
sub $7, $6, $2               #instruction 3

#hazard condition: use null operation
#same register in given cycle 
nop                          #register 6 used by instr 4 so need nop to avoid hazard

xor $6, $4, $3               #instruction 4

li $v0, 10                   #exit syscall
syscall
