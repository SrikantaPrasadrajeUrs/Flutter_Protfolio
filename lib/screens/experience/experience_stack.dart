import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:srikanta_protfolio/models/get_x_controller/controller.dart';

import '../../models/responsive.dart';
import '../../storage/constants.dart';
import '../../storage/constants/helper_methods.dart';
import '../../storage/my_text_styles.dart';

class ExperienceStack extends StatelessWidget {
  final Map<String,dynamic> experienceData;
  final int index;
  final controller=Get.put(ExperienceController());
  ExperienceStack({
    super.key,
    required this.index,
    required this.experienceData
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDescription(
            Text(experienceData['company_name'],
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 23,fontWeight: FontWeight.bold,letterSpacing: 1)),
            [
              TextButton.icon(
                onPressed: (){
                  launchMyUrl(experienceData['google_play_store']);
                },
                label: const Text("google play store ",style: TextStyle(color: Colors.blueAccent,fontSize: 20),),
                icon: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.link,size: 23,color: Colors.blueAccent),
                  ],
                ),),
              TextButton.icon(
                onPressed: (){
                  launchMyUrl(experienceData['app_store']);
                },
                label: const Text("app store ",style: TextStyle(color: Colors.blueAccent,fontSize: 20),),
                icon: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.link,size: 23,color: Colors.blueAccent),
                  ],
                ),),
            ],
            Text(experienceData['skills'],style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16,fontWeight: FontWeight.bold,letterSpacing: 1,color: Colors.grey.shade600)),
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
            Text(experienceData['role'],maxLines: 1,style: smGTS.copyWith(fontWeight: FontWeight.bold,fontSize: 22),),
            reusableSizedBox(context, .01, true, false),
            if(Responsive.isDesktop(context)) reusableSizedBox(context, .05, true, false),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Organization :",style:smGTS.copyWith(fontWeight: FontWeight.bold)),
                SizedBox(
                    width: 150,
                    child: Text(experienceData['company_name'],style:smGTS.copyWith(color: Colors.grey.shade300),overflow: TextOverflow.ellipsis,textAlign: TextAlign.right,)),
              ],),
            reusableSizedBox(context, .01, true, false),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Skills :",style:smGTS.copyWith(fontWeight: FontWeight.bold)),
                SizedBox(
                    width: 200,
                    child: Text(experienceData['skills'],style:smGTS.copyWith(color: Colors.grey.shade300),overflow: TextOverflow.ellipsis,textAlign: TextAlign.right,)),
              ],
            ),
            reusableSizedBox(context, .01, true, false),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("duration :",style:smGTS.copyWith(fontWeight: FontWeight.bold)),
                Text(experienceData['start']+'-'+experienceData['end'],style:smGTS.copyWith(color: Colors.grey.shade300)),
              ],
            ),
          ],
        ),
      ) ,
    );
  }
}
