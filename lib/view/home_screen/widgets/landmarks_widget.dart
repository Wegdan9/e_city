import 'package:e_city/controller/landmark_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import 'landmark_widget.dart';

class LandmarksWidget extends StatelessWidget {
  ///PAGE NUMBER 2 IN TAB BAR
  const LandmarksWidget({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    final landmarks = Provider.of<LandmarkController>(context, listen: false);

    return  ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: landmarks.getLandmark.length,
          itemBuilder: (context, index) => LandmarkWidget(index: index,landmark: landmarks.getLandmark,).animate().flip());

  }
}
