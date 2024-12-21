import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:srikanta_protfolio/screens/experience/experience_stack.dart';

import '../../models/get_x_controller/controller.dart';
import '../../storage/constants/helper_methods.dart';

class ExperienceGrid extends StatefulWidget {
  final int crossAxisCount;
  final double ratio;
  const ExperienceGrid({
    super.key,
    required this.crossAxisCount,
    required this.ratio
  });

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
            return MasonryGridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: experienceData.length,
                gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: widget.crossAxisCount),
                itemBuilder: (context, index) {
                  return Obx(
                        () => AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.blue.withOpacity(.8),
                                offset: const Offset(-3, 0),
                                blurRadius: controller.hovering[index] ? 10 : 5,
                                spreadRadius: 2),
                            BoxShadow(
                                color: Colors.pink.withOpacity(.4),
                                offset: const Offset(3, 0),
                                blurRadius: controller.hovering[index] ? 10 : 5,
                                spreadRadius: 2),
                          ]),
                      child: ExperienceStack(
                        index: index,
                        experienceData: experienceData[index],
                      ),
                    ),
                  );
                });
          } else {
            return const Text("Some Error Occurred");
          }
        });
  }
}
