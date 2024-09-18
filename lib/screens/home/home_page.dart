import 'package:flutter/material.dart';
import 'package:srikanta_protfolio/screens/certification/certification.dart';
import 'package:srikanta_protfolio/screens/experience/experience.dart';
import 'package:srikanta_protfolio/screens/introduction/introduction.dart';
import 'package:srikanta_protfolio/screens/projects/project.dart';
import '../main/page_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainView(pages:[Introduction(),Projects(),Certifications(),Experience()]);
  }
}
