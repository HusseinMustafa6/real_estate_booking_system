



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/private_transaction.dart';
import '../models/public_transation.dart';

class PrivateTransactionCard extends StatelessWidget {

  final PrivateTransaction privateTransaction;

  PrivateTransactionCard(this.privateTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation:5 ,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(' ${privateTransaction.state.toString()}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.green),),
                  SizedBox(height: 20,),
                  Text('${privateTransaction.address.toString()}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black45),),
                  SizedBox(height: 20,),
                  Text(' m\u00b2 ${privateTransaction.size.toString()}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black45),),
                ],
              ),
            ),

            Expanded(
              child: Column(
                children: [
                  Text('Seller: ${privateTransaction.sellerName.toString()}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black45),),
                  SizedBox(height: 10,),
                  Text('Buyer: ${privateTransaction.buyerName.toString()}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black45),),
                  SizedBox(height: 10,),
                  Text(' ${privateTransaction.constructionType.toString()}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black45),),
                  SizedBox(height: 10,),
                  Text('\$ ${privateTransaction.priceWithProfit.toString()}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black45),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}