


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:real_estate/modules/home_page/public_records/public_records_controller.dart';

import '../../../custom_widgets/public_transaction_card.dart';

class PublicRecords extends StatelessWidget {

  PublicRecordsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 15.0),
          child: Obx((){
            return ListView.builder(
                itemCount: controller.publicList.length ,
                itemBuilder: (context,index){
                  return PublicTransactionCard(
                      controller.publicList[index]
                  );
                });
          }),
        ));
  }
}
