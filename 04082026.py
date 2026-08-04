
## Experiment 1 Write a python program to implement logic gates

def exp1():

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



## Experiment 2 Write a python program to control fan speed according to room temperature using fuzzy logic
def exp2():
    temp = int(input("Temp(°C):"));
    if temp < 18:
        speed = "Low"
    elif temp < 25:
        speed = "Medium"
    else:
        speed = "High"
    print("Speed :", speed);
    print("Temp (°C):", temp);

## Experiment 3 Write a Python Program to Compute the α-Cut and Strong α-Cut of a any Fuzzy Set

def exp3():
    A = {
        'a': 0.2,
        'b': 0.5,
        'c': 0.7,
        'd': 1.0,
        'e': 0.4
    }

    alpha = float(input("Enter alpha value (0 to 1): "))

    alpha_cut = []
    strong_alpha_cut = []

    for element, membership in A.items():
        if membership >= alpha:
            alpha_cut.append(element)

        if membership > alpha:
            strong_alpha_cut.append(element)

    print("Fuzzy Set:", A)
    print("α-Cut:", alpha_cut)
    print("Strong α-Cut:", strong_alpha_cut)

## Experiment 4 Write a Python Program to Determine the Height of a Fuzzy Set and Classify it as Normal or Subnormal

def exp4():
    A = {
        'a': 0.2,
        'b': 0.6,
        'c': 0.9,
        'd': 0.8
    }

    height = max(A.values())

    print("Height =", height)

    if height == 1:
        print("The fuzzy set is NORMAL")
    else:
        print("The fuzzy set is SUBNORMAL")

## Experiment 5 Write a Python Program to Determine the Support, Core, Boundary, and Crossover Points of a Fuzzy Set

def exp5():
    A = {
        'a': 0,
        'b': 0.3,
        'c': 0.5,
        'd': 1,
        'e': 0.8,
        'f': 0
    }

    support = []
    core = []
    boundary = []
    crossover = []

    for element, membership in A.items():

        if membership > 0:
            support.append(element)

        if membership == 1:
            core.append(element)

        if 0 < membership < 1:
            boundary.append(element)

        if membership == 0.5:
            crossover.append(element)

    print("Support:", support)
    print("Core:", core)
    print("Boundary:", boundary)
    print("Crossover Points:", crossover)

## Experiment 6 Write a Python Program to Convert a Crisp Set into a Fuzzy Set by Assigning Membership Values

def exp6():
    crisp_set = input("Enter elements separated by space: ").split()

    fuzzy_set = {}

    for element in crisp_set:
        membership = float(input(f"Enter membership value for {element}: "))
        fuzzy_set[element] = membership

    print("\nFuzzy Set:")

    for element, membership in fuzzy_set.items():
        print(f"{element} : {membership}")


def main():
    print("=========Experiment 1=========");
    exp1();
    print("\n=========Experiment 2=========");
    exp2();
    print("\n=========Experiment 3=========");
    exp3();
    print("\n=========Experiment 4=========");
    exp4();
    print("\n=========Experiment 5=========");
    exp5();
    print("\n=========Experiment 6=========");
    exp6();

if __name__ == "__main__":
    main()