import 'package:flutter/material.dart';
import 'package:srikanta_protfolio/models/get_x_controller/controller.dart';
import 'package:srikanta_protfolio/storage/constants/helper_methods.dart';
import '../../storage/my_text_styles.dart';

class ProjectStack extends StatelessWidget {
  final Map<String, dynamic> projectData;
  final int index;
  final ProjectsController controller;
  const ProjectStack(
      {super.key,
      required this.index,
      required this.controller,
      required this.projectData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        showDescription(
            Text(projectData['name'],
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1)),
            [
              TextButton.icon(
                onPressed: () {
                  launchMyUrl(projectData['github_link']);
                },
                label: const Text(
                  "visit ",
                  style: TextStyle(color: Colors.blueAccent, fontSize: 20),
                ),
                icon: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.link, size: 23, color: Colors.blueAccent),
                  ],
                ),
              )
            ],
            Text(projectData['description'],
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    color: Colors.grey.shade600)),
            context);
      },
      onHover: (isHover) {
        controller.onHover(index, isHover);
      },
      borderRadius: BorderRadius.circular(30),
      child: AnimatedContainer(
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Theme.of(context).colorScheme.surface,
        ),
        padding: const EdgeInsets.all(20),
        duration: const Duration(milliseconds: 300),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              projectData['name'],
              maxLines: 1,
              style: smGTS.copyWith(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Description :",
                    style: smGTS.copyWith(fontWeight: FontWeight.bold)),
                SizedBox(
                    width: 200,
                    child: Text(
                      projectData['description'],
                      style: smGTS.copyWith(color: Colors.grey.shade300),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Technologies :",
                    style: smGTS.copyWith(fontWeight: FontWeight.bold)),
                SizedBox(
                    width: 100,
                    child: Text(
                      projectData['technology'],
                      style: smGTS.copyWith(color: Colors.grey.shade300),
                      overflow: TextOverflow.ellipsis,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Link :",
                    style: smGTS.copyWith(fontWeight: FontWeight.bold)),
                SizedBox(
                    width: 100,
                    child: Text(
                      projectData['github_link'],
                      style: smGTS.copyWith(color: Colors.grey.shade300),
                      overflow: TextOverflow.ellipsis,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
