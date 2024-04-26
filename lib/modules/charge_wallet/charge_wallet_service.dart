

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:real_estate/configuration/server_configuration.dart';

import '../../models/user.dart';


class ChargeWalletService {




   Future<bool> sendMoney(var amount ,File? pic) async {

     FormData formData = new FormData.fromMap({
       'balance':amount,
       'image':await MultipartFile.fromFile(pic!.path),

     });

     Response response = await Dio().post(ServerConfiguration.domainName+ServerConfiguration.chargeWallet,
       data: formData,
       options: Options(
         headers: {
           'auth-token': User.user_token
         }
       ));

     if(response.statusCode == 200){
       return true;
     }else{
       return false;
     }

   }




}