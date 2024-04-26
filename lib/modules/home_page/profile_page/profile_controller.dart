

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:real_estate/models/property.dart';
import 'package:real_estate/modules/home_page/profile_page/profile_service.dart';

class ProfileController extends GetxController{


  var userName;
  var userEmail;
  var phoneNumber;
  var wallet;

  List<Property> userProperties = <Property>[].obs;
  var isLoading = true.obs;

  List<dynamic> propertiesList = <dynamic>[].obs ;

  ProfileService profileService = ProfileService();


  @override
  void onInit(){
    fetchMyProperties();

  }


  fetchMyProperties()async {
    propertiesList = await profileService.fetchMyProperties();
    isLoading(true);

    userName = profileService.userName ;
    userEmail = profileService.userEmail ;
    wallet = profileService.wallet;
    phoneNumber = profileService.phoneNumber;

    if (propertiesList.isNotEmpty) {
      for (int i = 0; i < propertiesList.length; i++) {
        Property property = Property(
          floorNum: propertiesList[i]['numberFloor'],
          roomNum: propertiesList[i]['numberRoom'],
          size: propertiesList[i]['size'],
          price: propertiesList[i]['price'],
          constructionType: propertiesList[i]['constructionType'],
          address: propertiesList[i]['address'],
          constructionCondition: propertiesList[i]['constructionCondition'],
          bathRoomNum: propertiesList[i]['pathRoom'],
          detailedAddress: " ",
          propertyImg: null,
          contractImg: null,
        );

        property.image1 = propertiesList[i]['image']; // a intial var for holding the property image
        property.image2 = propertiesList[i]['propertyImage']; // a intial var2 for holding the contract image

        property.image3 = propertiesList[i]['image1'];
        property.image4 = propertiesList[i]['image2'];
        property.image5 = propertiesList[i]['image3'];
        property.image6 = propertiesList[i]['image4'];


        property.propertyIdInUserProfile = propertiesList[i]['id'];
        property.propertyOwnerId = propertiesList[i]['user_id'];

         property.offerDateText = propertiesList[i]['created_at'].toString().substring(0, 10);

         property.newPrice = propertiesList[i]['newPrice'];

        userProperties.add(property);

        print('Binding Id');
        print(property.propertyIdInUserProfile );
      }
    }
    isLoading(false);

  }


  void clearList(){
     userProperties.clear();

  }




  }






