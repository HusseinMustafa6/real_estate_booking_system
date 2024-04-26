
import 'package:http/http.dart' as http;
import 'package:real_estate/configuration/server_configuration.dart';
import 'package:real_estate/models/user.dart';
import 'dart:convert';

class PublicRecordsService{


  var url = Uri.parse(ServerConfiguration.domainName + ServerConfiguration.getPublicTransactions);


  Future<List<dynamic>> getPublicTransactions()async{

    var response = await http.get(url,
        headers: {
          'auth-token': User.user_token
        });

    var decodedResponse = jsonDecode(response.body);

    if(response.statusCode == 200){
      return decodedResponse['Solidity'];
    }else{
      return [];
    }



  }




}