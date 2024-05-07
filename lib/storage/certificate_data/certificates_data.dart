import 'dart:convert';
import 'package:flutter/services.dart';

Future<List<dynamic>> fetchCertificatesData() async{
  final String response= await rootBundle.loadString("asset/certificateInfo.json",cache: false);
  final Map<String,dynamic> data = await json.decode(response);
// print(data["certification"].runtimeType);
return data["certification"];
}
