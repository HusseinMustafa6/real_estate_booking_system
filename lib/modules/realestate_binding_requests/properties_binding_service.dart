import 'package:http/http.dart' as http;
import 'package:real_estate/configuration/server_configuration.dart';
import 'package:real_estate/models/user.dart';
import 'dart:convert';



class BindingRequestsService {


  var client = http.Client();

  var url = Uri.parse(ServerConfiguration.domainName + ServerConfiguration.getPropertiesBindingRequests);

  Future<List<dynamic>> fetchMyProperties() async{

    var response = await client.get(url,
        headers: {
          'auth-token': User.user_token
        }
    );

    var propertiesList = jsonDecode(response.body);


    return propertiesList['Request'];
  }


}