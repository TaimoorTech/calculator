import 'package:calculator/Routes/routerApp.dart';
import 'package:calculator/bloc/calculatorCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CalculatorCubit _calculatorCubit = CalculatorCubit();
  final RouterApp _routerApp = RouterApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalculatorCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        onGenerateRoute: _routerApp.onGenerateRoute,
        // routes: {
        //   '/': (context) => BlocProvider.value(
        //       value: _calculatorCubit,
        //       child: Home()),
        //   '/third': (context) => BlocProvider.value(
        //       value: _calculatorCubit,
        //       child: ThirdScreen()),
        //   '/fourth': (context) => BlocProvider.value(
        //       value: _calculatorCubit,
        //       child: FourthScreen()),
        // },
        // home: BlocProvider<CalculatorCubit>(
        //     create: (BuildContext context) => CalculatorCubit(),
        // child: Home()),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _calculatorCubit.close();
    super.dispose();
  }
}
