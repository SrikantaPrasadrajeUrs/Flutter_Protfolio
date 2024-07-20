import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:srikanta_protfolio/models/certificate_model.dart';
import 'package:srikanta_protfolio/storage/constants.dart';
import '../../models/get_x_controller/certification_controller.dart';
import '../../models/responsive.dart';
import '../../storage/my_text_styles.dart';

class CertificationStack extends StatelessWidget {
  final int index;
  final controller=Get.put(CertificationController());
   CertificationStack({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (isHovering) {
        controller.onHover(index, isHovering);
      },
      borderRadius: BorderRadius.circular(30),
      child:AnimatedContainer(
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

            Text(certificateModelList[index].name,maxLines: 1,style: smGTS.copyWith(fontWeight: FontWeight.bold,fontSize: 22),),
            reusableSizedBox(context, .01, true, false),
            if(Responsive.isDesktop(context)) reusableSizedBox(context, .05, true, false),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("Organization :",style:smGTS.copyWith(fontWeight: FontWeight.bold)),
              Text(certificateModelList[index].organization,style:smGTS.copyWith(color: Colors.grey.shade300)),
            ],),
            reusableSizedBox(context, .01, true, false),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("Skills :",style:smGTS.copyWith(fontWeight: FontWeight.bold)),
              Text(certificateModelList[index].skills,style:smGTS.copyWith(color: Colors.grey.shade300)),
            ],
            ),
            reusableSizedBox(context, .01, true, false),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("Date of issue :",style:smGTS.copyWith(fontWeight: FontWeight.bold)),
              Text(certificateModelList[index].date,style:smGTS.copyWith(color: Colors.grey.shade300)),
              ],
            ),
          ],
        ),
      ) ,
    );
  }
}
