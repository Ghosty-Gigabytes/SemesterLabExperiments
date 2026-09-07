
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

    for eleeement, membership in fuzzy_set.items():
        print(f"{element} : {membership}")

## Experiment 7 Implement Union, Intersection, Complement, and Difference operations on fuzzy set. Also create fuzzy relations
## by cartesian product of any two fuzzy sets and perform min-max composition on any two fuzzy relations.

def exp7():
    A = {
        'a': 0.2,
        'b': 0.7,
        'c': 0.9
    }

    B = {
        'a': 0.6,
        'b': 0.4,
        'c': 0.8
    }

    print("\nFuzzy Set A:", A)
    print("Fuzzy Set B:", B)

    union = {}

    for x in set(A) | set(B):
        union[x] = max(A.get(x, 0), B.get(x, 0))

    print("\nUnion:", union)
    intersection = {}

    for x in set(A) | set(B):
        intersection[x] = min(A.get(x, 0), B.get(x, 0))

    print("Intersection:", intersection)
    complement = {}

    for x in A:
        complement[x] = 1 - A[x]

    print("Complement of A:", complement)
    difference = {}

    for x in set(A) | set(B):
        difference[x] = min(A.get(x, 0), 1 - B.get(x, 0))

    print("Difference (A-B):", difference)
    C = {
        'x': 0.5,
        'y': 0.8
    }

    D = {
        'p': 0.4,
        'q': 0.9
    }

    R1 = {}

    for x in C:
        for y in D:
            R1[(x, y)] = min(C[x], D[y])

    print("\nFuzzy Set C:", C)
    print("Fuzzy Set D:", D)
    print("Cartesian Product C × D:", R1)
    R2 = {
        ('p', 'm'): 0.7,
        ('p', 'n'): 0.5,
        ('q', 'm'): 0.6,
        ('q', 'n'): 0.8
    }

    print("\nRelation R2:", R2)
    R3 = {}

    X = set(x for x, y in R1)
    Y = set(y for x, y in R1)
    Z = set(y for x, y in R2)

    for x in X:
        for z in Z:

            values = []

            for y in Y:
                if (x, y) in R1 and (y, z) in R2:
                    values.append(
                        min(R1[(x, y)], R2[(y, z)])
                    )

            if values:
                R3[(x, z)] = max(values)

    print("Max-Min Composition R1 o R2:", R3)

## Experiment 8: Create a perceptron with an appropriate number of inputs and outputs.
## Train it using a fixed increment learning algorithm until no change in weight is required

def exp8():
    X = [
        [0,0],
        [0,1],
        [1,0],
        [1,1]
    ]

    T = [0,0,0,1]
    w=[0,0]
    b=0
    eta=1
    epoch=0

    while True:
        epoch+=1;
        oldW = w.copy()
        oldB = b

        print("\nEpoch:", epoch)

        for i in range (len(X)):
            net = w[0] * X[i][0] + w[1] * X[i][1] + b
            if net > 0:
                y = 1;
            else:
                y = 0;

            error = T[i] -y;

            w[0] = w[0] + eta * error * X[i][0]
            w[1] = w[1] + eta * error * X[i][1]
            b = b+ eta * error

            print(
                "Input:", X[i],
                "Target:", T[i],
                "Output:", y,
                "Weights:", w,
                "Bias:", b
            )
        if w==oldW and b==oldB:
            break
    print ("\nTraining Complete")
    print("Final weights:", w)
    print("Final bias:", b)

    print("\nTesting")

    for i in range(len(X)):
        net = w[0] * X[i][0] + w[1] * X[i][1] + b
        if net > 0:
            y = 1;
        else:
            y =0;

        print(X[i], ">", y);

## Experiment 11: Write a program to implement Hebbs Rule with AND Gate
def exp11():
    inputs = [
        [0, 0],
        [0, 1],
        [1, 0],
        [1, 1]
    ]
    desired = [0, 0, 0, 1]

    w1 = 0
    w2 = 0
    b = 0

    for i in range(len(inputs)):
        x1 = inputs[i][0]
        x2 = inputs[i][1]
        y = desired[i]

        w1 = w1 + x1 * y
        w2 = w2 + x2 * y
        b = b + y

        print("Input:", x1, x2, "Output:", y)
        print("w1 =", w1, "w2 =", w2, "b =", b)

    print("\nFinal weights:")
    print("w1 =", w1)
    print("w2 =", w2)
    print("Bias =", b)

