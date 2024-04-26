
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:real_estate/configuration/server_configuration.dart';
import 'package:real_estate/models/user.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_estate/custom_widgets/custom_button.dart';

class SuggestionPage extends StatefulWidget {

  @override
  State<SuggestionPage> createState() => _SuggestionPageState();
}

class _SuggestionPageState extends State<SuggestionPage> {
  String? enteredAddress;

  String? enteredSuggestion;

  Future<void> sendSuggestion()async{

    var url = Uri.parse(ServerConfiguration.domainName+ServerConfiguration.addSuggetion);


    var response = await http.post(url,
     headers: {
       'auth-token': User.user_token
     },
      body: {
      'address':this.enteredAddress.toString(),
      'text':this.enteredSuggestion.toString(),
      }
     );

    print(enteredSuggestion.toString());

    if(response.statusCode == 200){
      EasyLoading.showSuccess('Done',duration: Duration(seconds: 2));
    }else{
      EasyLoading.showError('Error !',duration: Duration(seconds: 2));
    }



  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:EdgeInsets.all(15.0) ,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width ,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Your Address',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black45, width: 1),
                      borderRadius: BorderRadius.circular(8.0)
                  ),
                ),
                onChanged: (value){
                  setState(() {
                    enteredAddress = value;
                  });

                },
                keyboardType: TextInputType.text,
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width ,
              child: TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Your suggestion',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black45, width: 1),
                      borderRadius: BorderRadius.circular(8.0)
                  ),
                ),
                onChanged: (value){
                  setState(() {
                    enteredSuggestion = value;
                  });


                },
                keyboardType: TextInputType.text,
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: CustomButton(buttonColor: Colors.green[400], onPressed: ()async{
                await sendSuggestion();
                Navigator.of(context).pop();
              }, buttonText: 'Send'),
            ),

          ],
        ),
    );
  }
}
