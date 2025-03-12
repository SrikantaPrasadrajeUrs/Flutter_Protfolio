import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:srikanta_protfolio/storage/components/connect_button.dart';
import 'package:srikanta_protfolio/storage/components/my_description.dart';
import 'package:srikanta_protfolio/storage/components/social_media.dart';
import '../../models/responsive.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _dropBtnAnimationController;
  late AnimationController _connectBtnController;
  late Animation<Offset> _xDisplaceAnimation;
  late Animation<Offset> _yDisplaceAnimation;
  late Animation<Offset> _dropBtnAnimation;

  @override
  void initState() {
    super.initState();
    _dropBtnAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _connectBtnController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _xDisplaceAnimation = Tween<Offset>(
      begin: const Offset(1.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _yDisplaceAnimation = Tween<Offset>(
      begin: const Offset(0, -1.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _dropBtnAnimation = Tween<Offset>(
      begin: const Offset(0, -14.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _dropBtnAnimationController, curve: Curves.bounceOut),
    );

    // Start the non-ConnectButton animations first,
    // then trigger the custom ConnectButton animation.
    _controller.forward().then((_) {
      _dropBtnAnimationController.forward();
      _connectBtnController.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _dropBtnAnimationController.dispose();
    _connectBtnController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: !Responsive.isLargeMobile(context)
            ? Column(
          children: [
            const Spacer(flex: 1),
            SlideTransition(
              position: _yDisplaceAnimation,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  'asset/images/selfie2.jpg',
                  height: 250,
                ),
              ),
            ),
            const Spacer(flex: 1),
            const MyDescription(),
            const Spacer(flex: 2),
            AnimatedBuilder(
              animation: _dropBtnAnimation,
              builder: (context, _) {
                return SlideTransition(
                  position: _dropBtnAnimation,
                  child: const ConnectButton(
                    icon: FontAwesomeIcons.download,
                    text: "Resume",
                    color: null,
                    url:
                    "https://drive.google.com/file/d/14_w56kSTR672gr-0jnlKWbTTdSI8dTUR/view?usp=drive_link",
                  ),
                );
              },
            ),
            const Spacer(flex: 6),
          ],
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(15),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(flex: 8),
                SocialMedia(),
                Spacer(flex: 30),
              ],
            ),
            const Spacer(),
            AnimatedBuilder(
              animation: _yDisplaceAnimation,
              builder: (context, _) {
                return SlideTransition(
                  position: _yDisplaceAnimation,
                  child: Column(
                    children: [
                      const Spacer(),
                      const MyDescription(),
                      const Gap(30),
                      AnimatedBuilder(
                        animation: _connectBtnController,
                        builder: (context, child) {
                          double t = _connectBtnController.value;
                          double dx = 1300 * (1 - t);
                          double bounceValue = Curves.bounceOut.transform(t).clamp(0.0, 5);
                          double dy = -400 * (1 - bounceValue)*(2*(1.2+t));
                          return Transform.translate(
                            offset: Offset(dx, dy),
                            child: child,
                          );
                        },
                        child: const ConnectButton(
                          icon: FontAwesomeIcons.download,
                          text: "Resume",
                          color: null,
                          url:
                          "https://drive.google.com/file/d/14_w56kSTR672gr-0jnlKWbTTdSI8dTUR/view?usp=drive_link",
                        ),
                      ),
                      const Spacer(flex: 2),
                    ],
                  ),
                );
              },
            ),
            const Spacer(flex: 7),
            Column(
              children: [
                const Spacer(flex: 1),
                AnimatedBuilder(
                  animation: _xDisplaceAnimation,
                  builder: (context, _) {
                    return SlideTransition(
                      position: _xDisplaceAnimation,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          'asset/images/selfie2.jpg',
                          height: 300,
                        ),
                      ),
                    );
                  },
                ),
                const Spacer(flex: 2),
              ],
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
