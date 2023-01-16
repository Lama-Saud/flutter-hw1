import 'dart:convert';
import 'dart:io';
import 'dart:math';

void main() {
  calculator.wholeThing();
}

class calculator {
  // instances
  late double num1;
  late double num2;

  // constructor
  calculator(double firstNum, double secondNum) {
    this.num1 = firstNum;
    this.num2 = secondNum;
  }

  //class method
  //class methods
  double add(double firstNum, double secondNum) {
    return firstNum + secondNum;
  }

  double subtract(double firstNum, double secondNum) {
    return firstNum - secondNum;
  }

  double multiply(double firstNum, double secondNum) {
    return firstNum * secondNum;
  }

  double expontentiate(double firstNum, double secondNum) {
    // Math.pow returns a double, so use typecasting to account for large numbers

    double exponentProd = pow(firstNum, secondNum).toDouble();

    return exponentProd;
  }

  double divide(double firstNum, double secondNum) {
    return firstNum / secondNum;
  }

  static void backToMainMenu() {
    print("\nYou can start Again :)\n");
    wholeThing();
  }

  static void wholeThing() {

    print("""
        \nHey! This is Calculator to perform operation on two numbers!
        \n\nEnter your first number \nEnter 'exit' to exit at anytime! \n""");

    String? firstInput =
        stdin.readLineSync(encoding: Encoding.getByName('utf-8')!);
    firstInput = firstInput!.trim();
    double firstNum = 0.0;

    if (firstInput == "exit") {
      exit(0);
    } else {
      firstNum = double.parse(firstInput);
    }

    print("\nNow enter your second number.\n");

    String secondInput = stdin.readLineSync(encoding: Encoding.getByName('utf-8')!)!;
    secondInput = secondInput.trim();
    double secondNum = 0.0;

    if (secondInput == "exit") {
      exit(0);
    } else {
      secondNum = double.parse(secondInput);
    }

    calculator calc1 = new calculator(firstNum, secondNum);

    print("""\nChoose the operation you want:
    \nType + for addition
    \nType - for subtraction
    \nType * for multiplication
    \nType ** to raise the first number to the power of the second
    \nType / to divide""");

    String operator = stdin.readLineSync(encoding: Encoding.getByName("utf-8")!)!;
    operator = operator.trim();

    switch (operator) {
      case "+":
        print("Result: ${calc1.num1} - ${calc1.num2}  = ${calc1.add(firstNum, secondNum)}");
        backToMainMenu();
        break;
      case "-":
        print("Result: ${calc1.num1} - ${calc1.num2}  = ${calc1.subtract(firstNum, secondNum)}");
        backToMainMenu();
        break;
      case "*":
        print("Result: ${calc1.num1} *  ${calc1.num2}  = ${calc1.multiply(firstNum, secondNum)}");
        backToMainMenu();
        break;
      case "**":
        print("Result: ${calc1.num1} ** ${calc1.num2}  = ${calc1.expontentiate(firstNum, secondNum)}");
        backToMainMenu();
        break;
      case "/":
        print("Result: ${calc1.num1}  / ${calc1.num2}  = ${calc1.divide(firstNum, secondNum)}");
        backToMainMenu();
        break;
      case "exit":
        exit(0);
        break;
      default:
        print("Input not recognized.");
        backToMainMenu();
        break;
    }
  }
}