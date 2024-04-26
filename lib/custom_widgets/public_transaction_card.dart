

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/public_transation.dart';

class PublicTransactionCard extends StatelessWidget {

  final PublicTransaction publicTransaction;

  PublicTransactionCard(this.publicTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation:5 ,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
           mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
                backgroundColor: Color.fromARGB(200, 0, 50, 79),
                radius: 30.0,
                child: Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: FittedBox(
                    child: Text(
                      '\$ ${publicTransaction.priceWithProfit.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontFamily: 'Pushster'),),
                  ),
                )),
            Expanded(
              child: Column(
                children: [
                  Text('Buyer: ${publicTransaction.buyerName.toString().substring(0,2)}******',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.red[200]),),
                  SizedBox(height: 10,),
                  Text(' ${publicTransaction.address.toString()}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black45),),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text('Seller: ${publicTransaction.sellerName.toString().substring(0,2)}******',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.green[200]),),
                  SizedBox(height: 10,),
                  Text('${publicTransaction.constructionType.toString()}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black54),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
    Column(
             children: [
               Text('Buyer: ${publicTransaction.buyerName.toString().substring(0,2)}*****',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.red[200]),),
               SizedBox(height: 10,),
               Text('Address: ${publicTransaction.address.toString()}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black45),),
             ],
           ),
            SizedBox(width: 10,),
            Column(
              children: [
                Text('   \$ ${publicTransaction.price.toString()}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.blueGrey[300]),),
              ],
            ),
            SizedBox(width: 20,),
            Column(
              children: [
                Text('Seller: ${publicTransaction.sellerName.toString().substring(0,3)}*****',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.green[200]),),
                SizedBox(height: 10,),
                Text('Type: ${publicTransaction.constructionType.toString()}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black45),),
              ],
            ),
 */
