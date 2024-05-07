import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:srikanta_protfolio/storage/my_text_styles.dart';

import '../storage/constants.dart';

class MyRadialProgressIndicator extends StatefulWidget {
  const MyRadialProgressIndicator({ Key? key}):super(key: key);

  @override
  State<MyRadialProgressIndicator> createState() =>
      _MyRadialProgressIndicatorState();
}

class _MyRadialProgressIndicatorState extends State<MyRadialProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration: const Duration(seconds: 5),
        builder: (context, value, child) {
          return  Column(
            children: [
              SizedBox(
                width: size.width*.21,
                child: LinearProgressIndicator(
                  color: Colors.lightBlueAccent,
                  backgroundColor: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(10),
                  value:value,
                ),
              ),
              reusableSizedBox(context, .027, true, false),
              Transform.scale(
                  scale: (size.height+size.width)*.0008,
                  child: Text('${(value*100).toInt().toString()}%',style:smWTS,)),
            ],
          );
        });
  }
}
