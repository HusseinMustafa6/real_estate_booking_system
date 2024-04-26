import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:real_estate/custom_widgets/property_card.dart';
import 'package:real_estate/models/property.dart';
import 'package:get/get.dart';
import 'package:real_estate/modules/home_page/profile_page/profile_controller.dart';
import 'package:real_estate/modules/home_page/profile_page/suggetion_page.dart';
class ProfilePage extends StatelessWidget {

  ProfileController profileController = Get.find();

  List<Property> myProperties =[
    Property(floorNum: 1,roomNum: 4,constructionType:'House',price: 9999),
    Property(floorNum: 1,roomNum: 2,constructionType:'Flat',price: 4000),
    Property(floorNum: 3,roomNum: 8,constructionType:'Mansion',price: 100000),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children:[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 ListTile(leading: Icon(Icons.person,color: Color.fromARGB(200, 0, 50, 79),),title: Text(profileController.userName.toString(),style: TextStyle(fontWeight: FontWeight.bold),),minLeadingWidth: 3,),
                  ListTile(leading: Icon(Icons.email,color: Color.fromARGB(200, 0, 50, 79),),title: Text(profileController.userEmail.toString(),style: TextStyle(fontWeight: FontWeight.bold)),minLeadingWidth: 3,minVerticalPadding: 2,),
                  ListTile(leading: Icon(Icons.screenshot_outlined,color: Color.fromARGB(200, 0, 50, 79),),title: Text(profileController.phoneNumber.toString(),style: TextStyle(fontWeight: FontWeight.bold)),minLeadingWidth: 3,minVerticalPadding: 2,),
                  ListTile(leading: Icon(Icons.wallet,color: Color.fromARGB(200, 0, 50, 79),),title: Text('\$ ${profileController.wallet.toString()}',style: TextStyle(fontWeight: FontWeight.bold)),minLeadingWidth: 3,),
                ],
              ),

              SizedBox(height: 3,),
              Row(
                children: [
                  Text(
                    'Your Properites',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[600]),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                      width: 200,
                      child: Divider(
                        thickness: 1,
                        color: Colors.black54,
                      ))
                ],
              ),
              SizedBox(height: 6,),
              Expanded(
                flex: 3,
                child: Obx(() {
                  if(profileController.isLoading.isTrue){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }else{
                    if(profileController.userProperties.isEmpty){
                      return Center(child: Text('Nothing to Display!'),);
                    }else {
                      return AlignedGridView.count(
                        itemCount: profileController.userProperties.length,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        itemBuilder: (context, index) {
                          return PropertyCard(
                              profileController.userProperties[index]);
                        },
                        crossAxisCount: 2,

                      );
                    }
                  }
                }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: Colors.white30, width: 2),
        ),
        //backgroundColor: Colors.black54,
        splashColor: Colors.lightBlueAccent,
        onPressed: () {
          //profileController.fetchMyProperties();
         Get.toNamed('/newProperty');
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color.fromARGB(220, 0, 50, 79) ,Colors.blueGrey[200]!]),),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Icon(
                Icons.add_home,
                semanticLabel: "add property",
                color: Colors.white,
                size: 30,
              ),

            ],
          ),
        ),
      ),
    );
  }
}

/*
LinearGradient(
           begin: Alignment.topLeft,
           end: Alignment.bottomRight,
           colors: [ Colors.blue[300]!,Colors.blue[200]!,Colors.blue[100]!]),
 */