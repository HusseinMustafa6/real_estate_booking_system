



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:real_estate/custom_widgets/custom_button.dart';
import 'package:real_estate/modules/empty_wallet/empty_wallet_controller.dart';

class EmptyWallet extends StatelessWidget {

  EmptyWalletController emptyWalletController = Get.put(EmptyWalletController());

  Future<void> getMoney() async {

    EasyLoading.show(status: 'Loading...',dismissOnTap: true);
    var msg = await emptyWalletController.getMoney();

     if(msg.toString().contains('not')){
       EasyLoading.showError( msg.toString(),duration:Duration(seconds: 3));
     }else{
       EasyLoading.showSuccess( msg.toString(),duration:Duration(seconds: 3));
     }

     //Get.offAllNamed('/homePage');
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
            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 60.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Instructions you must follow:',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  SizedBox(height: 5,),
                  Text('1- Enter the amount of money you want to claim.',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                  SizedBox(height: 5,),
                  Text('2- Then enter your address and number to contact.',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,),maxLines: 2,),
                  SizedBox(height: 5,),
                  Text('3- Lastly enter your full name.',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,),maxLines: 1,),
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
                         emptyWalletController.balance = value;

                      },
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: MediaQuery.of(context).size.width *0.8,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'The address',
                        hintStyle: TextStyle(color: Colors.grey[500]),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black45, width: 1),
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                      ),
                      onChanged: (value){
                        emptyWalletController.address = value;
                      },
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: MediaQuery.of(context).size.width *0.8,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Phone number',
                        hintStyle: TextStyle(color: Colors.grey[500]),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black45, width: 1),
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                      ),
                      onChanged: (value){
                        emptyWalletController.phoneNumber = value;

                      },
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: MediaQuery.of(context).size.width *0.8,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Full name',
                        hintStyle: TextStyle(color: Colors.grey[500]),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black45, width: 1),
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                      ),
                      onChanged: (value){
                        emptyWalletController.fullName = value;

                      },
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Center(child: CustomButton(buttonColor: Colors.green[400], onPressed: ()async{
                    if( double.parse(emptyWalletController.balance.toString()) <= 0){
                      EasyLoading.showError('Error ! enter a valid amount');
                    }else{
                      await getMoney();
                    }

                  }, buttonText: 'Claim'))
                ],
              ),
            ),
          ) ),
    );
  }
}
