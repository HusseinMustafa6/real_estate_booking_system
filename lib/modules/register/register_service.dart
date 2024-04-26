import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:real_estate/configuration/server_configuration.dart';

import '../../models/user.dart';

class RegisterService {

  var url = Uri.parse(ServerConfiguration.domainName + ServerConfiguration.register);

  var client = http.Client();


  var msg;
  var errors;


 Future<bool> registerUserService(User user)async{

   var response = await client.post(url,
   body: {
     "name":user.fullname,
     "email":user.email,
     "password":user.password,
     "phoneNumber":user.phoneNumber.toString()
   }
   );


   if(response.statusCode ==200){
     //the api will not return any value in sucess
     return true;
   }else{
       var decodedResponse = jsonDecode(response.body);
     msg =  decodedResponse['message'];
     errors = decodedResponse['errors'];
   return false;
   }


 }


}