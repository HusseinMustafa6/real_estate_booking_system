

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../modules/home_page/public_transactions/public_transactions_controller.dart';

class PublicTransactionsBinding implements Bindings{


  @override
  void dependencies() {
    Get.put<PublicTransactionsControllerr>(PublicTransactionsControllerr());
  }



}