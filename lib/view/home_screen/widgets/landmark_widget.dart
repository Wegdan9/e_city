import 'package:e_city/view/landmarks/landmark_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/size.dart';
import '../../../model/landmark.dart';


class LandmarkWidget extends StatelessWidget {
  int index;
  List<Landmark> landmark;
   LandmarkWidget({Key? key, required this.index, required this.landmark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    double width = SizeConfiguration.screenWidth!;
    double height = SizeConfiguration.screenHeight!;

    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(LandmarkDetailsScreen.LANDMARK_DETAILS_SCREEN_ROUTE, arguments: {
        'landmarkIndex': index
        });
      },
      child: Container(
        padding: EdgeInsets.all(width * 0.01),
        margin: EdgeInsets.all(width * 0.01),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Expanded(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(landmark[index].landmarkName!, style: Theme.of(context).textTheme.bodyLarge,),
            Text(landmark[index].landmarkDescription.toString(), maxLines: 3, overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.bodyMedium,),
            Align(
                alignment: Alignment.bottomLeft,
                child: IconButton(
                  icon: Icon(Icons.favorite_border, color: color1),
                  onPressed: (){

                  },
                )
            ),
          ],
        ),
      ),
            Container(
              width: width * 0.3,
              height: height *0.2,
              padding: EdgeInsets.all(width * 0.02),
              margin: EdgeInsets.all(width * 0.02),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: AssetImage(landmark[index].landmarkImagePath[0]),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.multiply)
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
