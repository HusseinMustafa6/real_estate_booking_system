


import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:real_estate/models/property.dart';
import 'package:real_estate/modules/home_page/faveorite_page/wish_list_service.dart';
import 'package:real_estate/modules/home_page/real_estate_home/real_estate_home_controller.dart';

class WishListController extends GetxController{


  List<Property> likedProperties = <Property>[].obs;
  Map<int,int> propertiesIdInWishList = <int,int>{};

  List<dynamic> responseList = <dynamic>[].obs;

   
   WishListService wishListService = WishListService();
  
  


  Future<void> fetchPropertiesIds() async{
     
     var responseList = await wishListService.fetchPropertiesFavorite();
     
     for(int i = 0 ; i < responseList.length ; i++){
       // in this map , the key is the actual property id , the values is the IDs in the wish list
        propertiesIdInWishList.putIfAbsent(responseList[i]['property_id'], () =>responseList[i]['id']);
     }
     print(propertiesIdInWishList);
  }

  void getPropertiesCardsFromHomePage() {
     var tempController = Get.find<RealEstateHomeController>();
     var currentKey;
     for(int i = 0 ; i < tempController.homeMainProperties.length ; i++){
         currentKey =tempController.homeMainProperties[i].propertyIdInHomePage;
       if(propertiesIdInWishList.containsKey(currentKey) ){
         //then this property is liked
         Property property = Property(
           floorNum: tempController.homeMainProperties[i].floorNum,
           roomNum: tempController.homeMainProperties[i].roomNum,
           bathRoomNum: tempController.homeMainProperties[i].bathRoomNum,
           constructionType: tempController.homeMainProperties[i].constructionType,
           constructionCondition: tempController.homeMainProperties[i].constructionCondition,
           address: tempController.homeMainProperties[i].address,
           price: tempController.homeMainProperties[i].price,
           size: tempController.homeMainProperties[i].price,
           newPrice: tempController.homeMainProperties[i].newPrice,
           detailedAddress: tempController.homeMainProperties[i].detailedAddress,
         );

         property.offerDateText =tempController.homeMainProperties[i].offerDateText;
         //property.propertyIdInHomePage = tempController.homeMainProperties[i].propertyIdInHomePage;
         property.image3 = tempController.homeMainProperties[i].image3;
         property.image4 = tempController.homeMainProperties[i].image4;
         property.image5 = tempController.homeMainProperties[i].image5;
         property.image6 = tempController.homeMainProperties[i].image6;
         property.propertyIdInWishList = propertiesIdInWishList[currentKey];
         print('wishList id ');
        print(property.propertyIdInWishList);
        likedProperties.add(property);
       }

     }

  }



  void clearList(){
    likedProperties.clear();
  }

  void clearEntriesMap(){

      propertiesIdInWishList.clear();

  }

}

/*

 */