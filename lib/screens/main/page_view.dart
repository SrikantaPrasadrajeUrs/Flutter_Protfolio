import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:srikanta_protfolio/storage/components/top_navigation_bar.dart';
import 'drawer/custom_drawer.dart';
import '../../storage/constants.dart';

class MainView extends StatelessWidget {
  final List<Widget> pages;
  const MainView({super.key, required this.pages});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: Center(
        child: Column(
          children: [
            const Gap(10),
            const TopNavigationBar(),
            Expanded(
              child: PageView(
                controller:  MovePage.pageController,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: [...pages],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
