



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_estate/models/binding_empty_request.dart';

class BindingEmptyRequestCard extends StatelessWidget {

  final EmptyRequest emptyRequest;

   BindingEmptyRequestCard(this.emptyRequest);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.blueGrey[600],
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text('Name: ${emptyRequest.fullName}',style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold,letterSpacing: 0.8),),
                SizedBox(height: 8,),
                Text('Address: ${emptyRequest.address}',style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold,letterSpacing: 0.8),),
              ],
            ),
            SizedBox(width: 10,),
            Column(
              children: [
                Text('Amount: ${emptyRequest.balance}',style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold,letterSpacing: 0.8),),
                SizedBox(height: 8,),
                Text('Phone: ${emptyRequest.phone}',style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold,letterSpacing: 0.8),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
