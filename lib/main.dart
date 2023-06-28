
import 'package:e_city/view/home_screen.dart';
import 'package:flutter/material.dart';

import 'constants/colors.dart';

void main() => (runApp(MyApp()));


class MyApp extends StatelessWidget{

  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme.of(context).copyWith(
            color: color4,
            elevation: 0,
        ),
        canvasColor: color4,
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: const TextStyle(
              color: color1,
              fontSize: 22,
              fontWeight: FontWeight.w900,
              fontFamily: 'Cairo-Regular'
          ),
          bodyMedium: const TextStyle(
              color: color2,
              fontSize: 16,
              fontFamily: 'Cairo-Regular'
          ),
        )
      ),
      home: HomeScreen(),

    );
  }
}