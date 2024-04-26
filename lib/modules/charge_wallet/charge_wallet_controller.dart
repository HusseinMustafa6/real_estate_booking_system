

import 'package:get/get.dart';
import 'dart:io';

import 'package:real_estate/modules/charge_wallet/charge_wallet_service.dart';

class ChargeWalletController extends GetxController{

   var moneyAmount;
   File? moneyReceipt;


   ChargeWalletService chargeWalletService = ChargeWalletService();


   Future<bool> sendMoney()async{
      bool temp = await chargeWalletService.sendMoney(this.moneyAmount,this.moneyReceipt);

      return temp;
   }



}