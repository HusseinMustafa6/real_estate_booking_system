import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:real_estate/configuration/server_configuration.dart';
import 'package:real_estate/models/property.dart';

import '../models/user.dart';
import '../modules/home_page/faveorite_page/wish_list_controller.dart';
import 'package:http/http.dart' as http;
import '../../configuration/server_configuration.dart';
import '../modules/property_details/property_info.dart';


class FavoritePropertyCard extends StatelessWidget {
  final Property _property;

  FavoritePropertyCard(this._property);

  Future<void> deleteRealEstateFromFavorite() async{



    var decodedResponse;
    var msg;

    var tempController = Get.find<WishListController>();

    var selectedID = tempController.propertiesIdInWishList[_property.propertyIdInHomePage];

    var url = Uri.parse(ServerConfiguration.domainName + ServerConfiguration.deletePropertyFromFavorite+_property.propertyIdInWishList.toString());

    var response = await http.get(url,
      headers: {
        'auth-token': User.user_token,
      });

    //decodedResponse = jsonDecode(response.body);
    //msg = decodedResponse['message'];

    print('SelectedID');
    print(selectedID.toString());
    if(response.statusCode == 200){
      EasyLoading.showSuccess("Delete is done",duration: Duration(seconds: 2));
      int index = tempController.likedProperties.indexOf(_property);
      tempController.likedProperties.removeAt(index);
    }else{
      EasyLoading.showError("Failed",duration: Duration(seconds: 2));
    }



  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return PropertyInfo(_property);
        }));
      },
      child: Card(
        elevation: 5,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              height: 180,
              width: 125,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              child: _property.image3File != null
                  ? Image.file(
                      _property.image3File!,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      ServerConfiguration.domainName +
                          '/storage/${_property.image3}',
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 10),
                  Text(
                    _property.constructionCondition,
                    maxLines: 3,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Text(
                        _property.address,
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                            fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        _property.constructionType,
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.green,
                            fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: Text('\$ ${_property.price}',
                            style:
                                TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                      ),
                      Expanded(
                          child: IconButton(
                        icon: Icon(Icons.delete , color: Colors.red,),
                        onPressed: () async{
                           await deleteRealEstateFromFavorite();
                        },
                      ))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
Row(
                  children: [
                    Icon(
                      Icons.home,
                      size: 25,
                    ),
                    Text(
                      ':${_property.floorNum}',
                      maxLines: 2,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.bed,
                      size: 25,
                    ),
                    Text(
                      ':${_property.roomNum}',
                      maxLines: 2,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.shower,
                      size: 25,
                    ),
                    Text(
                      ':${_property.bathRoomNum}',
                      maxLines: 2,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
 */