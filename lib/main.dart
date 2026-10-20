import 'package:flutter/material.dart';
import 'package:testing_git/core/utilss/app_routs.dart';
import 'package:testing_git/ui/screens/home/home_screen.dart';
import 'package:testing_git/ui/screens/home/intro_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:AppRouts.homeRouteName ,
      routes: {
        AppRouts.homeRouteName:(context) => HomeScreen(),
        AppRouts.introScreen:(context) => IntroScreen(),
      },

    );
  }
}