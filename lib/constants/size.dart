
import 'package:flutter/cupertino.dart';

class SizeConfiguration{
static MediaQueryData? _mediaQueryData;
static double? screenWidth;
static double? screenHeight;


void init(BuildContext context){
_mediaQueryData = MediaQuery.of(context);
screenWidth = _mediaQueryData!.size.width;
print('width ${screenWidth}');
screenHeight = _mediaQueryData!.size.height;
print('height ${screenHeight}');


}

}