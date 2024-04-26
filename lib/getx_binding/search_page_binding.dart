

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:real_estate/modules/search_page/search_page_controller.dart';

import '../modules/realestate_binding_requests/properties_binding_controller.dart';

class SearchPageBinding implements Bindings{


  @override
  void dependencies() {
    Get.put<SearchPageController>(SearchPageController());
  }




}