import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:real_estate/modules/home_page/faveorite_page/wish_list.dart';
import 'package:real_estate/modules/home_page/faveorite_page/wish_list_controller.dart';
import 'package:real_estate/modules/home_page/profile_page/profile.dart';
import 'package:real_estate/modules/home_page/profile_page/profile_controller.dart';
import 'package:real_estate/modules/home_page/profile_page/suggetion_page.dart';
import 'package:real_estate/modules/home_page/public_records/public_records.dart';
import 'package:real_estate/modules/home_page/public_records/public_records_controller.dart';
import 'package:real_estate/modules/home_page/public_transactions/public_transactions.dart';
import 'package:real_estate/modules/home_page/real_estate_home/real_estate_home.dart';
import 'package:real_estate/modules/home_page/real_estate_home/real_estate_home_controller.dart';

import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatelessWidget {
  static var currentIndex = 0.obs;

  List<Widget> navBarWidgets = [
    RealEstateHome(),
    WishList(),
     PublicRecords(),
    ProfilePage(),
  ];


  void addSuggestion(BuildContext context){

    showModalBottomSheet(context: context,
        builder: (_){

          return SuggestionPage();


        });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.grey[200],
        semanticLabel: 'Settings',
        elevation: 5,
        width: MediaQuery.of(context).size.width * 0.7,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.0 , horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/real-estate2.png',width: 280,height: 170,),
                ListTile(
                  leading: Icon(Icons.article_outlined,size: 28,),
                  title: Text(
                    'Binding requests',
                    style: TextStyle(fontSize: 16),
                    maxLines: 1,
                  ),
                  minLeadingWidth: 10,
                  onTap: () {
                    Get.toNamed('/propertiesBindingRequests');
                  },
                ),
                SizedBox(width: 300,
                  child: Divider(thickness: 1,),),
                ListTile(
                  leading: Icon(Icons.account_balance_wallet,size: 28,),
                  title: Text(
                    'Charge wallet',
                    style: TextStyle(fontSize: 16),
                    maxLines: 1,
                  ),
                  minLeadingWidth: 10,
                  onTap: () {
                   Get.toNamed('/chargeWallet');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.list,size: 28,),
                  title: Text(
                    'Charge Requests',
                    style: TextStyle(fontSize: 16),
                    maxLines: 1,
                  ),
                  minLeadingWidth: 10,
                  onTap: () {
                    Get.toNamed('/BindingChargeRequests');
                  },
                ),
                SizedBox(width: 300,
                child: Divider(thickness: 1,),),
                ListTile(
                  leading: Icon(Icons.account_balance_wallet_outlined,size: 28,),
                  title: Text(
                    'Withdraw',
                    style: TextStyle(fontSize: 16),
                    maxLines: 1,
                  ),
                  minLeadingWidth: 10,
                  onTap: () {
                     Get.toNamed('/emptyWallet');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.list_outlined,size: 28,),
                  title: Text(
                    'Withdraw Requests',
                    style: TextStyle(fontSize: 16),
                    maxLines: 1,
                  ),
                  minLeadingWidth: 10,
                  onTap: () {
                    Get.toNamed('/BindingEmptyRequests');
                  },
                ),
                SizedBox(width: 300,
                  child: Divider(thickness: 1,),),
                ListTile(
                                  leading: Icon(Icons.sell,size: 28,),
                                  title: Text(
                                    'Show transactions',
                                    style: TextStyle(fontSize: 16),
                                    maxLines: 1,
                                  ),
                                  minLeadingWidth: 10,
                                  onTap: () {
                                    Get.toNamed('/privateTransactions');
                                  },
                                ),
                SizedBox(height: 140,),

                Align(alignment: Alignment.bottomCenter,
                child:    Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('You have any suggestions? ',style: TextStyle(fontSize: 12,color: Colors.black),),
                    InkWell(child: Text('Click here',style: TextStyle(fontSize: 12,color: Colors.blue ),), onTap: ()=>addSuggestion(context),)
                  ],
                ),)

              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
       title: Text('Real Estate',style: TextStyle(fontSize: 18 ,fontFamily: 'Triforce'),),
      backgroundColor: Color.fromARGB(200, 0, 50, 79),
        actions: [
          IconButton(onPressed: (){
            Get.toNamed('/searchPage');
          },
              icon: Icon(Icons.search)),
          SizedBox(width: 5,)
        ],
      ),
      body: Obx(()=> navBarWidgets[currentIndex.value],),
      bottomNavigationBar: Obx((){
      return GNav(
         selectedIndex: currentIndex.value,
          onTabChange: (index){currentIndex.value = index;},
          tabs: [
            GButton(icon: Icons.home_outlined ,text: 'Home',textColor: Colors.white,onPressed: ()async{
              var tempController = Get.find<RealEstateHomeController>();
              tempController.clearList();
              tempController.fetchHomePageProperties();
              //print('nav bar tapped');
              },),
            GButton(icon: Icons.favorite_border,text:  'Favorite',textColor: Colors.white,onPressed: ()async{
              var tempController = Get.find<WishListController>();
              tempController.clearEntriesMap();
              await tempController.fetchPropertiesIds();
              tempController.clearList();
              tempController.getPropertiesCardsFromHomePage();
            },),
            GButton(icon: Icons.list_outlined,text: 'Transactions',textColor: Colors.white,onPressed: (){
              var tempController = Get.find<PublicRecordsController>();
              tempController.clearList();
              tempController.getPublicTransactions();
            },),
            GButton(icon: Icons.person_outlined,text: 'Profile',textColor: Colors.white,onPressed: (){
              var tempController = Get.find<ProfileController>();
              tempController.clearList();
              tempController.fetchMyProperties();
            },),

          ] ,
         // selected tab background color// navigation bar padding
       tabBackgroundGradient: LinearGradient(
           begin: Alignment.topLeft,
           end: Alignment.bottomRight,
           colors: [Color.fromARGB(220, 0, 50, 79) ,Color.fromARGB(200, 0, 50, 79),Colors.blueGrey[200]!]),
        rippleColor: Colors.grey[300]!,
        hoverColor: Colors.grey[100]!,
        gap: 8,
        activeColor: Colors.white,
        iconSize: 26,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        duration: Duration(milliseconds: 400),
        tabBackgroundColor: Colors.grey[100]!,
        color: Colors.black,
        tabMargin: EdgeInsets.symmetric(vertical: 5),
        backgroundColor: Colors.grey[100]!,
             );


    }
    ),
    );
  }
}
/*
 BottomNavigationBar(
        elevation: 5,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex.value,
        onTap: (index) {
          currentIndex.value = index;

        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.list), label: 'Requests'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      )
 */
//Colors.blue[300]!,Colors.blue[200]!,Colors.blue[100]!
//Color(0xFF0A0E21)