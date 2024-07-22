import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../models/responsive.dart';
import 'certification_grid.dart';

class Certifications extends StatelessWidget {
  const Certifications({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
         Text("CERTIFICATIONS",style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 30,fontWeight: FontWeight.bold,letterSpacing: 1),),
          const Gap(10),
          Expanded(
            child: Responsive(
              desktop: CertificationGrid(
                crossAxisCount: 4,
                ratio: 4,
              ),
              mobile: CertificationGrid(
                crossAxisCount: 1,
                ratio: 1.7,
              ),
              largeMobile: CertificationGrid(
                crossAxisCount: 2,
                ratio: 2,
              ),
              tablet: CertificationGrid(
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
