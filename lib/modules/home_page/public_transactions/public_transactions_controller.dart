
import 'dart:ui';

import 'package:get/get.dart';
import 'package:real_estate/models/public_transation.dart';
import 'package:real_estate/modules/home_page/public_transactions/public_transations_service.dart';

class PublicTransactionsControllerr extends GetxController{


  List<PublicTransaction> publicList = <PublicTransaction>[].obs;

  List<dynamic> responseList = <dynamic>[];



  PublicTransactionsService service = PublicTransactionsService();

   onInit(){

     getPublicTransactions();
   }



  Future<void> getPublicTransactions() async{

    responseList = await service.getPublicTransactions();

    if(responseList.isNotEmpty){

      for(int i = 0 ; i < responseList.length ; i++){

        PublicTransaction tx = PublicTransaction(
          buyerName: responseList[i]['bayerName'],
          sellerName: responseList[i]['sellerName'],
          address: responseList[i]['address'],
          priceWithProfit: responseList[i]['newPrice'],
          price: responseList[i]['price'],
          constructionType: responseList[i]['constructionType'],
          size: responseList[i]['size'],
        );

         publicList.add(tx);


      }


    }



  }


}