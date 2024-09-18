import 'package:flutter/material.dart';
import '../models/responsive.dart';

class AnimatedJumpingBird extends StatefulWidget {
  const AnimatedJumpingBird({super.key});

  @override
  State<AnimatedJumpingBird> createState() => _AnimatedJumpingBirdState();
}

class _AnimatedJumpingBirdState extends State<AnimatedJumpingBird>
    with SingleTickerProviderStateMixin {
  List<String> chars = [];
  late AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1700))
      ..repeat(reverse: true);
    super.initState();
  }
@override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(0, animationController.value * 20),
          child: Container(
            height: Responsive.isMobile(context)?200:280,
            width: Responsive.isMobile(context)?200:280,
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage("asset/images/flutter_bird.png"),
                    opacity: 95),
                border: Border.all(color: Colors.lightBlue.shade100, width: 3),
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.lightBlue,
                      blurRadius: animationController.value * 15,
                      spreadRadius: 1),
                  BoxShadow(
                      color: Colors.blue,
                      blurRadius: animationController.value * 15,
                      spreadRadius: 1),
                  BoxShadow(
                      color: Colors.purpleAccent.withOpacity(.3),
                      blurRadius: animationController.value * 15,
                      spreadRadius: 1),
                  BoxShadow(
                      color: Colors.pinkAccent.withOpacity(.5),
                      blurRadius: animationController.value * 15,
                      spreadRadius: 1),
                ]),
          ),
        );
      },
    );
  }
}
