import 'package:flutter/material.dart';

class MyImage extends StatefulWidget {
  const MyImage({super.key});

  @override
  State<MyImage> createState() => _MyImageState();
}

class _MyImageState extends State<MyImage> {
  bool changeBorderColor = false;
  @override
  void initState() {
    super.initState();
    _startColorToggle();
  }

  void _startColorToggle() async {
    while (mounted) {
      await Future.delayed(const Duration(seconds: 2));
      if (mounted) {
        setState(() {
          changeBorderColor = !changeBorderColor;
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: MediaQuery.of(context).viewPadding,
      width: 100,
      height: 100,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        boxShadow: [
          BoxShadow(
            blurStyle: BlurStyle.solid,
            color: Colors.blue.withOpacity(.7),
            blurRadius: 15,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Colors.pink.withOpacity(.4),
            blurRadius: 15,
            spreadRadius: 1,
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: changeBorderColor?[Colors.blue, Colors.pink]:[Colors.pink, Colors.blue],
        ),
      ),
      duration: const Duration(seconds: 1),
      child: ClipOval(
        child: Image.asset(
          "asset/images/flutter_bird.png",// Set the desired height
          fit: BoxFit.cover, // Ensures the image fits within the bounds
        ),
      ),
    );
  }
}
