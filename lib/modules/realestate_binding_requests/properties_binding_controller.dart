


import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:real_estate/modules/realestate_binding_requests/properties_binding_service.dart';

import '../../models/property.dart';

class BindingRequestsController extends GetxController{

  List<Property> bindingProperties = <Property>[].obs;
  var isLoading = true.obs;

  List<dynamic> responsePropertiesList = <dynamic>[].obs;

  BindingRequestsService bindingRequestsService = BindingRequestsService();


  onInit(){
    fetchMyBindingRequests();
  }


  fetchMyBindingRequests() async{

    responsePropertiesList = await bindingRequestsService.fetchMyProperties();
    isLoading(true);

    if ( responsePropertiesList.isNotEmpty) {
      for (int i = 0; i <  responsePropertiesList.length; i++) {
        Property property = Property(
          floorNum:  responsePropertiesList[i]['numberFloor'],
          roomNum:  responsePropertiesList[i]['numberRoom'],
          size:  responsePropertiesList[i]['size'],
          price:  responsePropertiesList[i]['price'],
          constructionType:  responsePropertiesList[i]['constructionType'],
          address:  responsePropertiesList[i]['address'],
          constructionCondition:  responsePropertiesList[i]['constructionCondition'],
          bathRoomNum:  responsePropertiesList[i]['pathRoom'],
          detailedAddress: " ",
          propertyImg: null,
          contractImg: null,
        );

        property.image1 = responsePropertiesList[i]['image']; // a intial var for holding the property image
        property.image2 =  responsePropertiesList[i]['propertyImage']; // a intial var2 for holding the contract image

        property.image3 = responsePropertiesList[i]['image1'];
        property.image4 = responsePropertiesList[i]['image2'];
        property.image5 = responsePropertiesList[i]['image3'];
        property.image6 = responsePropertiesList[i]['image4'];


        property.propertyIdInUserProfile =  responsePropertiesList[i]['id'];
        property.propertyOwnerId =  responsePropertiesList[i]['user_id'];

        //property.offerDateText =  responsePropertiesList[i]['created_at'].toString().substring(0, 10);

        bindingProperties.add(property);
      }
    }
    isLoading(false);


  }




  void clearList(){
    for(int i = 0 ; i < bindingProperties.length ; i++)
    {
      bindingProperties.removeAt(i);
    }
  }



}