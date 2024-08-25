import 'package:flutter/material.dart';
import 'package:news_app/home_screen.dart';
import 'package:news_app/theme/my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.light,
      initialRoute:HomeScreen.routeName ,
      routes: {
        HomeScreen.routeName:(context)=> const HomeScreen(),

      },
    );
  }
}