func Calc() {
    var input, output;
    
    while(1) {
        Print("Enter an expression (or 'exit' to quit): ");
        input = ReadLine();
        
        if(input == "exit") {
            break;
        }

        output = Eval(input);
        Print("Result: ", output, "\n");
    }
}
func Eval(string expr) {
    var stack[256], n, val, operator, start, subExpr;
    var i;
    
    for(i = 0; i < StrLen(expr); i++) {
        if(expr[i] == '(') {
            stack[n++] = i;
        } else if(expr[i] == ')') {
            start = stack[--n];
            subExpr = SubStr(expr, start + 1, i - start - 1);
            val = Eval(subExpr);
            expr = SubStr(expr, 0, start) + val + SubStr(expr, i + 1, StrLen(expr) - i - 1);
            i = start - 1;
        } else if(IsDigit(expr[i]) || expr[i] == '.') {
            var num = 0;
            var decimal = 0;
            var decimalPlace = 1;
            while(i < StrLen(expr) && (IsDigit(expr[i]) || expr[i] == '.')) {
                if(expr[i] == '.') {
                    decimal = 1;
                } else {
                    if(decimal) {
                        decimalPlace *= 10;
                        num += (expr[i] - '0') / decimalPlace;
                    } else {
                        num = num * 10 + (expr[i] - '0');
                    }
                }
                i++;
            }
            i--;
            stack[n++] = num;
        } else if(expr[i] == '+') {
            operator = '+';
        } else if(expr[i] == '-') {
            operator = '-';
        } else if(expr[i] == '*') {
            operator = '*';
        } else if(expr[i] == '/') {
            operator = '/';
        } else if(expr[i] == '^') {
            operator = '^';
        } else if(expr[i] == 's' && SubStr(expr, i, 3) == "sin") {
            stack[n++] = Sin(Eval(SubStr(expr, i + 3, StrLen(expr) - i - 3)));
            i = i + 2;
        } else if(expr[i] == 'c' && SubStr(expr, i, 3) == "cos") {
            stack[n++] = Cos(Eval(SubStr(expr, i + 3, StrLen(expr) - i - 3)));
            i = i + 2;
        } else if(expr[i] == 't' && SubStr(expr, i, 3) == "tan") {
            stack[n++] = Tan(Eval(SubStr(expr, i + 3, StrLen(expr) - i - 3)));
            i = i + 2;
        } else if(expr[i] == 'l' && SubStr(expr, i, 3) == "log") {
            stack[n++] = Log(Eval(SubStr(expr, i + 3, StrLen(expr) - i - 3)));
            i = i + 2;
        } else if(expr[i] == 'e' && SubStr(expr, i, 1) == 'e') {
            stack[n++] = Exp(Eval(SubStr(expr, i + 1, StrLen(expr) - i - 1)));
            i = i;
        } else if(expr[i] == 'p' && SubStr(expr, i, 4) == "sqrt") {
            stack[n++] = Sqrt(Eval(SubStr(expr, i + 4, StrLen(expr) - i - 4)));
            i = i + 3;
        } else if(expr[i] == 'a' && SubStr(expr, i, 3) == "abs") {
            stack[n++] = Abs(Eval(SubStr(expr, i + 3, StrLen(expr) - i - 3)));
            i = i + 2;
        }
        
        if(n >= 2) {
            var b = stack[--n];
            var a = stack[--n];
            if(operator == '+') {
                stack[n++] = a + b;
            } else if(operator == '-') {
                stack[n++] = a - b;
            } else if(operator == '*') {
                stack[n++] = a * b;
            } else if(operator == '/') {
                stack[n++] = a / b;
            } else if(operator == '^') {
                stack[n++] = Pow(a, b);
            }
        }
    }

    return stack[0];
}

Print("HolyCalculator Scientific/Atheist Edition\n");
Calc();
