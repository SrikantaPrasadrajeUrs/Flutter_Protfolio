import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:srikanta_protfolio/models/certificate_model.dart';
import 'package:srikanta_protfolio/models/get_x_controller/controller.dart';
import 'package:srikanta_protfolio/screens/certification/certification_stack.dart';
import 'package:srikanta_protfolio/storage/constants/helper_methods.dart';

class CertificationGrid extends StatefulWidget {
  final int crossAxisCount;
  final double ratio;

  CertificationGrid(
      {super.key, required this.crossAxisCount, required this.ratio});

  @override
  State<CertificationGrid> createState() => _CertificationGridState();
}

class _CertificationGridState extends State<CertificationGrid> {
  final controller = Get.put(CertificationController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadJsonFromFiles(path: 'asset/certificateInfo.json'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData && snapshot.hasError) {
            return Text("Unable to Load Data, Reason: ${snapshot.error}");
          } else if (snapshot.hasData) {
            List<dynamic> certificateData = snapshot.data['certification'];
            return MasonryGridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: certificateData.length,
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
                      child: CertificationStack(
                        index: index,
                        certificateData: certificateData[index],
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
