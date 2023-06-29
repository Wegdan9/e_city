import 'package:e_city/controller/services_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../../constants/colors.dart';
import '../../../constants/size.dart';



class DrawerWidget extends StatelessWidget {
    String? category;
   DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    double width = SizeConfiguration.screenWidth!;
    double height = SizeConfiguration.screenHeight!;
    final services = Provider.of<ServicesController>(context, listen: false);
    return Drawer(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal:  width * 0.02, vertical: height * 0.05),
        itemCount: services.getServices.length,
        itemBuilder: (context, index) => InkWell(
          onTap: services.getServices[index].serviceLink,
          child: Column(
            children: [
              SizedBox( height: services.getServices[index].serviceIcon == null ? height * 0.05 : height * 0.03,),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(services.getServices[index].serviceName!, style: Theme.of(context).textTheme.bodyLarge,),
                  SizedBox(width: width * 0.01,),
                  Icon(services.getServices[index].serviceIcon, color: color1,),
                ],
              ),
              Divider(
                indent: width * 0.1,
                endIndent: width * 0.01,
                thickness: services.getServices[index].serviceLink == null ? height * 0.002 : null,),
            ],
          )
        ),

      )
    );
  }
}
