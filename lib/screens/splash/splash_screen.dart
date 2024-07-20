import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:srikanta_protfolio/models/responsive.dart';
import 'package:srikanta_protfolio/navigation/routes_constant.dart';
import 'package:srikanta_protfolio/storage/constants.dart';
import 'package:srikanta_protfolio/utils/animated_jumping_image.dart';

import '../../utils/radial_progress_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // naviagte to home
    Timer(const Duration(seconds: 6), () {
      context.go(MyRouteConstants.goToHome);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //animation image
            // Responsive.isDesktop(context)
            //     ? const AnimatedJumpingImage(width: 500, height: 300)
            //     :
            Responsive.isMobile(context)
                    ? const AnimatedJumpingImage(width: 100, height: 100)
                    : const AnimatedJumpingImage(width: 300, height: 250),
            reusableSizedBox(context, .035, true, false),
            const MyRadialProgressIndicator(),
            //radial loading
          ],
        ),
      ),
    );
  }
}
