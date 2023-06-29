
import 'package:e_city/controller/landmark_controller.dart';
import 'package:e_city/controller/services_controller.dart';
import 'package:e_city/controller/trips_controller.dart';
import 'package:e_city/splash_screen/splash_screen.dart';
import 'package:e_city/view/landmarks/landmark_details_screen.dart';
import 'package:e_city/view/trips/trip_details_screen.dart';
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
        ChangeNotifierProvider(create: (context) => TripsController(),),
        ChangeNotifierProvider(create: (context) => ServicesController(),)
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
                fontFamily: 'Almarai-Regular',
            ),
            bodyMedium: const TextStyle(
                color: color2,
                fontSize: 18,
                fontFamily: 'Almarai-Regular'
            ),
          )
        ),
        home: SplashScreen(),
        routes: {
          LandmarkDetailsScreen.LANDMARK_DETAILS_SCREEN_ROUTE:(context) => LandmarkDetailsScreen(),
          TripDetailsScreen.TRIP_DETAILS_SCREEN_ROUTE:(context) => TripDetailsScreen(),

        },

      ),
    );
  }
}