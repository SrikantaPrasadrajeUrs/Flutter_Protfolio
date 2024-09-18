
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:srikanta_protfolio/screens/main/drawer/about.dart';
import 'package:srikanta_protfolio/screens/main/drawer/knowledge.dart';
import 'package:srikanta_protfolio/screens/main/drawer/personal_info.dart';
import 'package:srikanta_protfolio/screens/main/drawer/skills.dart';

import '../../../storage/components/custom_divider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Gap(20),
              About(),
              Gap(15),
              CustomDivider(height: 2, colors: [Colors.grey, Colors.white], horizontalMargin: 0, verticalMargin: 5, begin: Alignment.centerLeft, end: Alignment.centerRight),
              Gap(5),
              PersonalInfo(),
              CustomDivider(height: 2, colors: [Colors.grey, Colors.white], horizontalMargin: 0, verticalMargin: 5, begin: Alignment.centerLeft, end: Alignment.centerRight),
              Gap(5),
              MySkills(),
              CustomDivider(height: 2, colors: [Colors.grey, Colors.white], horizontalMargin: 0, verticalMargin: 5, begin: Alignment.centerLeft, end: Alignment.centerRight),
              Gap(5),
              Knowledge(),
            ],
          ),
        ),
      ),
    );
  }
}
