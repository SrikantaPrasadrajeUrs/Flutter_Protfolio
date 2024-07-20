import 'package:flutter/material.dart';

class SocialMediaIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback? func;
  const SocialMediaIcon({super.key,required this.icon,required this.func});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon:Icon(icon),
      onPressed: func,
    );
  }
}
