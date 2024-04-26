

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:real_estate/models/property.dart';
import 'package:real_estate/modules/home_page/real_estate_home/real_estate_home_controller_service.dart';

class RealEstateHomeController extends GetxController{



  List<Property> homeMainProperties = <Property>[].obs; //the main list of the app products
  var isLoading = true.obs;



  RealEstateHomeService realEstateHomeService = RealEstateHomeService();

  @override
  void onInit() {
    fetchHomePageProperties();
  }



 Future<void> fetchHomePageProperties() async {

    List<dynamic> propertiesList = await realEstateHomeService.getAllProperties(); //this list contains a group of maps
  if(propertiesList.isNotEmpty) {
    for (int i = 0; i < propertiesList.length; i++) {

      Property property = Property(
        floorNum: propertiesList[i]['property']['numberFloor'],
        roomNum: propertiesList[i]['property']['numberRoom'],
        size: propertiesList[i]['property']['size'] ,
        price: propertiesList[i]['property']['price'],
        constructionType: propertiesList[i]['property']['constructionType'],
        address: propertiesList[i]['property']['address'],
        constructionCondition: propertiesList[i]['property']['constructionCondition'] ,
        bathRoomNum: propertiesList[i]['property']['pathRoom'] ,
        detailedAddress: propertiesList[i]['property']['detiledAddress'],
        newPrice: propertiesList[i]['property']['newPrice'] ,
        propertyImg: null,
        contractImg: null,
      );

      property.image1 = propertiesList[i]['property']['image'];// a intial var for holding the property image
      property.image2 = propertiesList[i]['property']['propertyImage'];// a intial var2 for holding the contract image

      property.image3 = propertiesList[i]['property']['image1'];
      property.image4 = propertiesList[i]['property']['image2'];
      property.image5 = propertiesList[i]['property']['image3'];
      property.image6 = propertiesList[i]['property']['image4'];

      property.propertyIdInHomePage = propertiesList[i]['property']['id'];
      property.propertyOwnerId = propertiesList[i]['property']['user_id'];

      property.offerDateText =  propertiesList[i]['property']['created_at'].toString().substring(0,10);


      property.propertyAvgRating = propertiesList[i]['ratingsAverage'];
      property.propertyRatingCount = propertiesList[i]['ratingsCount'];

      homeMainProperties.add(property);
    }
  }
  isLoading(false);
  }

  void clearList(){
   homeMainProperties.clear();
  }

}