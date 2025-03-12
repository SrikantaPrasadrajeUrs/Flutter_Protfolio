import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:srikanta_protfolio/screens/experience/experience_stack.dart';
import '../../models/get_x_controller/controller.dart';
import '../../storage/constants/helper_methods.dart';

class ExperienceGrid extends StatefulWidget {
  final int crossAxisCount;
  final double ratio;
  const ExperienceGrid(
      {super.key, required this.crossAxisCount, required this.ratio});

  @override
  State<ExperienceGrid> createState() => _ExperienceGridState();
}

class _ExperienceGridState extends State<ExperienceGrid> {
  final controller = Get.put(ExperienceController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadJsonFromFiles(path: 'asset/experience.json'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData && snapshot.hasError) {
            return Text("Unable to Load Data, Reason: ${snapshot.error}");
          } else if (snapshot.hasData) {
            List<dynamic> experienceData = snapshot.data['experience'];
            return SingleChildScrollView(
              child: Wrap(
                  children: List.generate(
                experienceData.length,
                (index) {
                  return Container(
                    width: (MediaQuery.of(context).size.width /
                            widget.crossAxisCount) -
                        50,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    child: ExperienceCard(
                        index: index,
                        companyName: experienceData[index]['company_name'],
                        role: experienceData[index]['role'],
                        start: experienceData[index]['start'],
                        end: experienceData[index]['end'],
                        projects: List<String>.from(experienceData[index]['projects']),
                        skills: experienceData[index]['skills'],
                        googlePlayStore: experienceData[index]['google_play_store'],
                        appStore: experienceData[index]['app_store'],
                        responsibilities: List<String>.from(experienceData[index]['responsibilities'])),
                  );
                },
              )),
            );
          } else {
            return const Text("Some Error Occurred");
          }
        });
  }
}
