import 'package:flutter/material.dart';
import 'package:srikanta_protfolio/models/responsive.dart';
import 'package:srikanta_protfolio/storage/components/navigation_text_button.dart';
import 'package:srikanta_protfolio/storage/constants.dart';

class NavigationButtons extends StatelessWidget {
  const NavigationButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration: const Duration(milliseconds: 300),
        builder: (context, value, child) {
          return Transform.scale(
            scale: value,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NavigationTextButton(onTap: () {
                  MovePage.pageController.animateToPage(0, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                }, text: 'Home'),
                if(Responsive.isLargeMobile(context))NavigationTextButton(onTap: () {}, text: 'About Me'),
                NavigationTextButton(onTap: () {
                  MovePage.pageController.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                }, text: 'Projects'),
                NavigationTextButton(onTap: () {
                  MovePage.pageController.animateToPage(2, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                }, text: 'Certifications'),
                NavigationTextButton(onTap: () {
                  MovePage.pageController.animateToPage(3, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                }, text: 'Experience'),
              ],
            ),
          );
        });
  }
}
