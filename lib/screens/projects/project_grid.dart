import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:srikanta_protfolio/models/get_x_controller/controller.dart';
import 'package:srikanta_protfolio/screens/projects/project_stack.dart';
import 'package:srikanta_protfolio/storage/constants/helper_methods.dart';

class ProjectGrid extends StatefulWidget {
  final double ratio;
  final int crossAxisCount;
  final controller = Get.put(ProjectsController());
  ProjectGrid({super.key,required this.ratio,required this.crossAxisCount});
  @override
  State<ProjectGrid> createState() => _ProjectGridState();
}

class _ProjectGridState extends State<ProjectGrid> {


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadJsonFromFiles(path:"asset/projects.json"),
        builder: (context,snapShot){
      if(snapShot.connectionState ==ConnectionState.waiting){
        return const Center(child: CircularProgressIndicator());
      }else if(!snapShot.hasData&&snapShot.hasError){
        return Text("Unable to Load Data, Reason: ${snapShot.error}");
      }
      else if(snapShot.hasData){
        List<dynamic> projects = snapShot.data['projects'];
        return MasonryGridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: projects.length,
            gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: widget.crossAxisCount),
            itemBuilder: (context,index) {
              return Obx(
                      () => AnimatedContainer(
                        margin: const EdgeInsets.all(15),
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.blue.withOpacity(.6),
                              offset: const Offset(-3, 0),
                              blurRadius: widget.controller.hovering[index] ? 10 : 5,
                              spreadRadius: 2),
                          BoxShadow(
                              color: Colors.pink.withOpacity(.4),
                              offset: const Offset(3, 0),
                              blurRadius: widget.controller.hovering[index] ? 10 : 5,
                              spreadRadius: 2),
                        ]
                    ),
                    child: ProjectStack(index: index, controller: widget.controller,projectData: projects[index],),
                  )
              );
            }
        );
      }
      else{
        return const Text("Some Error Occurred");
      }
    });
  }
}
