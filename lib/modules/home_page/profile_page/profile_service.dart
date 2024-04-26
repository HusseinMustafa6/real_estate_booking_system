import 'package:http/http.dart' as http;
import 'package:real_estate/configuration/server_configuration.dart';
import 'package:real_estate/models/user.dart';
import 'dart:convert';

class ProfileService{

  var userName;
  var userEmail;
  var wallet;
  var phoneNumber;

  var client = http.Client();

  var url = Uri.parse(ServerConfiguration.domainName + ServerConfiguration.getProfileInfo);

  Future<List<dynamic>> fetchMyProperties() async{

    var response = await client.get(url,
      headers: {
         'auth-token': User.user_token
      }
    );

    var propertiesList = jsonDecode(response.body);

    userName = propertiesList[0]['name'];
    userEmail= propertiesList[0]['email'];
    wallet = propertiesList[0]['wallet'];
    phoneNumber = propertiesList[0]['phoneNumber'];
    return propertiesList[1];
  }

}