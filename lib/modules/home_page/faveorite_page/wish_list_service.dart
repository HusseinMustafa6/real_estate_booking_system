import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:real_estate/configuration/server_configuration.dart';

import '../../../models/user.dart';


class WishListService{

 var url = Uri.parse(ServerConfiguration.domainName + ServerConfiguration.showPropertiesInFavorite);



 Future<List<dynamic>> fetchPropertiesFavorite()async{

   var response = await http.get(url,
   headers: {
     'auth-token': User.user_token,
   });

   if(response.statusCode == 200){
    var decodedResponse = jsonDecode(response.body);
    return decodedResponse['Property'];
   }else{
    return [];
   }



 }




}