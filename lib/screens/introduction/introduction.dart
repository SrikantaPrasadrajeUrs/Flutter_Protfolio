import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:srikanta_protfolio/storage/components/connect_button.dart';
import 'package:srikanta_protfolio/storage/components/my_description.dart';
import 'package:srikanta_protfolio/storage/components/social_media.dart';
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
            ? const Column(
                children: [
                  Spacer(flex: 1,),
                  //profile image - pulsating color
                  AnimatedJumpingBird(),
                  Spacer(flex: 3,),
                  // name - animation - typing
                  MyDescription(),
                  Spacer(),
                  ConnectButton(
                    myIcon: FontAwesomeIcons.download,
                    text: "Resume",
                    color: null,
                    url: "https://drive.google.com/file/d/1364ceDP2wQbtTHBbYEjPiPpI9AvmqLrO/view?usp=sharing",
                  ),
                 Spacer(flex: 7,),
                ],
              )
        // laptop or tab view
            : const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(flex: 8,),
                      SocialMedia(),
                      Spacer(flex: 30,)
                    ],
                  ),
                  Spacer(),
                   Column(
                    children: [
                      Spacer(),
                      MyDescription(),
                      Gap(30),
                      ConnectButton(
                        myIcon: FontAwesomeIcons.download,
                        text: "Resume",
                        color: null,
                        url: "https://drive.google.com/file/d/1364ceDP2wQbtTHBbYEjPiPpI9AvmqLrO/view?usp=sharing",
                      ),
                      Spacer(flex: 2,),
                    ],
                  ),
                  Spacer(flex: 7,),
                  Column(
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
                  Spacer(
                    flex: 2,
                  )
                ],
              ),
            ),
          );
       }
    }
