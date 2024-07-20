import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:srikanta_protfolio/storage/components/connect_button.dart';
import 'package:srikanta_protfolio/storage/components/my_description.dart';
import 'package:srikanta_protfolio/storage/components/social_media.dart';
import 'package:srikanta_protfolio/storage/constants.dart';
import 'package:srikanta_protfolio/utils/animated_jumping_profile_bird.dart';
import '../../models/responsive.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction>
    with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: !Responsive.isLargeMobile(context)
        //mobile view
            ? Column(
                children: [
                  reusableSizedBox(context, .06, true, false),
                  //profile image - pulsating color
                  const AnimatedJumpingBird(),
                  reusableSizedBox(context, .1, true, false),
                  // name - animation - typing
                  const MyDescription(),
                  reusableSizedBox(context, .03, true, false),
                  const ConnectButton(
                    myIcon: FontAwesomeIcons.message,
                    text: "Resume",
                  ),
                 const Spacer(flex: 7,),
                ],
              )
        // laptop or tab view
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(15),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(flex: 8,),
                      SocialMedia(),
                      Spacer(flex: 30,)
                    ],
                  ),
                  const Spacer(),
                   Column(
                    children: [
                      const Spacer(),
                      const MyDescription(),
                      reusableSizedBox(context, .03, true, false),
                      const ConnectButton(
                        myIcon: FontAwesomeIcons.download,
                        text: "Resume",
                      ),
                      const Spacer(flex: 2,),
                    ],
                  ),
                  const Spacer(flex: 7,),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(
                        flex: 1,
                      ),
                      AnimatedJumpingBird(),
                      Spacer(
                        flex: 2,
                      ),
                    ],
                  ),
                  reusableSizedBox(context, .05, false, true),
                ],
              ),
            ),
          );
       }
    }
