import 'package:e_city/constants/size.dart';
import 'package:e_city/view/home_screen/widgets/drawer_widget.dart';

import 'package:flutter/material.dart';


import '../../../constants/colors.dart';
import 'widgets/home_widget.dart';
import 'widgets/landmarks_widget.dart';
import 'widgets/trips_widget.dart';

class HomeScreen extends StatelessWidget {

  List<Widget> _tabWidgets =[
    TripsWidget(),
    LandmarksWidget(),
    HomeWidget(),
  ];
   HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    double width = SizeConfiguration.screenWidth!;
    double height = SizeConfiguration.screenHeight!;

    return DefaultTabController(
      length: _tabWidgets.length,
      initialIndex: 2,
      child: Scaffold(
        drawer: DrawerWidget(),
        appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.dashboard, color: color2,),
            onPressed: (){
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
          title: Text('المدينة الالكترونية', style: Theme.of(context).textTheme.bodyLarge,),
          centerTitle: true,
        ),
          body: Column(
            children: [
              TabBar(
                physics: const BouncingScrollPhysics(),
                unselectedLabelColor: color2.withOpacity(0.4),
                labelColor: color2,
                indicatorColor: color2,
                labelStyle: Theme.of(context).textTheme.bodyMedium,
                tabs: [

                    Tab(
                      icon: Icon(Icons.directions_boat_outlined),
                      text: 'الرحلات',
                    ),
                    Tab(
                      icon: Icon(Icons.travel_explore_outlined),
                      text: 'ابرز المعالم',
                    ),
                    Tab(
                    icon: Icon(Icons.home_outlined),
                    text:'الرئيسية',
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
