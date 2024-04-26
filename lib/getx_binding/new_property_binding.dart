import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:real_estate/modules/add_property/new_property_controller.dart';

class NewPropertyBinding implements Bindings{

  @override
  void dependencies() {
    Get.put<NewPropertyController>(NewPropertyController());
  }




}