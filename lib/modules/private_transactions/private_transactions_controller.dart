

import 'package:get/get.dart';
import 'package:real_estate/models/private_transaction.dart';
import 'package:real_estate/modules/private_transactions/private_transactions_service.dart';

class PrivateTransactionsController extends GetxController{


  List<PrivateTransaction> privateList = <PrivateTransaction>[].obs;

  List<dynamic> responseList = <dynamic>[];



  PrivateTransactionsService service = PrivateTransactionsService();

  onInit(){
    getPrivateTransactions();
  }



  Future<void> getPrivateTransactions() async{

    responseList = await service.getPrivateTransactions();

    if(responseList.isNotEmpty){

      for(int i = 0 ; i < responseList.length ; i++){

        PrivateTransaction tx = PrivateTransaction(
          buyerName: responseList[i]['Solidity']['bayerName'],
          sellerName: responseList[i]['Solidity']['sellerName'],
          address: responseList[i]['Solidity']['address'],
          priceWithProfit: responseList[i]['Solidity']['newPrice'],
          price: responseList[i]['Solidity']['price'],
          constructionType: responseList[i]['Solidity']['constructionType'],
          size: responseList[i]['Solidity']['size'],
          state: responseList[i]['state']
        );

        privateList.add(tx);


      }


    }



  }


}