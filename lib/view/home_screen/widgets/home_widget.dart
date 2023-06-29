
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:video_player/video_player.dart';import '../../../constants/colors.dart';


import '../../../constants/size.dart';

class HomeWidget extends StatefulWidget {
  ///PAGE NUMBER 1 IN TAB BAR
  HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {

  VideoPlayerController? controller;

  @override
  void initState() {
     controller = VideoPlayerController.asset('assets/video/facebook-video-cl.mp4')
       ..initialize();

     super.initState();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    controller!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    double width = SizeConfiguration.screenWidth!;
    double height = SizeConfiguration.screenHeight!;
    return Container(
      margin: EdgeInsets.all(width * 0.01),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Stack(
            children: [
              Container(
                height: height * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: VideoPlayer(controller!)),
              ),
              Positioned(
                bottom:width * 0.1,
                left: 0,
                right: 0,
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(controller!.value.isPlaying ? Icons.stop_circle : Icons.play_circle, size: width * 0.18,color: color2,),
                        onPressed: (){
                          setState(() {
                            controller!.value.isPlaying ? controller!.pause() : controller!.play();
                          });
                        }, ),
                  ],
                ),
              ),
            ],
          ).animate().shimmer(duration: Duration(seconds: 1)),
          SizedBox(height: height * 0.01,),
          Text(
            'لماذا شرم الشيخ ؟',
            style: Theme.of(context).textTheme.bodyLarge,
          ).animate().slideX(),
          SizedBox(height: height * 0.01,),
          Text(
            'تعد شرم الشيخ من الاماكن الجذابة في العالم حيث تقع علي خليج العقبة والتي تبعد حوالي 300 كم عن محمية رأس محمد الوطنية بالاضاافة الي ذلك احتوائها علي افشل الاماكن السياحية.',
            textDirection: TextDirection.rtl,
            style: Theme.of(context).textTheme.bodyMedium,
          ).animate().slideX(),
        ],
      ),
    );
  }
}
