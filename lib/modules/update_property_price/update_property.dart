

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:real_estate/configuration/server_configuration.dart';
import 'package:real_estate/models/user.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_estate/custom_widgets/custom_button.dart';
import 'package:real_estate/models/property.dart';
import 'package:get/get.dart';
import 'package:real_estate/modules/home_page/home_page.dart';


class UpdateProperty extends StatelessWidget {

  final Property _property;
   var newPrice;

   UpdateProperty(this._property);

   Future<bool> updatePrice() async{

      var url = Uri.parse(ServerConfiguration.domainName + ServerConfiguration.updatePropertyPrice+_property.propertyIdInUserProfile.toString());

      var response = await http.post(url,
         headers: {
           'auth-token': User.user_token
         },
        body: {
         'price':newPrice
        }
         );
       var decodedResponse = jsonDecode(response.body);
       bool status = decodedResponse['status'];

       if(status){
         return true;
       }else{
         var errMsg = decodedResponse['message'];
         EasyLoading.showError(errMsg,duration: Duration(seconds: 3));
         return false;
       }



   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
          child:Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Here you can update only the price of your property , note that the new price should be at least equal to the old price.',
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold ,),maxLines: 3,),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(child: Text('New Price:',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                    SizedBox(width: 8,),
                    Expanded(child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black45, width: 1),
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                      ),
                      onChanged: (value){
                        newPrice = value;

                      },
                    ))
                  ],
                ),
                SizedBox(height: 15,),
                CustomButton(buttonColor: Colors.blueGrey[400], onPressed:
                    ()async {

                  bool tempVar = await updatePrice();
                  if(tempVar){
                    EasyLoading.showSuccess('Price updated successfully.',duration: Duration(seconds: 3));
                    _property.price = newPrice;
                  }

                  //HomePage.currentIndex.value = 3;
                  Get.offAllNamed('/homePage');
                }, buttonText:'Update'),
              ],
            ),
          ) ),
    );
  }
}
