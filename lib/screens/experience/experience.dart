import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:srikanta_protfolio/screens/experience/experience_grid.dart';

import '../../models/responsive.dart';

class Experience extends StatelessWidget {
  const Experience({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("EXPERIENCE",style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 30,fontWeight: FontWeight.bold,letterSpacing: 1),),
          const Gap(10),
          const Expanded(
            child: Responsive(
              desktop: ExperienceGrid(
                crossAxisCount: 4,
                ratio: 4,
              ),
              mobile: ExperienceGrid(
                crossAxisCount: 1,
                ratio: 1.7,
              ),
              largeMobile: ExperienceGrid(
                crossAxisCount: 2,
                ratio: 2,
              ),
              tablet: ExperienceGrid(
                crossAxisCount: 2,
                ratio: 1.4,
              ),
            ),
          )
        ],
      ),
    );
  }
}
