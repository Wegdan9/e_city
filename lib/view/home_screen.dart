import 'package:e_city/constants/size.dart';
import 'package:e_city/view/widgets/home_widget.dart';
import 'package:e_city/view/widgets/landmarks_widget.dart';
import 'package:e_city/view/widgets/trips_widget.dart';
import 'package:flutter/material.dart';


import '../constants/colors.dart';

class HomeScreen extends StatelessWidget {

  List<Widget> _tabWidgets =[
    HomeWidget(),
    LandmarksWidget(),
    TripsWidget()
  ];
   HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    double width = SizeConfiguration.screenWidth!;
    double height = SizeConfiguration.screenHeight!;

    return DefaultTabController(
      length: _tabWidgets.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('المدينة الالكترونية', style: Theme.of(context).textTheme.bodyLarge,),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.dashboard, color: color2,),
            onPressed: (){},
          ),
        ),
          body: Column(
            children: [
              TabBar(
                physics: const BouncingScrollPhysics(),
                unselectedLabelColor: color2.withOpacity(0.4),
                labelColor: color2,
                indicatorColor: color2,
                labelStyle: Theme.of(context).textTheme.bodyMedium,
                  tabs:  const [
                Tab(
                    icon: Icon(Icons.home_outlined),
                    text:'الرئيسية',
                ),
                Tab(
                    icon: Icon(Icons.travel_explore_outlined),
                    text: 'ابرز المعالم',
                ),
                Tab(
                    icon: Icon(Icons.directions_boat_outlined),
                    text: 'الرحلات',
                ),
              ]),
               Expanded(
                child: TabBarView(
                  physics: BouncingScrollPhysics(),
                    children: [
                      ..._tabWidgets
                ]),
              )
            ],
          )),
    );
  }
}
