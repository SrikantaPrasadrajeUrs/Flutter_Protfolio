import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:srikanta_protfolio/screens/projects/project_grid.dart';

import '../../models/responsive.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const Gap(10),
        Text("PROJECTS",style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 30,fontWeight: FontWeight.bold,letterSpacing: 1),),
        Expanded(
          child: Responsive(
            desktop: ProjectGrid(
              crossAxisCount: 4,
              ratio: 4,
            ),
            mobile: ProjectGrid(
              crossAxisCount: 1,
              ratio: 1.7,
            ),
            largeMobile: ProjectGrid(
              crossAxisCount: 2,
              ratio: 2,
            ),
            tablet: ProjectGrid(
              crossAxisCount: 4,
              ratio: 1.4,
            ),
          ),
        )
      ],
    );
  }
}
