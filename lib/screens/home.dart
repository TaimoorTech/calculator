import 'package:calculator/bloc/calculatorCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Home extends StatelessWidget{

  final String text = "";

  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFF374352),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            // mainAxisSize: MainAxisSize.max,
            children: [
              BlocBuilder<CalculatorCubit, CalculatorTextState>(
                  builder: (BuildContext context, CalculatorTextState textState)
                      => Container(
                        // color: Colors.black12,
                        alignment: Alignment.bottomRight,
                          height: 292,
                          child: Text(textState.text.trimRight()+" ", style: TextStyle(fontSize: 50, color: Colors.black))
                      )
                  ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(width: 2, color: Colors.grey))
                ),
                width: double.maxFinite,
                // alignment: Alignment.bottomCenter,
                height: 550,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // SizedBox(height: 5),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: NeumorphicButton(
                              // margin: EdgeInsets.only(top: 12),
                              onPressed: () {
                                NeumorphicTheme.of(context)?.themeMode =
                                NeumorphicTheme.isUsingDark(context) as ThemeMode;
                                context.read<CalculatorCubit>().reset();
                              },
                              style: NeumorphicStyle(
                                depth: 20,
                                // surfaceIntensity: 20,
                                color: Colors.white,
                                shadowLightColor: Colors.grey,
                                shape: NeumorphicShape.flat, boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(50)),),
                              padding: EdgeInsets.all(12.0),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("AC", style: TextStyle(fontWeight: FontWeight.bold,
                                    fontSize: 24, color: Colors.black),),
                              )
                          ),
                        ),
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: ElevatedButton(onPressed: (){
                            context.read<CalculatorCubit>().signsButton('(');
                          },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  backgroundColor: Colors.lightBlue),
                              child: Text('(', style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 24, color: Colors.white))),
                        ),
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: ElevatedButton(onPressed: (){
                            context.read<CalculatorCubit>().signsButton(')');
                          },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  backgroundColor: Colors.lightBlue),
                              child: Text(")", style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 24, color: Colors.white))),
                        ),
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: ElevatedButton(onPressed: (){
                            context.read<CalculatorCubit>().signsButton("/");
                          },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  backgroundColor: Colors.lightBlue),
                              child: Text("/", style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 24, color: Colors.white))),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: ElevatedButton(onPressed: (){
                            context.read<CalculatorCubit>().numButton(7);
                          },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  backgroundColor: Colors.white),
                              child: Text("7", style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 24, color: Colors.black))),
                        ),
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: ElevatedButton(onPressed: (){
                            context.read<CalculatorCubit>().numButton(8);
                          },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  backgroundColor: Colors.white),
                              child: Text('8', style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 24, color: Colors.black))),
                        ),
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: ElevatedButton(onPressed: (){
                            context.read<CalculatorCubit>().numButton(9);
                          },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  backgroundColor: Colors.white),
                              child: Text("9", style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 24, color: Colors.black))),
                        ),
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: ElevatedButton(onPressed: (){
                            context.read<CalculatorCubit>().signsButton("*");
                          },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  backgroundColor: Colors.lightBlue),
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                child: Text("*", style: TextStyle(fontWeight: FontWeight.bold,
                                    fontSize: 40, color: Colors.white)),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: ElevatedButton(onPressed: (){
                            context.read<CalculatorCubit>().numButton(4);
                          },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  backgroundColor: Colors.white),
                              child: Text("4", style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 24, color: Colors.black))),
                        ),
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: ElevatedButton(onPressed: (){
                            context.read<CalculatorCubit>().numButton(5);
                          },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  backgroundColor: Colors.white),
                              child: Text('5', style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 24, color: Colors.black))),
                        ),
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: ElevatedButton(onPressed: (){
                            context.read<CalculatorCubit>().numButton(6);
                          },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  backgroundColor: Colors.white),
                              child: Text("6", style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 24, color: Colors.black))),
                        ),
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: ElevatedButton(onPressed: (){
                            context.read<CalculatorCubit>().signsButton("-");
                          },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  backgroundColor: Colors.lightBlue),
                              child: Text("-", style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 46, color: Colors.white))),
                        ),              ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: ElevatedButton(onPressed: (){
                            context.read<CalculatorCubit>().numButton(1);
                          },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  backgroundColor: Colors.white),
                              child: Text('1', style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 24, color: Colors.black))),
                        ),
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: ElevatedButton(onPressed: (){
                            context.read<CalculatorCubit>().numButton(2);
                          },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  backgroundColor: Colors.white),
                              child: Text("2", style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 24, color: Colors.black))),
                        ),
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: ElevatedButton(onPressed: (){
                            context.read<CalculatorCubit>().numButton(3);
                          },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  backgroundColor: Colors.white),
                              child: Text("3", style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 24, color: Colors.black))),
                        ),
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: ElevatedButton(onPressed: (){
                            context.read<CalculatorCubit>().signsButton("+");
                          },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  backgroundColor: Colors.lightBlue),
                              child: Text("+", style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 35, color: Colors.white))),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: ElevatedButton(onPressed: (){
                            context.read<CalculatorCubit>().numButton(0);
                          },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  backgroundColor: Colors.white),
                              child: Text('0', style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24, color: Colors.black))),
                        ),
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: ElevatedButton(onPressed: (){
                            context.read<CalculatorCubit>().signsButton('.');
                          },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  backgroundColor: Colors.white),
                              child: Text(".", style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 46, color: Colors.black))),
                        ),
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: ElevatedButton(onPressed: (){
                            context.read<CalculatorCubit>().backspace();
                          },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  backgroundColor: Colors.white),
                              child: Text("<-", style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 30, color: Colors.black))),
                        ),
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: ElevatedButton(onPressed: (){
                            context.read<CalculatorCubit>().bodmas();
                          },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  backgroundColor: Colors.lightBlueAccent),
                              child: Text("=", style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 46, color: Colors.white))),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }


}