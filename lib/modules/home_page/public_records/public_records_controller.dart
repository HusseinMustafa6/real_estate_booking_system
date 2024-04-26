


  import 'package:get/get.dart';
import 'package:real_estate/modules/home_page/public_records/public_records.dart';
import 'package:real_estate/modules/home_page/public_records/public_records_service.dart';

import '../../../models/public_transation.dart';

class PublicRecordsController extends GetxController{

  List<PublicTransaction> publicList = <PublicTransaction>[].obs;

  List<dynamic> responseList = <dynamic>[];

  PublicRecordsService service = PublicRecordsService();

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


  void clearList(){
    publicList.clear();
  }

}


