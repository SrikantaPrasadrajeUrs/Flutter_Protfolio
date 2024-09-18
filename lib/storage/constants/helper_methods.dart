import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

Future<dynamic> loadJsonFromFiles({required String path})async{
   try{
     String str = await rootBundle.loadString(path);
     return jsonDecode(str);
   }catch(e,st){
     log("while loading from path: $path",error: e,stackTrace: st);
   }
}

void launchMyUrl(String url)async{
  try{
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      log("unable to launch url");
    }
  }catch(e,st){
    log("unable to load url: $url",error: e,stackTrace: st);
  }
}

Future<dynamic> showDescription(Widget title,List<Widget> actions,Widget content,BuildContext context)async{
  return showDialog(context: context, builder: (context){
    return AlertDialog(
      title: title,
      actions: actions,
      content: content,
    );
  });
}