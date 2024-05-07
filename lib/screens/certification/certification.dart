import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:srikanta_protfolio/storage/constants.dart';

import '../../models/responsive.dart';
import '../../storage/my_text_styles.dart';
import 'certification_grid.dart';

class Certifications extends StatelessWidget {
  const Certifications({super.key});

  @override
  Widget build(BuildContext context) {
    final duration=Duration(milliseconds:200);
    return  Scaffold(
      body: Column(
        children: [
         Text("CERTIFICATIONS",style: mWTS.copyWith(fontSize: 30,fontWeight: FontWeight.bold,letterSpacing: 1),),
          reusableSizedBox(context, .01, true, false),
          Expanded(
            child: Responsive(
              Desktop: CertificationGrid(
                crossAxisCount: 4,
                ratio: 4,
              ),
              Mobile: CertificationGrid(
                crossAxisCount: 1,
                ratio: 1.7,
              ),
              LargeMobile: CertificationGrid(
                crossAxisCount: 2,
                ratio: 2,
              ),
              Tablet: CertificationGrid(
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
