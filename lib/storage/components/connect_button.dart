import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:srikanta_protfolio/storage/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ConnectButton extends StatelessWidget {
  final String text;
  final IconData myIcon;
  final Color? color;
  final String url;
  const ConnectButton({super.key, required this.text, required this.myIcon, required this.color,required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async{
        // fetchCertificatesData();
        try {
          if(await canLaunchUrl(Uri.parse(url))) {
            await launchUrl(Uri.parse(url));
          }
        }catch(e){
          log("Error opening link: ",error: e);
        }
      },
      child: Container(
        height: 60,
        width: 160,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurStyle: BlurStyle.solid,
                color: Colors.blue.withOpacity(.7),
                blurRadius: 15,
                spreadRadius: 1),
            BoxShadow(
                color: Colors.pink.withOpacity(.4),
                blurRadius: 15,
                spreadRadius: 1),
          ],
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Colors.blue, Colors.pink]),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(.8),
              borderRadius: BorderRadius.circular(30)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              reusableSizedBox(context, .007, false, true),
               Icon(
                  myIcon,
                color: color??Theme.of(context).iconTheme.color,
                 size:22,
              ),
              reusableSizedBox(context, .007, false, true),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              reusableSizedBox(context, .007, false, true),
            ],
          ),
        ),
      ),
    );
  }
}
