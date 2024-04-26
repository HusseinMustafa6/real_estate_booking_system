

import 'package:get/get.dart';
import 'package:real_estate/modules/empty_wallet/empty_wallet_service.dart';

class EmptyWalletController extends GetxController{

  var balance;
  var address;
  var phoneNumber;
  var fullName;


  EmptyWalletService emptyWalletService = EmptyWalletService();


  Future<dynamic> getMoney()async{

    var msg = await emptyWalletService.getMoney(this.balance, this.address, this.phoneNumber, this.fullName);

    return msg;
  }




}