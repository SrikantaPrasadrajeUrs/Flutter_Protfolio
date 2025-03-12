import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:srikanta_protfolio/models/get_x_controller/controller.dart';
import 'package:srikanta_protfolio/screens/certification/certification_stack.dart';
import 'package:srikanta_protfolio/storage/constants/helper_methods.dart';

class CertificationGrid extends StatefulWidget {
  final int crossAxisCount;
  final double ratio;

  const CertificationGrid(
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
            return SingleChildScrollView(
              child: Wrap(
                  children: List.generate(
                certificateData.length,
                (index) {
                  return Container(
                    width: (MediaQuery.of(context).size.width /
                            widget.crossAxisCount) -
                        50,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    child: CertificationCard(
                        index: index,
                        name: certificateData[index]['name'],
                        organization: certificateData[index]['organization'],
                        date: certificateData[index]['date'],
                        skills: certificateData[index]['skills'],
                        credential: certificateData[index]['credential']),
                  );
                },
              )),
            );
          } else {
            return const Text("Some Error Occurred");
          }
        });
  }
}
