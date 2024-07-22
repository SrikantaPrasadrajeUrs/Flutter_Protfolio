import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:srikanta_protfolio/storage/components/social_media_column.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0,end: 1),
      builder: (context,val,_){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Transform.scale(
              scale: val,
              child: RotatedBox(
                quarterTurns: 1,
                child: Text("Follow me",style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).colorScheme.secondary),),
              ),
            ),
            Container(
              width: 3,
              height: MediaQuery.of(context).size.height*0.07,
              color: Colors.white,
              margin:const EdgeInsets.symmetric(vertical: 10),
            ),
            const SocialMediaColumn()
          ],
        );
      }, duration: const Duration(),
    );
  }
}
