

import 'package:real_estate/configuration/server_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:real_estate/configuration/server_configuration.dart';
import 'package:real_estate/models/user.dart';
import 'dart:convert';



class SearchPageService {
  
  



  Future<List<dynamic>> getPropertiesByAddress(String? selectedAddress)async{

    var url = Uri.parse(ServerConfiguration.domainName + ServerConfiguration.searchByAddress+selectedAddress!);
    var response = await http.post(url,
        headers: {
          'auth-token': User.user_token
        },
         );

    if(response.statusCode == 200){
      var jsonResponseList = jsonDecode(response.body);
      return jsonResponseList[0];
    }else{

      return [];
    }


  }

  Future<List<dynamic>> getPropertiesByFilter(String? selectedFilter)async{
    var url;
    var response;
    if(selectedFilter == 'Size'){
    url = Uri.parse(ServerConfiguration.domainName+ServerConfiguration.filterBySize);
    }else{
      url = Uri.parse(ServerConfiguration.domainName+ServerConfiguration.filterByPrice);
    }
    
    response = await http.get(url,
      headers: {
        'auth-token': User.user_token
      });

    if(response.statusCode == 200){
      var jsonResponseList = jsonDecode(response.body);
      return jsonResponseList[0];
    }else{

      return [];
    }
    

  }

  
  
}