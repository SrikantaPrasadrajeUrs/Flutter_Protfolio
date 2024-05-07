// class AutoGenerate {
//   AutoGenerate({
//     required this.certification,
//   });
//   late final List<Certification> certification;
//
//   AutoGenerate.fromJson(Map<String, dynamic> json){
//     certification = List.from(json['certification']).map((e)=>Certification.fromJson(e)).toList();
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['certification'] = certification.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }

class CertificationModel {
  CertificationModel({
    required this.name,
    required this.organization,
    required this.date,
    required this.skills,
    required this.credential,
  });
   final String name;
   final String organization;
   final String date;
   final String skills;
   final String credential;

  // Certification.fromJson(Map<String, dynamic> json){
  //   name = json['name'];
  //   organization = json['organization'];
  //   date = json['date'];
  //   skills = json['skills'];
  //   credential = json['credential'];
  // }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['organization'] = organization;
    _data['date'] = date;
    _data['skills'] = skills;
    _data['credential'] = credential;
    return _data;
  }
}
List<CertificationModel> certificateModelList=[
  CertificationModel(
    name: 'Getting started with Flutter Development',
    organization: 'Coursera',
    date: 'AUG 2023',
    skills: 'Flutter . Dart',
    credential:  'https://www.coursera.org/account/accomplishments/certificate/HQ4LFHSF4LKZ',
  ),
  CertificationModel(
    name: 'Getting started with Flutter Development',
    organization: 'Coursera',
    date: 'AUG 2023',
    skills: 'Flutter . Dart',
    credential:  'https://www.coursera.org/account/accomplishments/certificate/HQ4LFHSF4LKZ',
  ),
  CertificationModel(
    name: 'Getting started with Flutter Development',
    organization: 'Coursera',
    date: 'AUG 2023',
    skills: 'Flutter . Dart',
    credential:  'https://www.coursera.org/account/accomplishments/certificate/HQ4LFHSF4LKZ',
  ),
  CertificationModel(
    name: 'Getting started with Flutter Development',
    organization: 'Coursera',
    date: 'AUG 2023',
    skills: 'Flutter . Dart',
    credential:  'https://www.coursera.org/account/accomplishments/certificate/HQ4LFHSF4LKZ',
  ),
  CertificationModel(
    name: 'Getting started with Flutter Development',
    organization: 'Coursera',
    date: 'AUG 2023',
    skills: 'Flutter . Dart',
    credential:  'https://www.coursera.org/account/accomplishments/certificate/HQ4LFHSF4LKZ',
  ),
  CertificationModel(
    name: 'Getting started with Flutter Development',
    organization: 'Coursera',
    date: 'AUG 2023',
    skills: 'Flutter . Dart',
    credential:  'https://www.coursera.org/account/accomplishments/certificate/HQ4LFHSF4LKZ',
  ),
];
