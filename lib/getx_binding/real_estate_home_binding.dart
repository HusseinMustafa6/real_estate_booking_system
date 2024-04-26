

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../modules/home_page/real_estate_home/real_estate_home_controller.dart';

class RealEstateHomeBinding implements Bindings{


  @override
  void dependencies() {
    Get.put<RealEstateHomeController>(RealEstateHomeController());
  }




}