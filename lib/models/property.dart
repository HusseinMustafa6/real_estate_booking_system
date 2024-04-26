

import 'dart:io';

import 'package:get/get.dart';

class Property{

  var propertyIdInHomePage;
  var propertyIdInUserProfile;
  var propertyIdInWishList;
  var propertyOwnerId;
  var offerDateText = '';

  var floorNum;
  var roomNum;
  var bathRoomNum;
  var size ;
  var price;
  var newPrice; //represent the actual price that will be displayed , it is include the profit
  var constructionType; // نوع البناء شقة منزل بيت عربي استوديو الخ
  var address;
  var detailedAddress;
  var constructionCondition;   // حالة البناء على العضم او جاهز
  File? propertyImg;
  File? contractImg;
  DateTime offerDate = DateTime.now();
  var isFavorite = false.obs;
  //the folloing is a temp vars , it will be changed later on the SDLC
  var image1 = '';//this var will hold the first image of this real estate
  var image2 = '';//this var will hold the contract image of this real estate


  File? image3File;
  File? image4File;
  File? image5File;
  File? image6File;

  var image3 = '';
  var image4 = '';
  var image5 = '';
  var image6 = '';


  var propertyAvgRating ;
  var propertyRatingCount;

  Property({
         this.floorNum ,
          this.roomNum ,
         this.bathRoomNum,
          this.size,
           this.price,
         this.newPrice,
          this.constructionCondition,
          this.constructionType,
           this.address ,
       this.detailedAddress,
           this.contractImg,
    this.propertyImg,
    this.image3File,
    this.image4File,
    this.image5File,
    this.image6File,
           });

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