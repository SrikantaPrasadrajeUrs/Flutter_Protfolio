import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:srikanta_protfolio/screens/main/drawer/skills.dart';
import 'package:srikanta_protfolio/storage/components/social_media_icon.dart';
import 'package:srikanta_protfolio/storage/constants/my_enums.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaColumn extends StatelessWidget {
  const SocialMediaColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialMediaIcon(icon: FontAwesomeIcons.linkedin, func: ()=>
            launchUrl(Uri.parse(Links.linkdln),),assetPath: null,),
        SocialMediaIcon(icon: FontAwesomeIcons.github, func: ()=>
            launchUrl(Uri.parse(Links.github),),assetPath: null,),
        SocialMediaIcon(icon: null, func: ()=>
            launchUrl(Uri.parse(Links.leetcode),),assetPath: "asset/svgs/leetcode.svg",imageType: ImageType.svg,)
      ],
    );
  }
}
