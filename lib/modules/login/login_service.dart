import 'dart:convert';

import 'package:http/http.dart' as http;
 import '../../configuration/server_configuration.dart';
import '../../models/user.dart';

class LoginService{

   var statusMsg = ''; //متحول يعبر عن حالة معلومات تسجيل الدخول في حال كانت كاملة او ناقصة

   var url = Uri.parse(ServerConfiguration.domainName + ServerConfiguration.login);
   var client = http.Client();

   Future<bool> loginUserService(User user)async{

     var response = await client.post(url,
     body: {
       'email':user.email,
       'password':user.password
     });
     var jsonResponse = jsonDecode(response.body);
        bool? status = jsonResponse['status'];

        if(status == null){
          statusMsg = 'Wrong password or email !';
          return false;
        }else{

          if(status){
            User.user_token = jsonResponse['user']['api_token'];
            User.userId = jsonResponse['user']['id'];
            print(User.user_token);
            return true;
          }else{
            statusMsg = jsonResponse['msg'];
            return false;
          }
        }




   }





 }