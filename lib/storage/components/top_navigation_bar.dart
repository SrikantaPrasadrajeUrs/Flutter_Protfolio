import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:srikanta_protfolio/storage/constants.dart';
import '../../models/responsive.dart';
import 'connect_button.dart';
import 'menu_button.dart';
import 'navigation_buttons.dart';

class TopNavigationBar extends StatelessWidget {
  const TopNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
                height: size.height * .15,
                width: size.width * .12,
                child: Responsive.isMobile(context)
                    ? const MenuButton()
                    : Image.asset('asset/images/triange_icon.png')),
            if (!Responsive.isMobile(context))
              const Expanded(flex: 7, child: NavigationButtons()),
            const Spacer(),
            !Responsive.isMobile(context)
                ? const Expanded(flex: 2, child: ConnectButton(myIcon: FontAwesomeIcons.whatsapp,text: "Whatsapp",),) //tablet
                : const ConnectButton(myIcon: FontAwesomeIcons.whatsapp,text: "Whatsapp"),
            reusableSizedBox(context, .01, false, true)
          ],
        ),
        if (Responsive.isMobile(context)) const NavigationButtons()
      ],
    );
  }
}
