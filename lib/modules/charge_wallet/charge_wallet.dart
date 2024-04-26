

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_estate/custom_widgets/custom_button.dart';
import 'package:real_estate/modules/charge_wallet/charge_wallet_controller.dart';

class ChargeWallet extends StatefulWidget {

  @override
  State<ChargeWallet> createState() => _ChargeWalletState();
}

class _ChargeWalletState extends State<ChargeWallet> {
  
  ChargeWalletController chargeWalletController = Get.put(ChargeWalletController());
  
  Future<void> sendMoney() async{

     EasyLoading.show(status: 'Loading...',dismissOnTap: true);
     bool temp = await chargeWalletController.sendMoney();
     
     if(temp){
       EasyLoading.showSuccess('Sending completed successfully',duration: Duration(seconds: 3));
     }else{
       EasyLoading.showError('Something went Wrong !',duration: Duration(seconds: 3));
     }

     Get.offAllNamed('/homePage');
  }
  
  
  Future pickImage(ImageSource source ) async {
    try {
      final image = await ImagePicker().pickImage(
          source: source); //selected image will be stored here
      if (image == null) return;
  
      final imageTemporary = File(image.path);
      
      setState(() {
        chargeWalletController.moneyReceipt = imageTemporary;
      });
    } on PlatformException catch (e) {
      print(e);
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
          child: Padding(
           padding: EdgeInsets.symmetric(horizontal: 15.0 , vertical: 60.0),
           child: SingleChildScrollView(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text('Instructions you must follow:',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                 SizedBox(height: 5,),
                 Text('1- The Money should be send to this contact +963932309718 with the name Khader eskander & your address .',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),maxLines: 2,),
                 SizedBox(height: 5,),
                 Text('2- Enter the amount of money you sent it.',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400 ,color: Colors.black),),
                 SizedBox(height: 5,),
                 Text('3- Upload an image of the receipt that confirm the amount has been sent.',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,),maxLines: 2,),
                 SizedBox(height: 5,),
                 Text('4- An equivalent amount in USD will be send to your wallet.',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                 SizedBox(height: 40,),
                 Container(
                   width: MediaQuery.of(context).size.width *0.8,
                   child: TextField(
                     decoration: InputDecoration(
                       hintText: 'The amount ',
                       hintStyle: TextStyle(color: Colors.grey[500]),
                       enabledBorder: OutlineInputBorder(
                           borderSide: BorderSide(color: Colors.black45, width: 1),
                           borderRadius: BorderRadius.circular(8.0)
                       ),
                     ),
                     onChanged: (value){
                         chargeWalletController.moneyAmount = value;

                     },
                     keyboardType: TextInputType.number,
                   ),
                 ),
                 SizedBox(height: 10,),
                 Row(
                   children: <Widget>[
                     Expanded(
                       child: FlatButton(
                           onPressed: ()async {

                             await pickImage(ImageSource.gallery );
                           },
                           color: Colors.blue[300],
                           child: Container(
                             width: MediaQuery
                                 .of(context)
                                 .size
                                 .width * 0.3,
                             child: Row(
                               children: [
                                 Icon(Icons.photo),
                                 SizedBox(width: 10,),
                                 Text('Pick gallery', style: TextStyle(
                                     fontSize: 14,
                                     color: Colors.black54,
                                     fontWeight: FontWeight.bold),)
                               ],
                             ),
                           )
                       ),
                     ),
                     SizedBox(width: 20,),
                     Expanded(
                       child: FlatButton(onPressed: () async{
                         await pickImage(ImageSource.camera);
                       },
                           color: Colors.blue[300],
                           child: Container(
                             width: MediaQuery
                                 .of(context)
                                 .size
                                 .width * 0.3,
                             child: Row(
                               children: [
                                 Icon(Icons.camera),
                                 SizedBox(width: 10,),
                                 Text('Pick camera', style: TextStyle(fontSize: 14,
                                     color: Colors.black54,
                                     fontWeight: FontWeight.bold),)
                               ],
                             ),
                           )
                       ),
                     ),

                   ],

                 ),
                 SizedBox(height: 5,),
                 chargeWalletController.moneyReceipt != null ?
                   Image.file(chargeWalletController.moneyReceipt!,width: 160 ,height: 160,)
                   : Text(''),
                 SizedBox(height: 20,),
                 Center(
                   child: CustomButton(buttonColor: Colors.green[400], onPressed: ()async{
                     if(double.parse(chargeWalletController.moneyAmount.toString()) <= 0 ){
                       EasyLoading.showError('Error ! enter a valid amount');
                     }else {
                       await sendMoney();
                     }
                   }, buttonText: 'Charge'),
                 )
               ],
             ),
           ),
          )
         ),
    );
  }
}
