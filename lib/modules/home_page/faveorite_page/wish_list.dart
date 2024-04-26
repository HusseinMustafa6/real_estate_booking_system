

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:real_estate/custom_widgets/property_favorite_card.dart';
import 'package:real_estate/modules/home_page/faveorite_page/wish_list_controller.dart';

class WishList extends StatelessWidget {

  WishListController wishListController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          child: Obx((){

            if(wishListController.likedProperties.isEmpty){
              return Center(
                child: Text('Nothing to display !'),
              );
            }else{
              return  ListView.builder(
                  itemCount: wishListController.likedProperties.length,
                  itemBuilder:(context , index){
                    return FavoritePropertyCard(wishListController.likedProperties[index]);
                  } );
            }



          })
        ) ,);
  }
}
