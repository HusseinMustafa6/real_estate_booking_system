

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../modules/home_page/public_records/public_records_controller.dart';
import '../modules/home_page/public_transactions/public_transactions_controller.dart';

class PublicRecordsBinding implements Bindings{


  @override
  void dependencies() {
    Get.put<PublicRecordsController>(PublicRecordsController());
  }



}

