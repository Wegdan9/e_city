
import 'package:e_city/controller/landmark_controller.dart';
import 'package:e_city/view/landmarks/landmark_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants/colors.dart';
import 'view/home_screen/home_screen.dart';

void main() => (runApp(MyApp()));


class MyApp extends StatelessWidget{

  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LandmarkController(),),
      ],
      child: MaterialApp(
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
                fontFamily: 'Cairo-Regular',
            ),
            bodyMedium: const TextStyle(
                color: color2,
                fontSize: 16,
                fontFamily: 'Cairo-Regular'
            ),
          )
        ),
        home: HomeScreen(),
        routes: {
          LandmarkDetailsScreen.LANDMARK_DETAILS_SCREEN_ROUTE:(context) => LandmarkDetailsScreen(),

        },

      ),
    );
  }
}