## Experiment 12: Write a program to implement Delta Rule with AND Gate
def exp12():
    inputs = [
        [0, 0],
        [0, 1],
        [1, 0],
        [1, 1]
    ]
    desired = [0, 1, 1, 1]

    w1 = 0
    w2 = 0
    learning_rate = 0.1
    epochs = 10
    b = 0;

    for epoch in range(epochs):
        print("Epoch:", epoch + 1)
        error = 0;
        for i in range(len(inputs)):
            x1 = inputs[i][0]
            x2 = inputs[i][1]
            d = desired[i]

            y = w1 * x1 + w2 * x2 + b;
            error = d - y

            w1 = w1 + learning_rate * error * x1
            w2 = w2 + learning_rate * error * x2
            b = b + learning_rate * error

        print("w1 =", w1)
        print("w2 =", w2)
        print("error=", error)
        print("b=", b)
        print()

    print("Final Weights:")
    print("w1 =", w1)
    print("w2 =", w2)
    print("b=", b)

## Experiment 9: Write a program to implement Linear Regression
def exp9():
    import numpy as np
    import matplotlib.pyplot as plt
    from sklearn.linear_model import LinearRegression

    x = np.array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13])
    y = np.array([2, 3, 5, 6, 10, 9, 12, 11, 15, 18, 23, 23, 28])

    x_mean = np.mean(x)
    y_mean = np.mean(y)

    m = np.sum((x - x_mean)(y - y_mean)) / np.sum((x - x_mean) * 2)
    c = y_mean - m * x_mean

    y_pred = m * x + c

    print("Slope =", m)
    print("Intercept =", c)
    print("Equation: y =", round(m, 2), "x +", round(c, 2))

    plt.figure(figsize=(8, 5))

    plt.scatter(x, y, color="black", s=70, label="INPUT")
    plt.plot(x, y_pred, color="blue", linewidth=2, label="Regression Line")

    plt.xlabel("X")
    plt.ylabel("Y")
    plt.title("Linear Regression with 10 Data Points")

    plt.grid(True)
    plt.legend()
    plt.show()


def exp10():
    import numpy as np
    import matplotlib.pyplot as plt
    from sklearn.linear_model import LinearRegression

    X = np.array([
        [1, 2, 5],
        [2, 5, 3],
        [3, 1, 8],
        [4, 6, 4],
        [5, 3, 9],
        [6, 8, 2],
        [7, 4, 7],
        [8, 7, 5],
        [9, 2, 10],
        [10, 9, 3]
    ])

    y = np.array([12, 15, 14, 20, 22, 25, 24, 30, 28, 34])

    model = LinearRegression().fit(X, y)

    print("Coefficients:", model.coef_)
    print("Intercept:", model.intercept_)
    print("Prediction:", model.predict([[6, 5, 6]])[0])

    yp = model.predict(X)

    plt.scatter(y, yp)
    plt.plot([y.min(), y.max()], [y.min(), y.max()])
    plt.xlabel("Actual Y")
    plt.ylabel("Predicted Y")
    plt.title("Multiple Linear Regression")
    plt.grid()
    plt.show()


def main():
    choice = int(input("\nEnter your choice: "))
    if choice == 1:
        print("=========Experiment 1=========");
        exp1();
    elif choice == 2:
        print("=========Experiment 2=========");
        exp2();
    elif choice == 3:
        print("=========Experiment 3=========");
        exp3();
    elif choice == 4:
        print("=========Experiment 4=========");
        exp4();
    elif choice == 5:
        print("=========Experiment 5=========");
        exp5();
    elif choice == 6:
        print("=========Experiment 6=========");
        exp6();
    elif choice == 7:
        print("=========Experiment 7=========");
        exp7();
    elif choice == 8:
        print("=========Experiment 8=========");
        exp8();
    elif choice == 9:
        print("=========Experiment 9=========");
        exp9();
    elif choice == 10:
        print("=========Experiment 10=========");
        exp10();
    elif choice == 11:
        print("=========Experiment 11=========");
        exp11();
    elif choice == 12:
        print("=========Experiment 12=========");
        exp12();
    # el
    # print("\n=========Experiment 2=========");
    # exp2();
    # print("\n=========Experiment 3=========");
    # exp3();
    # print("\n=========Experiment 4=========");
    # exp4();
    # print("\n=========Experiment 5=========");
    # exp5();
    # print("\n=========Experiment 6=========");
    # exp6();
    # print("\n=========Experiment 7=========");
    # exp7();

##
if __name__ == "__main__":
    main()