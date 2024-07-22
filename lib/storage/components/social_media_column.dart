import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:srikanta_protfolio/storage/components/social_media_icon.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaColumn extends StatelessWidget {
  const SocialMediaColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialMediaIcon(icon: FontAwesomeIcons.linkedin, func: ()=>
            launchUrl(Uri.parse('https://www.linkedin.com/in/srikantaprasadraje-urs-83bb11286/'),)),
        SocialMediaIcon(icon: FontAwesomeIcons.github, func: ()=>
            launchUrl(Uri.parse('https://www.linkedin.com/in/srikantaprasadraje-urs-83bb11286/'),))
      ],
    );
  }
}
