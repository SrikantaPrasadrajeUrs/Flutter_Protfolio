import 'package:flutter/material.dart';
import 'package:srikanta_protfolio/storage/constants.dart';

import '../storage/constants/my_colors.dart';

class AnimatedJumpingImage extends StatefulWidget {
  final double width;
  final double height;
  const AnimatedJumpingImage({super.key, required this.width, required this.height});

  @override
  State<AnimatedJumpingImage> createState() => _AnimatedJumpingImageState();
}

class _AnimatedJumpingImageState extends State<AnimatedJumpingImage> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  @override
  void initState() {
    _controller=AnimationController(vsync: this,duration:const Duration(milliseconds: 1000),)..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return AnimatedBuilder(
        animation: _controller,
        builder: (context,child){
          final val=_controller.value;
          return Transform.translate(
            offset: Offset(0,8.5*val),
            child: Container(
              padding:const EdgeInsets.all(10),
            width:widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient:colorGradient,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.shade100,
                    offset:const Offset(-2, 3.5),
                    blurRadius: (size.width+size.height)*.014,
                    spreadRadius:  (size.width+size.height)*.006
                  ),
                   BoxShadow(
                      color: Colors.blue,
                      offset:const Offset(2, -12),
                      blurRadius: (size.width+size.height)*.014,
                  ),
                ]
              ),
              child: Image.asset('asset/images/image.png',fit: BoxFit.cover,),
            ),
          );
        }
    );
  }
}
