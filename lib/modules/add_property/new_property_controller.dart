import 'dart:io';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:real_estate/models/property.dart';
import 'package:real_estate/modules/add_property/new_property_service.dart';

class NewPropertyController extends GetxController{

  var floorNum;
  var roomNum;
  var bathRoomNum;
  var size ;
  var price;
  var constructionType; // نوع البناء شقة منزل بيت عربي استوديو الخ
  var address;
  var detailedAddress;
  var constructionCondition;   // حالة البناء على العضم او جاهز
  File? propertyImg;
  File? contractImg;
  File? image3File;
  File? image4File;
  File? image5File;
  File? image6File;



  var succesMsg; //this variable will hold the msg


  NewPropertyService newPropertyService = NewPropertyService();

  Future<bool> addRealEstateToDataBaseController(Property p)async{

    bool temp = await newPropertyService.addRealEstateToDataBaseService(p);
    succesMsg = newPropertyService.msg;

    return temp;
  }


  @override
  String toString() {
    return floorNum.toString() +
        roomNum.toString() +
        size.toString()  +
        price.toString() +
        constructionCondition.toString() +
        constructionType.toString()  +
        address.toString()+
        contractImg!.path
    ;
  }


}