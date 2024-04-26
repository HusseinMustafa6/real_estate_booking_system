import 'package:http/http.dart' as http;
import 'package:real_estate/configuration/server_configuration.dart';
import 'package:real_estate/models/user.dart';
import 'dart:convert';

class RealEstateHomeService {

     
  var url = Uri.parse(ServerConfiguration.domainName + ServerConfiguration.getHomePageInfo);



  Future<List<dynamic>> getAllProperties() async {


    var response = await http.get(url,
      headers: {
        'auth-token': User.user_token
      }
      );

    if(response.statusCode == 200){
      var jsonResponseList = jsonDecode(response.body);
       return jsonResponseList[0];
    }else{

      return [];
    }


  }




}