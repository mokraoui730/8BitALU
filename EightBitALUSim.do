# Do file
vsim -gui work.Eight_bit_ALU
add wave *

force reset_n 0
run 10

force reset_n 1
run 10

force enable_n 0 
run 10 

# AND tests
# Result: 00000001
force A 00000001
force B 00000001
force opcode 000
run 10

# AND tests
# Result: 00000000
force A 10101010
force B 01010101
force opcode 000
run 10

# AND tests
# Result: 10101010
force A 10101010
force B 10101010
force opcode 000
run 10

# AND tests
# Result: 11111111
force A 11111111
force B 11111111
force opcode 000
run 10

# OR tests
# Result: 11111111
force A 11111111
force B 11111111
force opcode 001
run 10

# OR tests
# Result:11111111
force A 00000000
force B 11111111
force opcode 001
run 10

# OR tests
# Result: 11111111
force A 11110000
force B 00001111
force opcode 001
run 10

# OR tests
# Result: 00000000
force A 00000000
force B 00000000
force opcode 001
run 10


# XOR tests
# Result:00000000
force A 00000000
force B 00000000
force opcode 010
run 10

# XOR tests
# Result:11111111
force A 10101010
force B 01010101
force opcode 010
run 10

# XOR tests
# Result:00000000
force A 11111111
force B 11111111
force opcode 010
run 10

# APASS tests
# Result: 00000000
force A 00000000
force B 11111111
force opcode 011
run 10

# APASS tests
# Result: 11111111
force A 11111111
force B 00000000
force opcode 011
run 10

# APASS tests
# Result: 10101010
force A 10101010
force B 00111100
force opcode 011
run 10

# BPASS tests
# Result: 11111111
force A 00000000
force B 11111111
force opcode 100
run 10

# BPASS tests
# Result: 00000000
force A 11111111
force B 00000000
force opcode 100
run 10

# BPASS tests
# Result: 00111100
force A 10101010
force B 00111100
force opcode 100
run 10

# ADD tests
# Result:  0 
force A 00000000
force B 00000000
force opcode 101
run 10

# ADD tests
# Result: 00000010
force A 00000001
force B 00000001
force opcode 101
run 10

# ADD tests
# Result: 11111111
force A 01010101
force B 10101010
force opcode 101
run 10

# ADD tests
# Result: overflow 00000000
force A 11111111
force B 11111111
force opcode 101
run 10

# ADD tests
# Result: overflow 00000000
force A 11111111
force B 00000001
force opcode 101
run 10

# SUB tests 
# Result: 00000000 (85-85=0)
force A 01010101
force B 01010101
force opcode 110
run 10 

# SUB tests
# Result: 11111111 (255-0=255)
force A 11111111
force B 00000000
force opcode 110
run 10 

# SUB tests
# Result: 11111111 (0-255=-255)
force A 00000000
force B 11111111
force opcode 110
run 10 

# SUB tests
# Result: 01000110 (182-112=70)
force A 10110110
force B 01110000
force opcode 110
run 10 

# Reset to 0
force reset_n 0
run 10

# Reset to 1
force reset_n 1
run 10

# Set enable to 0, all values below should be 0 
force enable_n 1
run 10

# AND 10101010
force A 10101010
force B 10101010
force opcode 000
run 10

# OR 11111111
force A 11111111
force B 11111111
force opcode 001
run 10

# XOR 11111111
force A 10101010
force B 01010101
force opcode 010
run 10

# apass 10101010
force A 10101010
force B 00111100
force opcode 011
run 10

# bpass 11111111
force A 00000000
force B 11111111
force opcode 100
run 10

# addition 
force A 11111111
force B 00000001
force opcode 101
run 10

#Subtraction 
#00000000 (85-85=0)
force A 01010101
force B 01010101
force opcode 110
run 10 





