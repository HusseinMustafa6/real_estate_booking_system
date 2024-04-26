


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:real_estate/modules/home_page/real_estate_home/real_estate_home_controller.dart';

import '../../../custom_widgets/property_home_page_card.dart';

class RealEstateHome extends StatelessWidget {

  RealEstateHomeController realEstateHomeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
     child: Padding(
       padding: EdgeInsets.symmetric(horizontal: 10.0 , vertical: 20.0),
       child:Obx(() {

         if(realEstateHomeController.isLoading.isTrue){
           return Center(
             child: CircularProgressIndicator(),
           );
         }else{
          return AlignedGridView.count(
            itemCount: realEstateHomeController.homeMainProperties.length,
            crossAxisSpacing: 12,
            mainAxisSpacing: 16,
            itemBuilder: (context, index) {
              return HomePagePropertyCard(
                  realEstateHomeController.homeMainProperties[index]);
            },
            crossAxisCount: 2,

          );
         }


       }),
     ),
    );
  }
}
