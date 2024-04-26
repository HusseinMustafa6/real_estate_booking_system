

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:http/http.dart' as http;
import '../../configuration/server_configuration.dart';
import '../../models/user.dart';
import '../modules/home_page/profile_page/profile_controller.dart';
import '../configuration/server_configuration.dart';
import '../models/property.dart';
import '../modules/property_details/property_info.dart';
import '../modules/realestate_binding_requests/properties_binding_controller.dart';

class BindingPropertyCard extends StatelessWidget {
  final Property _property;

  BindingPropertyCard(this._property);

  Future<bool> deletePropertyRequest()async{

    var url = Uri.parse(ServerConfiguration.domainName + ServerConfiguration.deletePropertyRequest +_property.propertyIdInUserProfile.toString());
    print(_property.propertyIdInUserProfile.toString());
    EasyLoading.show(status: 'Deleting...',dismissOnTap: true);
    var response = await http.get(url,
       headers: {
         'auth-token': User.user_token,
       });

      if(response.statusCode==200){
        return true;
      }else{
        return false;
      }


  }



  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[600],
      elevation: 4,
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
                  child: _property.propertyImg != null
                      ? Image.file(
                    _property.propertyImg!,
                    fit: BoxFit.cover,
                  )
                      : Image.network(ServerConfiguration.domainName+'/storage/${_property.image3}',fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: -12,
                  left: -10,
                  child: Container(
                    width: 35,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[600],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: IconButton(
                      color: Colors.red,
                      splashRadius: 30,
                      icon: Icon(Icons.delete ,),
                      onPressed: ()async{
                       bool tempVar = await deletePropertyRequest();
                       if(tempVar){
                         //var tempController = Get.find<BindingRequestsController>();
                         //tempController.clearList();
                         //tempController.fetchMyProperties();
                         EasyLoading.showSuccess('The property request has been deleted successfully',duration: Duration(seconds: 3));
                         Get.offAllNamed('/homePage');

                       }

                      }

                      ,
                    ),
                  )
                )
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.home,
                  size: 20,
                  color: Colors.white,
                ),
                Text(
                  ':${_property.floorNum}',
                  maxLines: 2,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.white,),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(width: 8),
                Icon(
                  Icons.bed,
                  size: 20,
                  color: Colors.white,
                ),
                Text(
                  ':${_property.roomNum}',
                  maxLines: 2,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.white,),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(width: 8),
                Icon(
                  Icons.shower,
                  size: 20,
                  color: Colors.white,
                ),
                Text(
                  ':${_property.bathRoomNum}',
                  maxLines: 2,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.white,),
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
                Expanded(child: Text(_property.address, style: TextStyle( fontWeight: FontWeight.bold, color: Colors.white,),
                  overflow: TextOverflow.ellipsis,))
              ],
            ),
            SizedBox(height: 8),
            Text('\$${_property.price}',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                )),
            //Text('${product.productId}'),
          ],
        ),
      ),
    );
    ;
  }
}

// Color(0x004CAF0)