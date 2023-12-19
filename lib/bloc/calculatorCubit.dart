import 'package:flutter_bloc/flutter_bloc.dart';

part "calculatorState.dart";

class CalculatorCubit extends Cubit<CalculatorTextState>{

  String text = "";

  CalculatorCubit() : super(CalculatorTextState(text: ""));

  void signsButton(String sign){
    text = text + sign;
    emit(CalculatorTextState(text: text.trim()));
  }

  void backspace(){
    text = text.substring(0, text.length-1);
    emit(CalculatorTextState(text: text.trim()));
  }

  void reset(){
    text = "";
    emit(CalculatorTextState(text: ""));
  }

  void compute(){
    List<String> operands = [];
    for(int i=0; i<text.length; i++){
      try{
        int num = int.parse(text.substring(i, i+1));
        operands.add(num.toString());
      }
      catch(e){}
    }
    List<String> operators=[];
    for(int i=0; i<text.length; i++){
      try{
        if(text.substring(i, i+1)=="+" || text.substring(i, i+1)=="-"
        || text.substring(i, i+1)=="*" || text.substring(i, i+1)=="/"){
          operators.add(text.substring(i, i+1));
        }
      }
      catch(e){}
    }
    // List<String> l1 = operands;
    // List<String> l2 = operators;
    double aggregate = double.parse(operands[0]);
    // int aggregate = 6;

    // double aggregate = 0;
    int o = 0;
    for (int i = 1; i < operands.length; i++) {
      if (operators[o].contains("+")) {
        aggregate = aggregate + double.parse(operands[i]);
      }
      else if (operators[o].contains("-")) {
        aggregate = aggregate - double.parse(operands[i]);
      }
      else if (operators[o].contains("*")) {
        aggregate = aggregate * double.parse(operands[i]);
      }
      else if (operators[o].contains("/")) {
        aggregate = (aggregate) / (double.parse(operands[i]));
      }
      o++;
    }
    text=aggregate.toString();
    emit(CalculatorTextState(text: text));
  }

  void numButton(int num){
    text = text + num.toString();
    emit(CalculatorTextState(text: text.trim()));
  }

  num multiply(num leftOp, num rightOp) => leftOp * rightOp;
  num divide(num leftOp, num rightOp) => leftOp / rightOp;
  num add(num leftOp, num rightOp) => leftOp + rightOp;
  num substract(num leftOp, num rightOp) => leftOp - rightOp;

  void compute1() {

    List<dynamic> items = [];
    for(int i=0; i<text.length; i++){
      try{
        String num = text.substring(i, i+1);
        items.add(num.toString());
      }
      catch(e){}
    }//correct is 10

    num result = 0;

    // Copy the list in a temporary list
    var calc = [...items];

    // set the precedence order of the operators
    // create 2 groups of equal importance
    var operators = [
      {
        "*": multiply,
        "/": divide,
      },
      {
        "+": add,
        "-": substract,
      }
    ];

    // loop until all operators have produced result
    while (calc.length > 1) {
      for (var opPrecedence in operators) {
        // find first operator in a group, starting from left

        var pos = 0;

        do {
          pos = calc.indexWhere((e) => opPrecedence.containsKey(e));

          if (pos >= 0) {
            num leftOp = calc[pos - 1];
            num rightOp = calc[pos + 1];

            var operation = opPrecedence[calc[pos]];

            result = operation!(leftOp, rightOp);

            // remove the 2 operands and replace with result
            calc.removeAt(pos);
            calc.removeAt(pos);
            calc[pos - 1] = result;
          }
        } while (pos >= 0);
      }
    }

    // what should be left is the final result
    emit(CalculatorTextState(text: result.toString()));
  }



}