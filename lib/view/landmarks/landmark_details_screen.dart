import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_city/controller/landmark_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/size.dart';

class LandmarkDetailsScreen extends StatefulWidget {
  static final String LANDMARK_DETAILS_SCREEN_ROUTE = '/landmarkScreenRoute';

   LandmarkDetailsScreen({Key? key}) : super(key: key);

  @override
  State<LandmarkDetailsScreen> createState() => _LandmarkDetailsScreenState();
}

class _LandmarkDetailsScreenState extends State<LandmarkDetailsScreen> {

    int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    double width = SizeConfiguration.screenWidth!;
    double height = SizeConfiguration.screenHeight!;
    final landmarkId = ModalRoute.of(context)!.settings.arguments as int;
    final landmarkDetails = Provider.of<LandmarkController>(context, listen: false).findLandmarkById(landmarkId!);
    final imageHeight = height * 0.45;

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
      body: Stack(
        children: [
          Positioned(
            height: imageHeight,
            left: 0,
            right: 0,
            child: CarouselSlider.builder(
              itemCount: landmarkDetails.landmarkImagePath.length,
              options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  height: imageHeight,
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
                return  Hero(
                  tag: 'imageTag ${landmarkDetails.landmarkImagePath[index]}',
                  child: ColorFiltered(
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.multiply),
                      child: Image.asset(landmarkDetails.landmarkImagePath[index], fit: BoxFit.cover,)),
                );
              },
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            top: width * -0.03,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color4
              ),
              child: IconButton(
                  icon: Icon(Icons.favorite_border,size: 30,color: color2),
                  onPressed: (){},
                ),
            ),
          ),
          Positioned(
              top: imageHeight * 0.8 ,
              right: 0,
              left: 0,
              child: DotsIndicator(
                dotsCount: landmarkDetails.landmarkImagePath.length,
                position: currentIndex,
                decorator: DotsDecorator(
                  activeColor: color2
                ),
              ),
          ),
          Positioned(
            top: imageHeight * 0.95,
            bottom: 0,
            left: 0,
            right: 0,
              child: Container(
                padding: EdgeInsets.all(width * 0.02),
                decoration: BoxDecoration(
                  color: color4,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(width * 0.05),topRight: Radius.circular(width * 0.05))
                ),
                child: Column(
                  children: [
                    Hero(
                      tag: 'nameTag ${landmarkDetails.landmarkName}',
                      child: Text(
                        landmarkDetails.landmarkName, style: Theme.of(context).textTheme.bodyLarge,),
                    ),
                    SizedBox(height: height * 0.01,),
                    Expanded(
                      child: Padding(
                        padding:  EdgeInsets.all(width * 0.02),
                        child: Hero(
                          tag: 'DescTag ${landmarkDetails.landmarkDescription}',
                          child: ListView.builder(
                            itemCount: landmarkDetails.landmarkDescription.length,
                            itemBuilder: (context, index) => Text(landmarkDetails.landmarkDescription[index],
                              textDirection: TextDirection.rtl,
                              style: Theme.of(context).textTheme.bodyMedium,),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
          ),
        ],
      ),

    );
  }
}
