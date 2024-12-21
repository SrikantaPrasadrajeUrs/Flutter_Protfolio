import 'package:get/get.dart';

class CertificationController extends GetxController{
  RxList<bool> hovering=[
    false,
    false,
    false,
    false,
    false,
    false,
  ].obs;
  onHover(int index,bool value){
    hovering[index]=value;
  }
}

class ProjectsController extends GetxController{
  RxList<bool> hovering=[
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ].obs;
  onHover(int index,bool value){
    hovering[index]=value;
  }
}

class ExperienceController extends GetxController{
  RxList<bool> hovering=[
    false,
    false,
  ].obs;
  onHover(int index,bool value){
    hovering[index]=value;
  }
}