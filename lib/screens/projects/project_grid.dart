import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:srikanta_protfolio/models/get_x_controller/controller.dart';
import 'package:srikanta_protfolio/screens/projects/project_stack.dart';
import 'package:srikanta_protfolio/storage/constants/helper_methods.dart';

class ProjectGrid extends StatefulWidget {
  final double ratio;
  final int crossAxisCount;
  final controller = Get.put(ProjectsController());

  ProjectGrid({super.key, required this.ratio, required this.crossAxisCount});

  @override
  State<ProjectGrid> createState() => _ProjectGridState();
}

class _ProjectGridState extends State<ProjectGrid> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadJsonFromFiles(path: "asset/projects.json"),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapShot.hasData && snapShot.hasError) {
            return Text("Unable to Load Data, Reason: ${snapShot.error}");
          } else if (snapShot.hasData) {
            List<dynamic> projects = snapShot.data['projects'];
            return SingleChildScrollView(
              child: Wrap(
                children: List.generate(projects.length, (index) {
                return Container(
                  width: (MediaQuery.of(context).size.width / widget.crossAxisCount)-50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30)),
                  child: ProjectCard(
                    index: index,
                    description: projects[index]['description'],
                    name: projects[index]['name'],
                    technology: projects[index]['technology'],
                    frontendLink: projects[index]['frontend_link'],
                    backendLink: projects[index]['backend_link'],
                    imageLink: projects[index]['image_link'],
                    videoLink: projects[index]['video_link'],
                  ),
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
