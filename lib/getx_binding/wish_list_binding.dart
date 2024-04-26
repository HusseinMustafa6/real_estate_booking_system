

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:real_estate/modules/home_page/faveorite_page/wish_list_controller.dart';

class WishListBinding implements Bindings{


  @override
  void dependencies() {
    Get.put<WishListController>(WishListController());
  }




}