
import 'package:http/http.dart' as http;
import 'package:real_estate/configuration/server_configuration.dart';
import 'package:real_estate/models/property.dart';
import 'package:real_estate/models/user.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

class NewPropertyService {

 var msg;

 var client = http.Client();

 var url = Uri.parse(ServerConfiguration.domainName + ServerConfiguration.addRealEstate);


 Future<bool> addRealEstateToDataBaseService(Property p) async{




   FormData formData = new FormData.fromMap({
          'numberFloor':p.floorNum.toString() ,
           'numberRoom':p.roomNum.toString(),
          'size':p.size.toString(),
           'price':p.price.toString(),
            'constructionType':p.constructionType,
            'image':await MultipartFile.fromFile(p.propertyImg!.path),
            'address':p.address.toString(),
             'constructionCondition':p.constructionCondition,
             'pathRoom':p.bathRoomNum.toString(),
              'detiledAddress':p.detailedAddress,
                'propertyImage':await MultipartFile.fromFile(p.contractImg!.path),
                'image1':await MultipartFile.fromFile(p.image3File!.path),
     'image2':await MultipartFile.fromFile(p.image4File!.path),
     'image3':await MultipartFile.fromFile(p.image5File!.path),
     'image4':await MultipartFile.fromFile(p.image6File!.path),
       });

   Response response = await Dio().post(ServerConfiguration.domainName + ServerConfiguration.addRealEstate,
    data: formData,
     options: Options(
       headers: {
         'auth-token': User.user_token
       }
     )
   );


   if(response.statusCode == 200){
     msg = response.data['message'];
     return true;
   }else{

     return false;
   }



 }


}