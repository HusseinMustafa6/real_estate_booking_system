



import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:real_estate/models/binding_charge_request.dart';
import 'package:real_estate/modules/binding_charge_requests/Binding_charge_requests_sevice.dart';

class BindingChargeRequestsController extends GetxController{


  List<ChargeRequest> bindingList = <ChargeRequest>[].obs;

  List<dynamic> responseList = <dynamic>[];


 BindingChargeRequestsService service = BindingChargeRequestsService();

 onInit(){
   getChargeRequests();
 }


 Future<void> getChargeRequests()async{

   responseList = await service.getChargeRequests();

   if(responseList.isNotEmpty){
    for(int i =0;i < responseList.length ; i++){
      ChargeRequest req = ChargeRequest(
        balance:  responseList[i]['balance'] ,
        image: responseList[i]['image']
      );

      bindingList.add(req);
    }
   }

 }



}