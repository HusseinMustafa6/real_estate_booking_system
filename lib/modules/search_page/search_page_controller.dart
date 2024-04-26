

import 'package:get/get.dart';
import 'package:real_estate/modules/search_page/search_page_service.dart';

import '../../models/property.dart';




class SearchPageController extends GetxController{


  List<Property> searchResultProperties = <Property>[].obs; //the main list of the app products

  List<dynamic> responseList = <dynamic>[];


  SearchPageService searchPageService = SearchPageService();

  Future<bool> getSearchResult(String? selectedAddress) async{

     responseList = await searchPageService.getPropertiesByAddress(selectedAddress);
     if(responseList.isNotEmpty){
       for (int i = 0; i < responseList.length; i++) {
         Property property = Property(
           floorNum: responseList[i]['property']['numberFloor'],
           roomNum: responseList[i]['property']['numberRoom'],
           size: responseList[i]['property']['size'] ,
           price: responseList[i]['property']['price'],
           constructionType: responseList[i]['property']['constructionType'],
           address: responseList[i]['property']['address'],
           constructionCondition: responseList[i]['property']['constructionCondition'] ,
           bathRoomNum: responseList[i]['property']['pathRoom'] ,
           detailedAddress: responseList[i]['property']['detiledAddress'],
           propertyImg: null,
           contractImg: null,
         );

         property.image1 = responseList[i]['property']['image'];// a intial var for holding the property image
         property.image2 = responseList[i]['property']['propertyImage'];// a intial var2 for holding the contract image

         property.image3 = responseList[i]['property']['image1'];
         property.image4 = responseList[i]['property']['image2'];
         property.image5 = responseList[i]['property']['image3'];
         property.image6 = responseList[i]['property']['image4'];

         property.propertyIdInHomePage = responseList[i]['property']['id'];

         property.newPrice = responseList[i]['property']['newPrice'];

         searchResultProperties.add(property);
       }
       return true;
     }else{
       return false;
     }


  }

  Future<bool> getFilterResult(String? selectedFilter) async{

   responseList = await searchPageService.getPropertiesByFilter(selectedFilter);

   if(responseList.isNotEmpty){
     for (int i = 0; i < responseList.length; i++) {
       Property property = Property(
         floorNum: responseList[i]['property']['numberFloor'],
         roomNum: responseList[i]['property']['numberRoom'],
         size: responseList[i]['property']['size'] ,
         price: responseList[i]['property']['price'],
         constructionType: responseList[i]['property']['constructionType'],
         address: responseList[i]['property']['address'],
         constructionCondition: responseList[i]['property']['constructionCondition'] ,
         bathRoomNum: responseList[i]['property']['pathRoom'] ,
         detailedAddress: responseList[i]['property']['detiledAddress'],
         propertyImg: null,
         contractImg: null,
       );

       property.image1 = responseList[i]['property']['image'];// a intial var for holding the property image
       property.image2 = responseList[i]['property']['propertyImage'];// a intial var2 for holding the contract image

       property.image3 = responseList[i]['property']['image1'];
       property.image4 = responseList[i]['property']['image2'];
       property.image5 = responseList[i]['property']['image3'];
       property.image6 = responseList[i]['property']['image4'];

       property.newPrice = responseList[i]['property']['newPrice'];

       property.propertyIdInHomePage = responseList[i]['property']['id'];

       searchResultProperties.add(property);
     }
     return true;
   }else{


     return false;
   }

  }

  void clearList(){
   searchResultProperties.clear();
  }


}