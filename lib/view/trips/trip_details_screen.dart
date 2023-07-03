import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_city/controller/trips_controller.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/size.dart';

class TripDetailsScreen extends StatefulWidget {

   static final String TRIP_DETAILS_SCREEN_ROUTE = '/tripDetailsScreenRoute';

   TripDetailsScreen({Key? key}) : super(key: key);

  @override
  State<TripDetailsScreen> createState() => _TripDetailsScreenState();
}

class _TripDetailsScreenState extends State<TripDetailsScreen> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    double width = SizeConfiguration.screenWidth!;
    double height = SizeConfiguration.screenHeight!;
    final tripIndex = ModalRoute.of(context)!.settings.arguments as int;
    final tripDetails = Provider.of<TripsController>(context, listen: false).findTripById(tripIndex);
    final imageHeight = height * 0.5;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: color2,),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        title: Text(tripDetails.tripName, style: Theme.of(context).textTheme.bodyLarge,),
      ),
      body: Stack(
        children: [
          Positioned(
            height: imageHeight,
            left: 0,
            right: 0,
            child: Hero(
              tag: 'imageTag ${tripDetails.tripImagePath}',
              child: CarouselSlider.builder(
                itemCount: tripDetails.tripImagePath.length,
                options: CarouselOptions(
                    height: imageHeight,
                    autoPlay: true,
                    scrollPhysics: BouncingScrollPhysics(),
                    viewportFraction: 1,
                    autoPlayAnimationDuration: Duration(
                        seconds: 1
                    ),
                    disableCenter: true,
                    // enlargeFactor: 0.5,
                    enlargeCenterPage: true,
                    autoPlayCurve: Curves.ease,
                    onPageChanged: (index, reason) => setState((){currentIndex = index;}),
                ),
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return  ColorFiltered(
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.multiply),
                      child: Image.asset(tripDetails.tripImagePath[index], fit: BoxFit.cover,));
                },
              ),
            ),
          ),
          Positioned(
            right: 0,
            left:  0,
            top: width * -0.03,
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color4
              ),
              child: IconButton(
                icon: Icon(Icons.favorite_border,size: 30, color: color2,),
                onPressed: (){

                },
              ),
            ),
          ),
          Positioned(
            top: imageHeight * 0.8,
            left: 0,
            right: 0,
              child: DotsIndicator(
                dotsCount: tripDetails.tripImagePath.length,
                position: currentIndex,
                decorator: DotsDecorator(
                  activeColor: color2,
                ),
              )),
          Positioned(
            top: imageHeight * 0.95,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(width * 0.02),
              decoration: BoxDecoration(
                color: color4,
                borderRadius: BorderRadius.only(topRight: Radius.circular(width * 0.05),topLeft: Radius.circular(width * 0.05)),
              ),
              child: Column(
                children: [
                  Hero(
                      tag: 'nameTag ${tripDetails.tripName}',
                      child: Text(tripDetails.tripName, style: Theme.of(context).textTheme.bodyLarge,)),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.all(width * 0.01),
                      decoration: BoxDecoration(
                        color: color3,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Hero(
                          tag: 'ratingTag ${tripDetails.rating}',
                          child: Text('التقييم: ${tripDetails.rating}', style: Theme.of(context).textTheme.bodyLarge,)),
                    ),
                  ),
                  SizedBox(height: height * 0.01,),
                  Expanded(
                    child: Padding(
                      padding:  EdgeInsets.all(width * 0.02),
                      child: Hero(
                        tag: 'descTag ${tripDetails.tripDescription}',
                        child: ListView.builder(
                          itemCount: tripDetails.tripDescription.length,
                          itemBuilder: (context, index) => Text(tripDetails.tripDescription[index],
                            textDirection: TextDirection.rtl,
                            style: Theme.of(context).textTheme.bodyMedium,),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )

        ],
      ),

    );
    }
}
