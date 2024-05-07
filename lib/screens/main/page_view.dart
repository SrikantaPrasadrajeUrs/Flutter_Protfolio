import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:srikanta_protfolio/storage/components/top_navigation_bar.dart';
import 'drawer/custom_drawer.dart';
import '../../storage/constants.dart';

class MainView extends StatelessWidget {
  final List<Widget> pages;
  const MainView({super.key, required this.pages});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const CustomDrawer(),
      body: Center(
        child: Column(
          children: [
            reusableSizedBox(context, .03, true, false),
            const TopNavigationBar(),
            Expanded(
              flex: 1,
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
