import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
import 'package:real_estate/configuration/server_configuration.dart';
import 'package:real_estate/models/property.dart';
import 'package:real_estate/modules/home_page/faveorite_page/wish_list_controller.dart';
import 'package:real_estate/modules/property_details/property_info.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../configuration/server_configuration.dart';
import '../../models/user.dart';
import '../modules/home_page/profile_page/profile_controller.dart';


class HomePagePropertyCard extends StatelessWidget {
  final Property _property;

  HomePagePropertyCard(this._property);

  RxBool ratingIsGiven = false.obs;


  Future<void> addRealEstateToFavorite() async{

    var decodedResponse;
    var msg;



    var url = Uri.parse(ServerConfiguration.domainName + ServerConfiguration.addPropertyToFavorite+_property.propertyIdInHomePage.toString());
    //the request will not be send if this property belongs to the users that is selecting on it.
    if(this._property.propertyOwnerId == User.userId){
      EasyLoading.showError('You can\'t add one of your properties to the favorite.',duration: Duration(seconds: 2));
      this._property.isFavorite.value = false;
    }else{
      var response = await http.post(url,
          headers: {
            'auth-token': User.user_token,
          }
      );
      decodedResponse = jsonDecode(response.body);
      msg = decodedResponse['message'];
      if(response.statusCode == 200){
        EasyLoading.showSuccess(msg,duration: Duration(seconds: 2));

      }else{
        EasyLoading.showError(msg,duration: Duration(seconds: 2));

      }
    }




  }



  Future<void> addRatingToRealEstate(double rating)async{

    var url = Uri.parse(ServerConfiguration.domainName+ServerConfiguration.addRatingToRealEstate+_property.propertyIdInHomePage.toString());

    var response = await http.post(url,
       headers: {
         'auth-token': User.user_token,
       },
      body: {
      'rating':rating.toString(),
      }
      );

    if(response.statusCode == 200){
      var decodedJson = jsonDecode(response.body);
      var msg = decodedJson['message'];
      EasyLoading.showSuccess(msg,duration: Duration(seconds: 2));
    }else{
      //EasyLoading.showError('Rating could not be done',duration: Duration(seconds: 3));
    }

    ratingIsGiven.value = true;
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
                    child: Obx(() => Container(
                      width: 35,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                        color: Colors.red[700],
                        splashRadius: 30,
                        icon: _property.isFavorite.value
                            ? Icon(Icons.favorite_rounded)
                            : Icon(Icons.favorite_border),
                        onPressed: ()async {
                          _property.isFavorite.toggle();
                          var tempController = Get.find<WishListController>();
                          if (_property.isFavorite.isTrue) {
                            await addRealEstateToFavorite();
                          }
                        }
                        ,
                      ),
                    )),
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
              Obx(()=>RatingBar.builder(
                allowHalfRating: true,
                ignoreGestures: ratingIsGiven.value,
                itemSize: 20,
                initialRating: _property.propertyAvgRating + 0.0,
                minRating: 1,
                direction: Axis.horizontal,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating)async{
                  await addRatingToRealEstate(rating);
                },
              ),),
              Text('(${_property.propertyAvgRating}) ${_property.propertyRatingCount}'),
              SizedBox(height: 8),
              Text('\$${_property.newPrice}',
                  style: TextStyle(
                    fontSize: 20,
                  )),
              //Text('${product.productId}'),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
