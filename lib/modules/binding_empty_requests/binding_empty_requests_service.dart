import 'dart:convert';

import 'package:real_estate/configuration/server_configuration.dart';
import 'package:http/http.dart' as http;

import '../../models/user.dart';

class BindingEmptyRequestsService {



  var url = Uri.parse(ServerConfiguration.domainName+ServerConfiguration.getEmptyRequests);


  
  Future<List<dynamic>> getEmptyRequests()async{


    var response = await http.get(url,
      headers: {
        'auth-token': User.user_token
      },);
    var decodedResponse = jsonDecode(response.body);

    if(response.statusCode == 200){
      return decodedResponse['Empty Wallet'];
    }else{
      return [];
    }
    
    
    
    
  }







}