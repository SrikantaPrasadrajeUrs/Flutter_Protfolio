
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
          // kIsWeb&&Responsive.isLargeMobile(context)?
          ],
        ),
      ),
    );
  }
}
