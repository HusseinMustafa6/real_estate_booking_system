import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:real_estate/models/property.dart';
import 'package:real_estate/modules/property_details/property_info.dart';
import 'package:real_estate/modules/update_property_price/update_property.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../configuration/server_configuration.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../configuration/server_configuration.dart';
import '../../models/user.dart';
import '../modules/home_page/profile_page/profile_controller.dart';


class PropertyCard extends StatelessWidget {
  final Property _property;

  PropertyCard(this._property);

   showAlert(BuildContext context){

     Alert(
       context: context,
       type: AlertType.warning,
       title: "ALERT",
       desc: "You're about to Delete this property , continue?.",
       buttons: [
         DialogButton(
           child: Text(
             "Confirm",
             style: TextStyle(color: Colors.white, fontSize: 20),
           ),
           onPressed: ()async{
             bool temp = await deleteProperty();
             if(temp){
               var tempController = Get.find<ProfileController>();
               tempController.clearList();
               tempController.fetchMyProperties();
               EasyLoading.showSuccess('The property has been deleted successfully',duration: Duration(seconds: 3));
             }else{
               EasyLoading.showError('Error !',duration: Duration(seconds: 4));
             }
             Navigator.pop(context);
           },
           width: 120,
         )
       ],
     ).show();


   }

  Future<bool> deleteProperty()async{

    var url = Uri.parse(ServerConfiguration.domainName+ServerConfiguration.deleteProperty+_property.propertyIdInUserProfile.toString());
    EasyLoading.show(status: 'Deleting...',dismissOnTap: true);
    var response = await http.get(url,
        headers: {
          'auth-token': User.user_token,
        });

    if(response.statusCode == 200){
      return true;
    }else{
      return false;
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
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: _property.image3File != null ? Image.file(_property.image3File!):Image.network(ServerConfiguration.domainName+'/storage/${_property.image3}',fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: -12,
                    right: -13,
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: PopupMenuButton<int>(
                        onSelected: (item)=> onSelected(context, item),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: Text('Update'),
                            value: 0,
                          ),
                          PopupMenuItem(
                            child: Text('Delete'),
                            value: 1,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.home,
                    size: 20,
                  ),
                  Text(
                    ':${_property.floorNum}',
                    maxLines: 2,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.bed,
                    size: 20,
                  ),
                  Text(
                    ':${_property.roomNum}',
                    maxLines: 2,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.shower,
                    size: 20,
                  ),
                  Text(
                    ':${_property.bathRoomNum}',
                    maxLines: 2,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),

              SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _property.constructionType,
                      maxLines: 2,
                      style:
                          TextStyle(fontWeight: FontWeight.w800, color: Colors.green),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(child: Text(_property.address, style: TextStyle( fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,))
                ],
              ),
              SizedBox(height: 8),
              Text('\$${_property.price}',
                  style: TextStyle(
                    fontSize: 20,
                  )),
              //Text('${product.productId}'),
            ],
          ),
        ),
      ),
    );

  }


  void onSelected(BuildContext context , int item ) async{

    switch(item){
      case 0:
        Navigator.push(context, MaterialPageRoute(builder:(context){
          return UpdateProperty(this._property);
        }));
        break;
      case 1:
        showAlert(context);

        break;

    }








  }



}
