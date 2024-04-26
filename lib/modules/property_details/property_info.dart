
import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:real_estate/models/property.dart';
import 'package:real_estate/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:real_estate/modules/home_page/real_estate_home/real_estate_home_controller.dart';
import '../../configuration/server_configuration.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class PropertyInfo extends StatelessWidget {

  final Property _property;

  PropertyInfo(this._property);


   RxInt activeIndex = 0.obs;

   showAlert(BuildContext context) {

    if(_property.propertyOwnerId == User.userId){
      EasyLoading.showError('You cant\'t buy one of your own properties !',duration: Duration(seconds: 3));
    }else {
      Alert(
        context: context,
        type: AlertType.warning,
        title: "ALERT",
        desc: "You're about to spend \$ ${_property.newPrice} on this property , continue?.",
        buttons: [
          DialogButton(
            child: Text(
              "Confirm",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: ()async{
              await buyProperty();
              Get.offAllNamed('/homePage');
            },
            width: 120,
          )
        ],
      ).show();

    }


  }



   Future<void> buyProperty()async{


       var url = Uri.parse(ServerConfiguration.domainName + ServerConfiguration.buyFunction+_property.propertyIdInHomePage.toString());

       var response = await http.post(url,
       headers: {
         'auth-token': User.user_token
       });
       var decodedResponse = jsonDecode(response.body);
       if(response.statusCode == 200){
         var msg = decodedResponse['message'];
         EasyLoading.showSuccess(msg,duration: Duration(seconds: 3));

         var tempController = Get.find<RealEstateHomeController>();

         int index = tempController.homeMainProperties.indexOf(_property);
         tempController.homeMainProperties.removeAt(index);
         tempController.clearList();
         await tempController.fetchHomePageProperties();
         tempController.clearList();
       }else{
         var msg = decodedResponse['message'];
         EasyLoading.showError(msg,duration: Duration(seconds: 3));
       }

     }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar:  AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[100],
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider(
                  items: [

                   //_property.propertyImg != null? Image.file(_property.propertyImg!):Image.network(ServerConfiguration.domainName+'/storage/${_property.image1}',fit: BoxFit.cover,),
                   //_property.contractImg != null?  Image.file(_property.contractImg!):Image.network(ServerConfiguration.domainName+'/storage/${_property.image2}',fit: BoxFit.cover,),
                    _property.image3File != null?  Image.file(_property.image3File!):Image.network(ServerConfiguration.domainName+'/storage/${_property.image3}',fit: BoxFit.cover,),
                    _property.image4File != null?  Image.file(_property.image4File!):Image.network(ServerConfiguration.domainName+'/storage/${_property.image4}',fit: BoxFit.cover,),
                    _property.image5File != null?  Image.file(_property.image5File!):Image.network(ServerConfiguration.domainName+'/storage/${_property.image5}',fit: BoxFit.cover,),
                    _property.image6File != null?  Image.file(_property.image6File!):Image.network(ServerConfiguration.domainName+'/storage/${_property.image6}',fit: BoxFit.cover,),
                  ],
                  options:  CarouselOptions(
                      onPageChanged: (index ,ca){
                        print(index);
                        activeIndex.value = index;
                    },
                      height: 400.0,
                      initialPage: 0,
                      viewportFraction: 2.0,
                      enableInfiniteScroll: true,
                      autoPlay: false,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      scrollDirection: Axis.horizontal,

                  ),
                ),
                 SizedBox(height: 10,),
                 Obx(()=>    Center(
                   child: AnimatedSmoothIndicator(
                     activeIndex: activeIndex.value,
                     count: 4,
                     effect: WormEffect(),
                     axisDirection: Axis.horizontal,
                   ),
                 )),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Icon(
                      Icons.home,
                      size: 30,
                    ),
                    Text(
                      ':${_property.floorNum}',
                      maxLines: 2,
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.bed,
                      size: 30,
                    ),
                    Text(
                      ':${_property.roomNum}',
                      maxLines: 2,
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.shower,
                      size: 30,
                    ),
                    Text(
                      ':${_property.bathRoomNum}',
                      maxLines: 2,
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Construction state: ',
                        maxLines:2,
                        style:
                        TextStyle(fontWeight: FontWeight.w600 ,fontSize: 18),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        ' ${_property.constructionCondition} ',
                        maxLines:5,
                        style:
                        TextStyle(fontWeight: FontWeight.w400 ,fontSize: 18),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text(
                      'Offer Date: ',
                      maxLines: 1,
                      style:
                      TextStyle(fontWeight: FontWeight.w600 ,fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      '${_property.offerDateText}',
                      maxLines: 1,
                      style:
                      TextStyle(fontWeight: FontWeight.w400 ,fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Address: ',
                      maxLines: 1,
                      style:
                      TextStyle(fontWeight: FontWeight.w600 ,fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      '${_property.address}',
                      maxLines: 1,
                      style:
                      TextStyle(fontWeight: FontWeight.w400 ,fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Detailed address: ',
                        maxLines: 1,
                        style:
                        TextStyle(fontWeight: FontWeight.w600 ,fontSize: 18),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${_property.detailedAddress}',
                        maxLines: 2,
                        style:
                        TextStyle(fontWeight: FontWeight.w400 ,fontSize: 18),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Size: ',
                      style:
                      TextStyle(fontWeight: FontWeight.w600 ,fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      '${_property.size}  m\u00b2',
                      style:
                      TextStyle(fontWeight: FontWeight.w400 ,fontSize: 18),
                      textAlign: TextAlign.left,
                    ),

                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Construction type: ',
                      maxLines: 1,
                      style:
                      TextStyle(fontWeight: FontWeight.w600 ,fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      '${_property.constructionType}',
                      maxLines: 1,
                      style:
                      TextStyle(fontWeight: FontWeight.w400 ,fontSize: 18,),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Price : ',
                      maxLines: 1,
                      style:
                      TextStyle(fontWeight: FontWeight.w600 ,fontSize: 20),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      '\$ ${_property.newPrice}',
                      maxLines: 1,
                      style:
                      TextStyle(fontWeight: FontWeight.w400 ,fontSize: 20),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: RaisedButton(
                    color: Colors.blue[400],
                    onPressed: (){
                     showAlert(context);
                    },
                    child: Text('Purchase',style: TextStyle(fontSize: 16,color: Colors.white),),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*
  Container(
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.file(_property.img!),
                ),
 */
//DateFormat.yMMMd().format(_property.offerDate)}

/*
Alert(
      context: context,
      type: AlertType.error,
      title: "RFLUTTER ALERT",
      desc: "Flutter is more awesome with RFlutter Alert.",
      buttons: [
        DialogButton(
          child: Text(
            "COOL",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
 */