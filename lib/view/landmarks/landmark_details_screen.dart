import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_city/controller/landmark_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/size.dart';

class LandmarkDetailsScreen extends StatelessWidget {
  static final String LANDMARK_DETAILS_SCREEN_ROUTE = '/landmarkScreenRoute';

   LandmarkDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    double width = SizeConfiguration.screenWidth!;
    double height = SizeConfiguration.screenHeight!;
    final routeArguments = ModalRoute.of(context)!.settings.arguments as Map <String, int>;
    final landmarkId = routeArguments['landmarkId'];
    final landmarkDetails = Provider.of<LandmarkController>(context, listen: false).findLandmarkById(landmarkId!);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: color2,),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        title: Text(landmarkDetails.landmarkName, style: Theme.of(context).textTheme.bodyLarge,),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              CarouselSlider.builder(
                itemCount: landmarkDetails.landmarkImagePath.length,
                options: CarouselOptions(
                    height: height * 0.4,
                    autoPlay: true,
                    viewportFraction: 1,
                    autoPlayAnimationDuration: Duration(
                        seconds: 1
                    ),
                    disableCenter: true,
                   // enlargeFactor: 0.5,
                    enlargeCenterPage: true,
                    autoPlayCurve: Curves.ease
                ),
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return  ClipRRect(
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                    child: ColorFiltered(
                        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.multiply),
                        child: Image.asset(landmarkDetails.landmarkImagePath[index], fit: BoxFit.cover,)),
                  );
                },
              ),
              Positioned(
                right: width * 0.01,
                child: IconButton(
                    icon: Icon(Icons.favorite_border,size: 30,),
                    color: color1,

                    onPressed: (){},
                  ),
              ),

            ],
          ),
          Text(landmarkDetails.landmarkName, style: Theme.of(context).textTheme.bodyLarge,),
          SizedBox(height: height * 0.01,),
          Expanded(
            child: Padding(
              padding:  EdgeInsets.all(width * 0.02),
              child: ListView.builder(
                  itemCount: landmarkDetails.landmarkDescription.length,
                  itemBuilder: (context, index) => Text(landmarkDetails.landmarkDescription[index],
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.bodyMedium,),
              ),
            ),
          )

        ],
      ),

    );
  }
}
