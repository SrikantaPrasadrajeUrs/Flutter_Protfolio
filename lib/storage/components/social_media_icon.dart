import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:srikanta_protfolio/screens/main/drawer/skills.dart';

class SocialMediaIcon extends StatelessWidget {
  final IconData? icon;
  final VoidCallback? func;
  final String? assetPath;
  final ImageType? imageType;

  const SocialMediaIcon({
    super.key,
    this.icon,
    this.func,
    this.assetPath,
    this.imageType,
  });

  @override
  Widget build(BuildContext context) {
    Widget iconWidget;
print(assetPath!=null);
    if (assetPath != null) {
      if (imageType == ImageType.jpg || imageType == ImageType.png) {
        iconWidget = Image.asset(assetPath!);
      } else if (imageType == ImageType.svg) {
        iconWidget = SvgPicture.asset(
          assetPath!,
          width: 15,
          height: 15,
        );
      } else {
        iconWidget = Icon(
          icon ?? Icons.error,
          size: Theme.of(context).iconTheme.size,
        );
      }
    } else {
      iconWidget = Icon(
        icon ?? Icons.error,
        size: Theme.of(context).iconTheme.size,
      );
    }

    return IconButton(
      icon: iconWidget,
      onPressed: func,
    );
  }
}
