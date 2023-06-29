import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/trips_controller.dart';
import 'trip_widget.dart';

class TripsWidget extends StatelessWidget {

  ///PAGE NUMBER 3 IN TAB BAR
  const TripsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trips = Provider.of<TripsController>(context, listen: false);

    return  ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: trips.getTrip.length,
        itemBuilder: (context, index) => TripWidget(index: index,trip: trips.getTrip,));

  }
}
