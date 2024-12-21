import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:srikanta_protfolio/storage/constants.dart';
import 'package:srikanta_protfolio/storage/constants/helper_methods.dart';
import '../../models/get_x_controller/controller.dart';
import '../../models/responsive.dart';
import '../../storage/my_text_styles.dart';

class CertificationStack extends StatelessWidget {
  final Map<String,dynamic> certificateData;
  final int index;
  final controller=Get.put(CertificationController());
   CertificationStack({super.key, required this.index,required this.certificateData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDescription(
            Text(certificateData['name'],
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 23,fontWeight: FontWeight.bold,letterSpacing: 1)),
            [
              TextButton.icon(
                onPressed: (){
                  launchMyUrl(certificateData['credential']);
                },
                label: const Text("visit ",style: TextStyle(color: Colors.blueAccent,fontSize: 20),),
                icon: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.link,size: 23,color: Colors.blueAccent),
                  ],
                ),)
            ],
            Text(certificateData['skills'],style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16,fontWeight: FontWeight.bold,letterSpacing: 1,color: Colors.grey.shade600)),
            context
        );
      },
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
            Text(certificateData['name'],maxLines: 1,style: smGTS.copyWith(fontWeight: FontWeight.bold,fontSize: 22),),
            reusableSizedBox(context, .01, true, false),
            if(Responsive.isDesktop(context)) reusableSizedBox(context, .05, true, false),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("Organization :",style:smGTS.copyWith(fontWeight: FontWeight.bold)),
              SizedBox(
                  width: 150,
                  child: Text(certificateData['organization'],style:smGTS.copyWith(color: Colors.grey.shade300),overflow: TextOverflow.ellipsis,textAlign: TextAlign.right,)),
            ],),
            reusableSizedBox(context, .01, true, false),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("Skills :",style:smGTS.copyWith(fontWeight: FontWeight.bold)),
              SizedBox(
                  width: 200,
                  child: Text(certificateData['skills'],style:smGTS.copyWith(color: Colors.grey.shade300),overflow: TextOverflow.ellipsis,textAlign: TextAlign.right,)),
            ],
            ),
            reusableSizedBox(context, .01, true, false),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("Date of issue :",style:smGTS.copyWith(fontWeight: FontWeight.bold)),
              Text(certificateData['date'],style:smGTS.copyWith(color: Colors.grey.shade300)),
              ],
            ),
          ],
        ),
      ) ,
    );
  }
}
