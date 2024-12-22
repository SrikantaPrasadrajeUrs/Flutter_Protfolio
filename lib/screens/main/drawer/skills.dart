import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class MySkills extends StatelessWidget {
  const MySkills({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AnimatedLinearProgressIndicator(imgPath: "asset/icons/flutter.png", percentage: 88, title: "Flutter",imageType: ImageType.png,),
        AnimatedLinearProgressIndicator(imgPath: "asset/icons/dart.png", percentage: 90, title: "Dart",imageType: ImageType.png,),
        AnimatedLinearProgressIndicator(imgPath: "asset/icons/firebase.png", percentage: 60, title: "Firebase",imageType: ImageType.png,),
        // AnimatedLinearProgressIndicator(imgPath: "asset/svgs/reactNative.svg", percentage: 60, title: "ReactNative",imageType: ImageType.svg,),
        AnimatedLinearProgressIndicator(imgPath: "asset/icons/bloc.png", percentage: 80, title: "Bloc",imageType: ImageType.png,),
        AnimatedLinearProgressIndicator(imgPath: "asset/svgs/riverpod.png", percentage: 92, title: "RiverPod",imageType: ImageType.png,),
        // AnimatedLinearProgressIndicator(imgPath: "asset/svgs/spring.svg", percentage: 70, title: "SpringBoot",imageType: ImageType.svg,),
        AnimatedLinearProgressIndicator(imgPath: "asset/svgs/nodejs.svg", percentage: 70, title: "Node.js",imageType: ImageType.svg,),
      ],
    );
  }
}


class AnimatedLinearProgressIndicator extends StatefulWidget{
  final double percentage;
  final String imgPath;
  final String title;
  final ImageType imageType;
  const AnimatedLinearProgressIndicator({super.key,required this.imgPath,required this.percentage,required this.title,required this.imageType});

  @override
  State<AnimatedLinearProgressIndicator> createState() => _AnimatedLinearProgressIndicatorState();
}

class _AnimatedLinearProgressIndicatorState extends State<AnimatedLinearProgressIndicator> with SingleTickerProviderStateMixin{

  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this,duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 0,end: widget.percentage/100), duration: const Duration(milliseconds: 1200),
        builder: (context, value, child){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  widget.imageType == ImageType.png || widget.imageType == ImageType.jpg
                      ? Image.asset(widget.imgPath, width: 15, height: 15)
                      : SvgPicture.asset(widget.imgPath, width: 15, height: 15),
                  const Gap(10),
                  Text(widget.title,style: Theme.of(context).textTheme.titleMedium
                      ?.copyWith(color: Colors.white60, fontSize: 14))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 9,
                    child: LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(10),
                      value: value,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      color: Colors.amberAccent,
                      ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text("${(value*100).toStringAsFixed(0)}%",style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white, fontSize: 14)),
                  )
                ],
              )
            ],
          );
    });
  }
}


enum ImageType{
  svg,
  png,
  jpg
}
