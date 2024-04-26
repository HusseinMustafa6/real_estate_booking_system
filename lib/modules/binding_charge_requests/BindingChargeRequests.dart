

 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:real_estate/custom_widgets/binding_charge_request_card.dart';
import 'package:real_estate/modules/binding_charge_requests/Binding_charge_requests_controller.dart';

class BindingChargeRequests  extends StatelessWidget {

   BindingChargeRequestsController ctr =  Get.put(BindingChargeRequestsController());

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
                      if(ctr.bindingList.isEmpty){
                        return Center(
                          child: Text('Nothing to display !',style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18 ,color: Colors.white),),
                        );
                      }else {
                        return AlignedGridView.count(
                          itemCount: ctr.bindingList.length,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          itemBuilder: (context, index) {
                            return BindingChargeRequestCard(
                                ctr.bindingList[index]);
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
