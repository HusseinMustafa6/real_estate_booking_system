

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:real_estate/custom_widgets/public_transaction_card.dart';
import 'package:real_estate/modules/home_page/public_transactions/public_transactions_controller.dart';
import 'package:real_estate/modules/private_transactions/private_transactions_controller.dart';

import '../../custom_widgets/private_transaction_card.dart';

class PrivateTransactions extends StatelessWidget {

  PrivateTransactionsController controller = Get.put(PrivateTransactionsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 15.0),
            child: Obx((){

              return ListView.builder(
                  itemCount: controller.privateList.length ,
                  itemBuilder: (context,index){
                    return PrivateTransactionCard(
                        controller.privateList[index]
                    );
                  });

            })
          )),
    );
  }
}

/*
Row(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(width: 100,
                      child: Divider( thickness: 2,color: Colors.black, ),
                    ),
                    Text('Your Transactions',style: TextStyle(fontSize: 21 ,color: Colors.black87 ,fontFamily: 'Pushster') ,),
                    SizedBox(width: 100,
                      child: Divider( thickness: 2,color: Colors.black, ),
                    ),
                  ],
                ),
                SizedBox(height: 8,),
 */