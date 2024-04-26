
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get.dart';

import '../modules/home_page/profile_page/profile_controller.dart';

class ProfileBinding implements Bindings{


  @override
  void dependencies() {
    Get.put<ProfileController>(ProfileController());
  }




}