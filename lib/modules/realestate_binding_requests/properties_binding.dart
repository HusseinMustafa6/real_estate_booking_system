


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:real_estate/modules/realestate_binding_requests/properties_binding_controller.dart';

import '../../custom_widgets/binding_property_card.dart';
import '../../custom_widgets/property_card.dart';

class BindingRequests extends StatelessWidget {

  BindingRequestsController bindingRequestsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(220, 0, 50, 79),
      child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 10.0),
            child: Column(
              children: [
                Align(alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back,color: Colors.white,),
                  onPressed: (){

                    Navigator.pop(context);
                  },
                ),

                   ),
                Expanded(
                  child: Obx((){
                    if(bindingRequestsController.isLoading.isTrue){
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }else {
                      return AlignedGridView.count(
                        itemCount: bindingRequestsController.bindingProperties.length,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        itemBuilder: (context, index) {
                          return BindingPropertyCard(
                              bindingRequestsController.bindingProperties[index]);
                        },
                        crossAxisCount: 1,

                      );
                    }

                  }),
                ),
              ],
            )
          )),
    );
  }
}

/*
 if(bindingRequestsController.isLoading.isTrue){
              return Center(
                child: CircularProgressIndicator(),
              );
            }else{
 */