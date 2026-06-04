// Do file
#Subtraction 
#00000000 (85-85=0)
force A 01010101
force B 01010101
force opcode 110
run 10 

#11111111 (255-0=255)
force A 11111111
force B 00000000
force opcode 110
run 10 

#11111111 (0-255=-255)
force A 00000000
force B 11111111
force opcode 110
run 10 

#01000110 (182-112=70)
force A 10110110
force B 01110000
force opcode 110
run 10 


