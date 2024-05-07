import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:srikanta_protfolio/models/certificate_model.dart';
import 'package:srikanta_protfolio/models/get_x_controller/certification_controller.dart';
import 'package:srikanta_protfolio/screens/certification/certification_stack.dart';

class CertificationGrid extends StatelessWidget {
  final int crossAxisCount;
  final double ratio;
  final controller = Get.put(CertificationController());
  CertificationGrid(
      {super.key, required this.crossAxisCount, required this.ratio});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: certificateModelList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: ratio,
            crossAxisCount: crossAxisCount),
        itemBuilder: (context, index) {
          return Obx(
            () => AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
                  ]
              ),
              child: CertificationStack(
                index: index,
              ),
            ),
          );
        });
  }
}
