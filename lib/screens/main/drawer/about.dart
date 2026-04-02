import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:srikanta_protfolio/screens/main/drawer/my_image.dart';
import 'package:srikanta_protfolio/storage/constants/my_enums.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const MyImage(),
        const Gap(10),
        Text(name,style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 19,letterSpacing: .6),),
        const Gap(5),
        Text("A Passionate",style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).colorScheme.tertiary,fontWeight: FontWeight.w300,fontSize: 14,letterSpacing: .6)),
        //Mobile App Developer
        Text("Software Developer",style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).colorScheme.tertiary,fontWeight: FontWeight.w300,fontSize: 14,letterSpacing: .6)),
        const Gap(5),
        _buildCurrentRole(context)
      ],
    );
  }

  Widget _buildCurrentRole(BuildContext context){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black54,
        boxShadow: const [
          BoxShadow(
            color: Colors.white38,
            blurRadius: 4,
            spreadRadius: 2,
          )
        ]
      ),
      child: Text("Current role: Software Development Engineer 1", style: Theme.of(context).textTheme.labelSmall?.copyWith(
        color: Theme.of(context).colorScheme.tertiary,
        fontWeight: FontWeight.w300,
        fontSize: 10,
        letterSpacing: .6,
      ),),
    );
  }
}
