import 'package:calculator/bloc/calculatorCubit.dart';
import 'package:calculator/screens/fourthScreen_NamedRouting.dart';
import 'package:calculator/screens/home.dart';
import 'package:calculator/screens/thirdScreen_NamedRouting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CalculatorCubit _calculatorCubit = CalculatorCubit();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => BlocProvider.value(
            value: _calculatorCubit,
            child: Home()),
        '/third': (context) => BlocProvider.value(
            value: _calculatorCubit,
            child: ThirdScreen()),
        '/fourth': (context) => BlocProvider.value(
            value: _calculatorCubit,
            child: FourthScreen()),
      },
      // home: BlocProvider<CalculatorCubit>(
      //     create: (BuildContext context) => CalculatorCubit(),
      // child: Home()),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _calculatorCubit.close();
    super.dispose();
  }
}
