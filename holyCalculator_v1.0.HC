// addition 
func int Add(int a, int b) {
    return a + b;
}

// subtraction
func int Subtract(int a, int b) {
    return a - b;
}

// multiplication
func int Multiply(int a, int b) {
    return a * b;
}

// division
func int Divide(int a, int b) {
    if (b == 0) {
        Print("God doesn't divide by zero\n");
        return 0;
    }
    return a / b;
}

// power
func int Power(int a, int b) {
    int result = 1;
    for (int i = 0; i < b; i++) {
        result *= a;
    }
    return result;
}

// modulo
func int Modulo(int a, int b) {
    if (b == 0) {
        Print("God doesn't divide by zero\n");
        return 0;
    }
    return a % b;
}

// user input
func int GetInput() {
    int num;
    Print("Enter a number: ");
    num = ReadI();
    return num;
}

func main() {
    int a, b, result;
    int operator;

    Print("Holy Calculator v.1.0\n");
    Print("Available operations: +, -, *, /, ^ (power), %% (modulo)\n");

    while (1) {
        a = GetInput();
        Print("Enter operator (+, -, *, /, ^, %%): ");
        operator = ReadC();

        b = GetInput();

        switch (operator) {
            case '+':
                result = Add(a, b);
                break;
            case '-':
                result = Subtract(a, b);
                break;
            case '*':
                result = Multiply(a, b);
                break;
            case '/':
                result = Divide(a, b);
                break;
            case '^':
                result = Power(a, b);
                break;
            case '%':
                result = Modulo(a, b);
                break;
            default:
                Print("Unholy operator: ");
                Print(operator);
                Print("\n");
                continue;
        }

        Print("God says: ");
        PrintI(result);
        Print("\n");

        Print("Do you want to continue praying? (y/n): ");
        operator = ReadC();
        if (operator == 'n' || operator == 'N') {
            break;
        }
    }

    Print("God done calculated.\n");
}
