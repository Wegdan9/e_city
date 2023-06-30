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
                  margin: EdgeInsets.all(width * 0.02),
                  height: height * 0.5,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.multiply),
                      image: AssetImage(trip[index].tripImagePath[0]),
                      fit: BoxFit.cover
                    )
                  ),
                ),
              ),

            ],
          ),
          Hero(
              tag: 'nameTag ${trip[index].tripName}',
              child: Text(trip[index].tripName, style: Theme.of(context).textTheme.bodyLarge,)),
          Hero(
              tag: 'descTag ${trip[index].tripDescription}',
              child: Text(trip[index].tripDescription.toString(),textDirection: TextDirection.rtl, maxLines: 3,overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodyMedium,)),
          SizedBox(height: height * 0.01,),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon:Icon(Icons.favorite_border, size: 30, color: color2,),
                  onPressed: (){},),
                VerticalDivider(
                  thickness: 1,
                  color: color2,
                  width: 2,
                ),
                Hero(
                  tag: 'ratingTag ${trip[index].rating}',
                  child: Row(
                    children: [
                      Text('${trip[index].rating}', style: Theme.of(context).textTheme.bodyLarge,),
                      Icon(Icons.star_border_purple500_outlined, size: 30, color: color2,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],

      ),
    );
  }
}
