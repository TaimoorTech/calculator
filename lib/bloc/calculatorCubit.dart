import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

part "calculatorState.dart";

class CalculatorCubit extends Cubit<CalculatorTextState>{

  String text = "";

  CalculatorCubit() : super(CalculatorTextState(text: " ", text1: " ", textColor:  0xFFFFFFFF));

  void signsButton(String sign){
    text = text + sign;
    emit(CalculatorTextState(text: " ", text1: text.trim(), textColor:  0xFFFFFFFF));
  }

  void backspace(){
    text = text.substring(0, text.length-1);
    emit(CalculatorTextState(text: " ", text1: text.trim(), textColor:  0xFFFFFFFF));
  }

  void reset(){
    text = "";
    emit(CalculatorTextState(text: " ", text1: " ", textColor:  0xFFFFFFFF));
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
    // emit(CalculatorTextState(text: text));
  }

  void numButton(int num){
    text = text + num.toString();
    emit(CalculatorTextState(text: " ", text1: text.trim(), textColor:  0xFFFFFFFF));
  }



  int dmas(String str){
    List<double> operands = [];
    String numbers = "";
    bool check = false;
    for(int i=0; i<str.trim().length; i++){
        try{
          int num = int.parse(str.trim().substring(i, i+1));
          numbers=numbers+num.toString();
          try{
            int num2 = int.parse(str.trim().substring(i+1, i+2));
            check=true;
          }catch(e){
            check=false;
          }
          if(check==true){

          }
          else{
            operands.add(double.parse(numbers));
            List<double> l1 = operands;
            numbers="";
          }
        }
        catch(e){}
    }
    List<String> operators=[];
    for(int i=0; i<str.trim().length; i++){
      try{
        if(str.trim().substring(i, i+1)=="+" || str.trim().substring(i, i+1)=="-"
            || str.trim().substring(i, i+1)=="*" || str.trim().substring(i, i+1)=="/"){
          operators.add(str.trim().substring(i, i+1));
        }
      }
      catch(e){}
    }

    for(int i=0; i<operators.length; i++){
      if(operators[i]=='/'){
        double result = operands[i]/operands[i+1];
        operands.remove(i);
        operands.remove(i);
        operands.insertAll(i, [result]);
        operators.remove(i);
      }
    }
    for(int i=0; i<operators.length; i++){
      if(operators[i]=='*'){
        double result = operands[i]*operands[i+1];
        operands.remove(i);
        operands.remove(i);
        operands.insertAll(i, [result]);
        operators.remove(i);
      }
    }
    for(int i=0; i<operators.length; i++){
      if(operators[i]=='+'){
        double result = operands[i]+operands[i+1];
        operands.remove(i);
        operands.remove(i);
        operands.insertAll(i, [result]);
        operators.remove(i);
      }
    }
    for(int i=0; i<operators.length; i++){
      if(operators[i]=='-'){
        double result = operands[i]-operands[i+1];
        operands.remove(i);
        operands.remove(i);
        operands.insertAll(i, [result]);
        operators.remove(i);
      }
    }
    return operands[0].toInt();
  }

  void bodmas(){
    bool leftbrac = false;
    bool rightbrac = false;
    int idx1 = -1;
    int idx2 = -1;

    while(text.trim().contains("(")){
      for(int i=0; i<text.trim().length; i++){
        if(leftbrac==false) {
          if (text[i] == "(") {
            leftbrac = true;
            idx1 = i;
          }
        }
        if(rightbrac==false){
          if(text[i]==")"){
            rightbrac = true;
            idx2=i;
          }
        }
        if(rightbrac==true && leftbrac==true){
          int result = dmas(text.trim().substring(idx1+1, idx2)) ;
          text = text.replaceRange(idx1, idx2+1, result.toString());
          String t = text;
          idx1=-1;
          idx2=-1;
          leftbrac=false;
          rightbrac=false;
        }
      }
    }
    List<double> operands = [];
    String numbers = "";
    bool check = false;
    for(int i=0; i<text.trim().length; i++){
        try{
          int num = int.parse(text.trim().substring(i, i+1));
          numbers=numbers+num.toString();
          try{
            int num2 = int.parse(text.trim().substring(i+1, i+2));
            check=true;
          }catch(e){
            check=false;
          }
          if(check==true){

          }
          else{
            operands.add(double.parse(numbers));
            List<double> l1 = operands;
            numbers="";
          }
        }
        catch(e){}
    }
    List<String> operators=[];
    for(int i=0; i<text.trim().length; i++){
      try{
        if(text.trim().substring(i, i+1)=="+" || text.trim().substring(i, i+1)=="-"
            || text.trim().substring(i, i+1)=="*" || text.trim().substring(i, i+1)=="/"){
          operators.add(text.trim().substring(i, i+1));
        }
      }
      catch(e){}
    }

    while(operators.contains("/")){
      for(int i=0; i<operators.length; i++){
        if(operators[i]=='/'){
          double result = operands[i]/operands[i+1];
          operands.removeAt(i);
          operands.removeAt(i);
          operands.insertAll(i, [result]);
          operators.removeAt(i);
        }
      }
    }

    while(operators.contains("*")){
      for(int i=0; i<operators.length; i++){
        if(operators[i]=='*'){
          double result = operands[i]*operands[i+1];
          operands.removeAt(i);
          operands.removeAt(i);
          operands.insertAll(i, [result]);
          operators.removeAt(i);
        }
      }
    }

    while(operators.contains("+")) {
      for (int i = 0; i < operators.length; i++) {
        if (operators[i] == '+') {
          double result = operands[i] + operands[i + 1];
          operands.removeAt(i);
          List<double> l = operands;
          operands.removeAt(i);
          List<double> l1 = operands;
          operands.insertAll(i, [result]);
          List<double> l3 = operands;
          operators.removeAt(i);
          List<String> l2 = operators;
        }
      }
      // List<double> finals = operands;
    }

    List<double> list = operands;
    List<String> list1 = operators;

    while(operators.contains("-")){
      for(int i=0; i<operators.length; i++){
        if(operators[i]=='-'){
          double result = operands[i]-operands[i+1];
          operands.removeAt(i);
          operands.removeAt(i);
          operands.insertAll(i, [result]);
          operators.removeAt(i);

        }
      }
    }

    emit(CalculatorTextState(text: text, text1: operands[0].toString().trim(), textColor: 0xFF69F0AE));

  }
}