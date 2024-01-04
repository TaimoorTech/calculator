import 'package:calculator/screens/fourthScreen_NamedRouting.dart';
import 'package:calculator/screens/home.dart';
import 'package:calculator/screens/secondScreen_AnonymousRouting.dart';
import 'package:calculator/screens/thirdScreen_NamedRouting.dart';
import 'package:flutter/material.dart';

class RouterApp{

  MaterialPageRoute? onGenerateRoute(RouteSettings routeSettings){

    switch(routeSettings.name){
        case '/':
          return MaterialPageRoute(builder: (_) => const Home());
        case '/second':
          return MaterialPageRoute(builder: (_) => const SecondScreen());
        case '/third':
          return MaterialPageRoute(builder: (_) => const ThirdScreen());
        case '/fourth':
          return MaterialPageRoute(builder: (_) => const FourthScreen());
        default:
          return null;
    }
  }
}