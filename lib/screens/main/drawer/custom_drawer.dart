
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:srikanta_protfolio/screens/main/drawer/about.dart';
import 'package:srikanta_protfolio/screens/main/drawer/knowledge.dart';
import 'package:srikanta_protfolio/screens/main/drawer/personal_info.dart';
import 'package:srikanta_protfolio/screens/main/drawer/skills.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../storage/components/custom_divider.dart';
import '../../../storage/components/social_media_icon.dart';
import '../../../storage/constants/my_enums.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const Gap(20),
              const About(),
              const Gap(15),
              const CustomDivider(height: 2, colors: [Colors.grey, Colors.white], horizontalMargin: 0, verticalMargin: 5, begin: Alignment.centerLeft, end: Alignment.centerRight),
              const Gap(5),
              const PersonalInfo(),
              const CustomDivider(height: 2, colors: [Colors.grey, Colors.white], horizontalMargin: 0, verticalMargin: 5, begin: Alignment.centerLeft, end: Alignment.centerRight),
              const Gap(5),
              const MySkills(),
              const CustomDivider(height: 2, colors: [Colors.grey, Colors.white], horizontalMargin: 0, verticalMargin: 5, begin: Alignment.centerLeft, end: Alignment.centerRight),
              const Gap(5),
              const Knowledge(),
              const Gap(5),
              buildSocialIcons()
            ],
          ),
        ),
      ),
    );
  }
  Widget buildSocialIcons(){
    return Row(
      children: [
        SocialMediaIcon(icon: FontAwesomeIcons.linkedin, func: () async =>
        await launchUrl(Uri.parse(Links.linkdln),),assetPath: null,),
        SocialMediaIcon(icon: FontAwesomeIcons.github, func: () async =>
        await launchUrl(Uri.parse(Links.github),),assetPath: null,),
        SocialMediaIcon(icon: null, func: () async =>
        await launchUrl(Uri.parse(Links.leetcode),),assetPath: "asset/svgs/leetcode.svg",imageType: ImageType.svg,)
      ],
    );
  }
}
