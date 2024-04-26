
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';


import '../modules/private_transactions/private_transactions_controller.dart';

class PrivateTransactionsBinding implements Bindings{


  @override
  void dependencies() {
    Get.put<PrivateTransactionsController>(PrivateTransactionsController());
  }



}