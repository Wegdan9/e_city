import 'package:e_city/model/trip.dart';
import 'package:e_city/view/trips/trip_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/size.dart';

class TripWidget extends StatelessWidget {

  int index;
  List<Trip> trip;
  TripWidget({Key? key, required this.index, required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    double width = SizeConfiguration.screenWidth!;
    double height = SizeConfiguration.screenHeight!;
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(TripDetailsScreen.TRIP_DETAILS_SCREEN_ROUTE, arguments: {
          'tripIndex':index
        });
      },
      child: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: 'imageTag ${trip[index].tripImagePath}',
                child: Container(
                  height: height * 0.5,
                  width: width,
                  margin: EdgeInsets.all(width * 0.02),
                  decoration: BoxDecoration(
                   // borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.multiply),
                      image: AssetImage(trip[index].tripImagePath[0]),
                      fit: BoxFit.cover
                    )
                  ),
                ),
              ),
              Positioned(
                right: width * 0.01,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color4
                  ),
                  child: IconButton(
                    icon:Icon(Icons.favorite_border, size: 30, color: color1,),
                    onPressed: (){},),
                ),
              ),
              Positioned(
                left: width * 0.01,
                top: width * 0.01,
                child: Container(
                  padding: EdgeInsets.all(width * 0.01),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12),
                      color: color4
                  ),
                  child: Hero(
                      tag: 'ratingTag ${trip[index].rating}',
                      child: Text('${trip[index].rating}', style: Theme.of(context).textTheme.bodyLarge,)),
                ),
              ),

            ],
          ),
          Hero(
              tag: 'nameTag ${trip[index].tripName}',
              child: Text(trip[index].tripName, style: Theme.of(context).textTheme.bodyLarge,)),
          SizedBox(height: height * 0.01,),
          Divider(height: 1,color: color1, thickness: 1,indent: width * 0.1, endIndent: width * 0.1,),
          SizedBox(height: height * 0.01,),
          Hero(
              tag: 'descTag ${trip[index].tripDescription}',
              child: Text(trip[index].tripDescription.toString(),textDirection: TextDirection.rtl, maxLines: 3,overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodyMedium,)),
        ],

      ),
    );
  }
}
