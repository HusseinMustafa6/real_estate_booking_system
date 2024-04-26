


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:real_estate/custom_widgets/public_transaction_card.dart';

import '../public_transactions//public_transactions_controller.dart';


class PublicTransactions extends StatelessWidget {

  //PublicTransactionsControllerr controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 15.0),
          child: Text(""),
        ));
  }
}

/*
Obx((){
            return ListView.builder(
                itemCount: controller.publicList.length ,
                itemBuilder: (context,index){
                  return PublicTransactionCard(
                      controller.publicList[index]
                  );
                });
          })
 */