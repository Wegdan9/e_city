import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:e_city/view/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../constants/colors.dart';
import '../constants/size.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    double width = SizeConfiguration.screenWidth!;
    double height = SizeConfiguration.screenHeight!;

    return AnimatedSplashScreen(
      splash: Center(
        ///here we created a Container of the splash_screen screen content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: width * 0.40,
              height: height * 0.40,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(image: AssetImage('assets/images/city_1068531.png'),),
              ),
            ),
            Text('المدينة الالكترونية', style: Theme.of(context).textTheme.bodyLarge,)
          ],
        ),

      ),
      ///specifying the splash_screen icon size
      splashIconSize: 500,
      ///specifying the duration of the splash_screen screen
      duration: 1500,
      ///the way of displaying the splash_screen content
      splashTransition: SplashTransition.slideTransition,
      backgroundColor: color3,
      /// the duration of splash_screen transition
      animationDuration:  Duration(milliseconds: 1200),
      /// how to transition the splash_screen screen
      pageTransitionType: PageTransitionType.fade,
      curve: Curves.easeInOutBack,
      nextScreen: HomeScreen()
    );
    /// need more enhancement : green color at the top + text upgrade
  }
}
