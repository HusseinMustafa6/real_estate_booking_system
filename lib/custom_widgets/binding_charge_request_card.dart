


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_estate/models/binding_charge_request.dart';

import '../configuration/server_configuration.dart';

class BindingChargeRequestCard  extends StatelessWidget {

  final ChargeRequest chargeRequest;
  
  BindingChargeRequestCard(this.chargeRequest);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[600],
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Image.network(ServerConfiguration.domainName+'/storage/${chargeRequest.image}',fit: BoxFit.cover,
                  ),
                ),
             
              ],
            ),
            SizedBox(height: 15),
            Text('  \$ ${chargeRequest.balance}',style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold ,letterSpacing: 0.6),)
            //Text('${product.productId}'),
          ],
        ),
      ),
    );
    ;
  }
}
