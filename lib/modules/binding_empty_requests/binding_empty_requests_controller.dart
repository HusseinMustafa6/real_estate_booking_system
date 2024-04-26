

import 'package:get/get.dart';
import 'package:real_estate/models/binding_empty_request.dart';
import 'package:real_estate/modules/binding_charge_requests/Binding_charge_requests_sevice.dart';
import 'package:real_estate/modules/binding_empty_requests/binding_empty_requests_service.dart';

class BindingEmptyRequestsController extends GetxController{


  List<EmptyRequest> bindingList = <EmptyRequest>[].obs;

  List<dynamic> responseList = <dynamic>[];


   BindingEmptyRequestsService service = BindingEmptyRequestsService();

   onInit(){
     getEmptyRequests();
   }


  Future<void> getEmptyRequests()async{

    responseList = await service.getEmptyRequests();

    if(responseList.isNotEmpty){
      for(int i =0;i < responseList.length ; i++){
        EmptyRequest req = EmptyRequest(
            balance:  responseList[i]['balance'] ,
            fullName: responseList[i]['name'],
            address: responseList[i]['address'],
            phone: responseList[i]['number']
        );

        bindingList.add(req);
      }
    }





  }



}