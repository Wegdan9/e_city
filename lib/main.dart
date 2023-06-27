
import 'package:flutter/material.dart';

void main() => (runApp(MyApp()));


class MyApp extends StatelessWidget{

  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(child: Text('E-City')),
      ),
    );
  }
}