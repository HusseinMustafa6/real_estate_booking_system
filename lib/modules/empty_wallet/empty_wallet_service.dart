
import 'dart:convert';

import 'package:real_estate/configuration/server_configuration.dart';
import 'package:http/http.dart' as http;

import '../../models/user.dart';

class EmptyWalletService {


  var url = Uri.parse(ServerConfiguration.domainName +ServerConfiguration.emptyWallet);


  Future<dynamic> getMoney(var balance , var address  , var phone , var fullName)async{
    var response = await http.post(url,
      body: {
       'balance':balance,
        'address':address,
        'number':phone,
        'name':fullName
      },
      headers: {
        'auth-token': User.user_token
      });

    var decodecJson = jsonDecode(response.body);

    var msg = decodecJson['message'];

    return msg;
  }



}