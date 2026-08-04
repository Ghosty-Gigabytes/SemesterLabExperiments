## Write a python program to implement logic gates

A = int(input("First input: "))
B = int(input("Second input: "))

AND = A and B;
OR = A or B;
XOR = A ^ B;
NOT_A = not A;
NOT_B = not B;
NAND = not AND;
NOR = not OR;
XNOR = not XOR;

print("Logic Gate Outputs");
print("AND = ", int(AND));
print("OR = ", int(OR));
print("XOR = ", int(XOR));
print("NOT_A = ", int(NOT_A));
print("NOT_B = ", int(NOT_B));
print("NAND = ", int(NAND));
print("NOR = ", int(NOR));
print("XNOR = ", int(XNOR));
