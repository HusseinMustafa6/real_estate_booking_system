import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/getx_binding/login_binding.dart';
import 'package:real_estate/getx_binding/new_property_binding.dart';
import 'package:real_estate/getx_binding/public_records_bindings.dart';
import 'package:real_estate/getx_binding/public_transactions_binding.dart';
import 'package:real_estate/getx_binding/register_binding.dart';
import 'package:real_estate/getx_binding/wish_list_binding.dart';
import 'package:real_estate/modules/binding_empty_requests/binding_empty_requests.dart';
import 'package:real_estate/modules/home_page/faveorite_page/wish_list.dart';
import 'package:real_estate/modules/home_page/home_page.dart';
import 'package:real_estate/modules/login/login.dart';
import 'package:real_estate/modules/private_transactions/private_transactions.dart';
import 'package:real_estate/modules/welcome_page/welcome_page.dart';
import 'getx_binding/profile_binding.dart';
import 'getx_binding/properties_binding_requests_binding.dart';
import 'getx_binding/real_estate_home_binding.dart';
import 'getx_binding/search_page_binding.dart';
import 'modules/add_property/new_property.dart';
import 'modules/binding_charge_requests/BindingChargeRequests.dart';
import 'modules/charge_wallet/charge_wallet.dart';
import 'modules/empty_wallet/empty_wallet.dart';
import 'modules/realestate_binding_requests/properties_binding.dart';
import 'modules/register/register.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'modules/search_page/search_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/welcomePage',
      getPages: [
        GetPage(name:'/welcomePage', page: ()=> WelcomePage() ),
        GetPage(name:'/login', page: ()=> LoginPage() , binding: LoginBinding() ),
        GetPage(name:'/register', page: ()=> SignUpPage() , binding: RegisterBinding()),
        GetPage(name:'/homePage', page: ()=> HomePage() ,bindings: [ProfileBinding() , RealEstateHomeBinding() , WishListBinding(),PublicRecordsBinding()], ),
        GetPage(name:'/newProperty', page: ()=> NewProperty() , binding: NewPropertyBinding()),
        GetPage(name:'/propertiesBindingRequests', page: ()=> BindingRequests() , binding: BindingRequestsBinding()),
        GetPage(name:'/searchPage', page: ()=> SearchPage() ,binding: SearchPageBinding() ),
        GetPage(name:'/chargeWallet', page: ()=> ChargeWallet() ),
        GetPage(name:'/emptyWallet', page: ()=> EmptyWallet() ),
        GetPage(name:'/BindingChargeRequests', page: ()=> BindingChargeRequests() ),
        GetPage(name:'/BindingEmptyRequests', page: ()=> BindingEmptyRequests() ),
        GetPage(name:'/privateTransactions', page: ()=> PrivateTransactions() ),
      ],
      builder: EasyLoading.init(),
    );
  }
}
//BindingChargeRequests
//SearchPage
//BindingRequests //PublicTransactionsBinding()
//debugShowCheckedModeBanner: false,
//       home: WelcomePage(title: 'Real estate',),