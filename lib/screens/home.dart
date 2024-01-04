import 'package:calculator/bloc/calculatorCubit.dart';
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
        backgroundColor: const Color(0xFF374352),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            BlocBuilder<CalculatorCubit, CalculatorTextState>(
                builder: (BuildContext blocContext, CalculatorTextState textState)
                => SizedBox(
                  // color: Colors.black12,
                    height: 300,
                    width: double.maxFinite,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align( //Anonymous Routing
                          alignment: Alignment.topRight,
                          child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/second');
                                // Navigator.push(context, MaterialPageRoute(builder: (blocContext)=>
                                //     BlocProvider.value(value: context.read<CalculatorCubit>(), child: SecondScreen())));
                              }, child: const Text("Second Screen",  style: TextStyle(
                              decorationThickness: 3, decoration: TextDecoration.underline,
                              decorationColor: Colors.white, color: Colors.white, fontSize: 20))),
                        ),
                        // SizedBox(height: 5),
                        Align( //Named Routing
                          alignment: Alignment.topRight,
                          child: TextButton(onPressed: () {
                            Navigator.pushNamed(context, '/third');
                          }, child: const Text("Third Screen", style: TextStyle(
                              decorationThickness: 3, decoration: TextDecoration.underline,
                              decorationColor: Colors.white, color: Colors.white, fontSize: 20))),
                        ),
                        // SizedBox(height: 5),
                        Align( //Named Routing
                          alignment: Alignment.topRight,
                          child: TextButton(onPressed: () {
                            Navigator.pushNamed(context, '/fourth');
                          }, child: const Text("Fourth Screen", style: TextStyle(
                              decorationThickness: 3, decoration: TextDecoration.underline,
                              decorationColor: Colors.white, color: Colors.white, fontSize: 20))),
                        ),
                      ],
                    )
                )
            ),
            Container(
              decoration: const BoxDecoration(
                  border: Border(top: BorderSide(width: 2, color: Colors.black))
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
                              shadowLightColor: Colors.black,
                              color: const Color(0xFF374352),
                              shape: NeumorphicShape.convex, boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(40)),),
                            padding: const EdgeInsets.all(17.0),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text("AC", style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 24, color: Colors.red),),
                            )
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: NeumorphicButton(
                          // margin: EdgeInsets.only(top: 12),
                            onPressed: () {
                              NeumorphicTheme.of(context)?.themeMode =
                              NeumorphicTheme.isUsingDark(context) as ThemeMode;
                              context.read<CalculatorCubit>().signsButton('(');
                            },
                            style: NeumorphicStyle(
                              shadowLightColor: Colors.black, color: const Color(0xFF374352),
                              shape: NeumorphicShape.convex, boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(40)),),
                            padding: const EdgeInsets.all(17.0),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text("(", style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 24, color: Colors.white),),
                            )
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: NeumorphicButton(
                          // margin: EdgeInsets.only(top: 12),
                            onPressed: () {
                              NeumorphicTheme.of(context)?.themeMode =
                              NeumorphicTheme.isUsingDark(context) as ThemeMode;
                              context.read<CalculatorCubit>().signsButton(')');
                            },
                            style: NeumorphicStyle(
                              shadowLightColor: Colors.black, color: const Color(0xFF374352),
                              shape: NeumorphicShape.convex, boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(40)),),
                            padding: const EdgeInsets.all(17.0),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text(")", style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 24, color: Colors.white),),
                            )
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: NeumorphicButton(
                          // margin: EdgeInsets.only(top: 12),
                            onPressed: () {
                              NeumorphicTheme.of(context)?.themeMode =
                              NeumorphicTheme.isUsingDark(context) as ThemeMode;
                              context.read<CalculatorCubit>().signsButton('/');
                            },
                            style: NeumorphicStyle(
                              shadowLightColor: Colors.black, color: const Color(0xFF374352),
                              shape: NeumorphicShape.convex, boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(40)),),
                            padding: const EdgeInsets.all(17.0),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text("/", style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 30, color: Colors.green),),
                            )
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
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
                              context.read<CalculatorCubit>().numButton(7);
                            },
                            style: NeumorphicStyle(
                              shadowLightColor: Colors.black, color: const Color(0xFF374352),
                              shape: NeumorphicShape.convex, boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(40)),),
                            padding: const EdgeInsets.all(17.0),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text("7", style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 30, color: Colors.white),),
                            )
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: NeumorphicButton(
                          // margin: EdgeInsets.only(top: 12),
                            onPressed: () {
                              NeumorphicTheme.of(context)?.themeMode =
                              NeumorphicTheme.isUsingDark(context) as ThemeMode;
                              context.read<CalculatorCubit>().numButton(8);
                            },
                            style: NeumorphicStyle(
                              shadowLightColor: Colors.black, color: const Color(0xFF374352),
                              shape: NeumorphicShape.convex, boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(40)),),
                            padding: const EdgeInsets.all(17.0),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text("8", style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 30, color: Colors.white),),
                            )
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: NeumorphicButton(
                          // margin: EdgeInsets.only(top: 12),
                            onPressed: () {
                              NeumorphicTheme.of(context)?.themeMode =
                              NeumorphicTheme.isUsingDark(context) as ThemeMode;
                              context.read<CalculatorCubit>().numButton(9);
                            },
                            style: NeumorphicStyle(
                              shadowLightColor: Colors.black, color: const Color(0xFF374352),
                              shape: NeumorphicShape.convex, boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(40)),),
                            padding: const EdgeInsets.all(17.0),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text("9", style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 30, color: Colors.white),),
                            )
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: NeumorphicButton(
                          // margin: EdgeInsets.only(top: 12),
                            onPressed: () {
                              NeumorphicTheme.of(context)?.themeMode =
                              NeumorphicTheme.isUsingDark(context) as ThemeMode;
                              context.read<CalculatorCubit>().signsButton('*');
                            },
                            style: NeumorphicStyle(
                              shadowLightColor: Colors.black, color: const Color(0xFF374352),
                              shape: NeumorphicShape.convex, boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(40)),),
                            padding: const EdgeInsets.all(17.0),
                            child: const Align(
                              alignment: Alignment.bottomCenter,
                              child: Text("*", style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 40, color: Colors.green),),
                            )
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
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
                              context.read<CalculatorCubit>().numButton(4);
                            },
                            style: NeumorphicStyle(
                              shadowLightColor: Colors.black, color: const Color(0xFF374352),
                              shape: NeumorphicShape.convex, boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(40)),),
                            padding: const EdgeInsets.all(17.0),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text("4", style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 30, color: Colors.white),),
                            )
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: NeumorphicButton(
                          // margin: EdgeInsets.only(top: 12),
                            onPressed: () {
                              NeumorphicTheme.of(context)?.themeMode =
                              NeumorphicTheme.isUsingDark(context) as ThemeMode;
                              context.read<CalculatorCubit>().numButton(5);
                            },
                            style: NeumorphicStyle(
                              shadowLightColor: Colors.black, color: const Color(0xFF374352),
                              shape: NeumorphicShape.convex, boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(40)),),
                            padding: const EdgeInsets.all(17.0),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text("5", style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 30, color: Colors.white),),
                            )
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: NeumorphicButton(
                          // margin: EdgeInsets.only(top: 12),
                            onPressed: () {
                              NeumorphicTheme.of(context)?.themeMode =
                              NeumorphicTheme.isUsingDark(context) as ThemeMode;
                              context.read<CalculatorCubit>().numButton(6);
                            },
                            style: NeumorphicStyle(
                              shadowLightColor: Colors.black, color: const Color(0xFF374352),
                              shape: NeumorphicShape.convex, boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(40)),),
                            padding: const EdgeInsets.all(17.0),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text("6", style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 30, color: Colors.white),),
                            )
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: NeumorphicButton(
                          // margin: EdgeInsets.only(top: 12),
                            onPressed: () {
                              NeumorphicTheme.of(context)?.themeMode =
                              NeumorphicTheme.isUsingDark(context) as ThemeMode;
                              context.read<CalculatorCubit>().signsButton('-');
                            },
                            style: NeumorphicStyle(
                              shadowLightColor: Colors.black, color: const Color(0xFF374352),
                              shape: NeumorphicShape.convex, boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(40)),),
                            padding: const EdgeInsets.all(1.0),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text("-", style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 60, color: Colors.green),),
                            )
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
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
                              context.read<CalculatorCubit>().numButton(1);
                            },
                            style: NeumorphicStyle(
                              shadowLightColor: Colors.black, color: const Color(0xFF374352),
                              shape: NeumorphicShape.convex, boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(40)),),
                            padding: const EdgeInsets.all(17.0),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text("1", style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 30, color: Colors.white),),
                            )
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: NeumorphicButton(
                          // margin: EdgeInsets.only(top: 12),
                            onPressed: () {
                              NeumorphicTheme.of(context)?.themeMode =
                              NeumorphicTheme.isUsingDark(context) as ThemeMode;
                              context.read<CalculatorCubit>().numButton(2);
                            },
                            style: NeumorphicStyle(
                              shadowLightColor: Colors.black, color: const Color(0xFF374352),
                              shape: NeumorphicShape.convex, boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(40)),),
                            padding: const EdgeInsets.all(17.0),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text("2", style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 30, color: Colors.white),),
                            )
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: NeumorphicButton(
                          // margin: EdgeInsets.only(top: 12),
                            onPressed: () {
                              NeumorphicTheme.of(context)?.themeMode =
                              NeumorphicTheme.isUsingDark(context) as ThemeMode;
                              context.read<CalculatorCubit>().numButton(3);
                            },
                            style: NeumorphicStyle(
                              shadowLightColor: Colors.black, color: const Color(0xFF374352),
                              shape: NeumorphicShape.convex, boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(40)),),
                            padding: const EdgeInsets.all(17.0),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text("3", style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 30, color: Colors.white),),
                            )
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: NeumorphicButton(
                          // margin: EdgeInsets.only(top: 12),
                            onPressed: () {
                              NeumorphicTheme.of(context)?.themeMode =
                              NeumorphicTheme.isUsingDark(context) as ThemeMode;
                              context.read<CalculatorCubit>().signsButton('+');
                            },
                            style: NeumorphicStyle(
                              shadowLightColor: Colors.black, color: const Color(0xFF374352),
                              shape: NeumorphicShape.convex, boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(40)),),
                            padding: const EdgeInsets.all(17.0),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text("+", style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 35, color: Colors.green),),
                            )
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
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
                              context.read<CalculatorCubit>().numButton(0);
                            },
                            style: NeumorphicStyle(
                              shadowLightColor: Colors.black, color: const Color(0xFF374352),
                              shape: NeumorphicShape.convex, boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(40)),),
                            padding: const EdgeInsets.all(17.0),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text("0", style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 30, color: Colors.white),),
                            )
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: NeumorphicButton(
                          // margin: EdgeInsets.only(top: 12),
                            onPressed: () {
                              NeumorphicTheme.of(context)?.themeMode =
                              NeumorphicTheme.isUsingDark(context) as ThemeMode;
                              context.read<CalculatorCubit>().signsButton('.');
                            },
                            style: NeumorphicStyle(
                              shadowLightColor: Colors.black, color: const Color(0xFF374352),
                              shape: NeumorphicShape.convex, boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(40)),),
                            padding: const EdgeInsets.all(4.0),
                            child: const Align(
                              alignment: Alignment.topCenter,
                              child: Text(".", style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 46, color: Colors.white),),
                            )
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: NeumorphicButton(
                          // margin: EdgeInsets.only(top: 12),
                            onPressed: () {
                              NeumorphicTheme.of(context)?.themeMode =
                              NeumorphicTheme.isUsingDark(context) as ThemeMode;
                              context.read<CalculatorCubit>().backspace();
                            },
                            style: NeumorphicStyle(
                              shadowLightColor: Colors.black, color: const Color(0xFF374352),
                              shape: NeumorphicShape.convex, boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(40)),),
                            padding: const EdgeInsets.all(17.0),
                            child: const Align(
                                alignment: Alignment.center,
                                child: Icon(Icons.backspace, color: Colors.green, size: 30,)
                            )
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: NeumorphicButton(
                          // margin: EdgeInsets.only(top: 12),
                            onPressed: () {
                              NeumorphicTheme.of(context)?.themeMode =
                              NeumorphicTheme.isUsingDark(context) as ThemeMode;
                              context.read<CalculatorCubit>().bodmas();
                            },
                            style: NeumorphicStyle(
                              shadowLightColor: Colors.black, color: const Color(0xFF374352),
                              shape: NeumorphicShape.convex, boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(40)),),
                            padding: const EdgeInsets.all(4.0),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text("=", style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 46, color: Colors.green),),
                            )
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


}