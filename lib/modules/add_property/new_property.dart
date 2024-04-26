
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_estate/custom_widgets/custom_button.dart';
import 'package:real_estate/models/property.dart';
import 'package:real_estate/modules/add_property/new_property_controller.dart';
import 'package:get/get.dart';
import 'package:real_estate/modules/home_page/home_page.dart';

import '../home_page/profile_page/profile_controller.dart';
/////////
List <DropdownMenuItem<String>> availableTypes = [
   DropdownMenuItem(
       value: 'Flat',
       child: Text('Flat',style: TextStyle(fontSize: 20),)),
  DropdownMenuItem(
      value: 'Farm',
      child: Text('Farm',style: TextStyle(fontSize: 20),)),
  DropdownMenuItem(
      value: 'House',
      child: Text('House',style: TextStyle(fontSize: 20),)),
  DropdownMenuItem(
      value: 'Mansion',
      child: Text('Mansion',style: TextStyle(fontSize: 20),)),
  DropdownMenuItem(
      value: 'Building',
      child: Text('Building',style: TextStyle(fontSize: 20),)),

];

List <DropdownMenuItem<String>>  adresses = [
  DropdownMenuItem(
      value: 'Alzahera',
      child: Text('Alzahera',style: TextStyle(fontSize: 20),)),
  DropdownMenuItem(
      value: 'Malkie',
      child: Text('Malkie',style: TextStyle(fontSize: 20),)),
  DropdownMenuItem(
      value: 'AshAloror',
      child: Text('AshAloror',style: TextStyle(fontSize: 20),)),
  DropdownMenuItem(
      value: 'Jarmana',
      child: Text('Jarmana',style: TextStyle(fontSize: 20),)),
  DropdownMenuItem(
      value: 'Msaken',
      child: Text('Msaken',style: TextStyle(fontSize: 20),)),
  DropdownMenuItem(
      value: 'Almezha',
      child: Text('Almezha',style: TextStyle(fontSize: 20),)),
  DropdownMenuItem(
      value: 'Almidan',
      child: Text('Almidan',style: TextStyle(fontSize: 20),)),
  DropdownMenuItem(
      value: 'Mahjrien',
      child: Text('Mahjrien',style: TextStyle(fontSize: 20),)),
  DropdownMenuItem(
      value: 'Domar',
      child: Text('Domar',style: TextStyle(fontSize: 20),)),
  DropdownMenuItem(
      value: 'Alhmara',
      child: Text('Alhmara',style: TextStyle(fontSize: 20),)),
  DropdownMenuItem(
      value: 'Other',
      child: Text('Other',style: TextStyle(fontSize: 20),)),



  ];


class NewProperty extends StatefulWidget {





  @override
  State<NewProperty> createState() => _NewPropertyState();
}

class _NewPropertyState extends State<NewProperty> {

  String? constructionType;
  String? address;


  int imageCounter = 0;


  NewPropertyController newPropertyController = Get.find();


  Future<void> addRealEstateToDataBase(Property property)async{

    EasyLoading.show(status: 'Loading...',dismissOnTap: true);

     bool temp = await newPropertyController.addRealEstateToDataBaseController(property);

     if(temp){
       EasyLoading.showSuccess(newPropertyController.succesMsg,duration: Duration(seconds: 2));
       //var temp = Get.find<ProfileController>();
       //temp.userProperties.add(property);

       HomePage.currentIndex.value = 3;
       Get.toNamed('/homePage');
     }else{
       EasyLoading.showError('Something Went Wrong :(' ,duration: Duration(seconds: 3));
     }

  }

  Future pickImage(ImageSource source ) async {
    try {
      final image = await ImagePicker().pickImage(
          source: source); //selected image will be stored here
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        if(newPropertyController.contractImg == null){
          newPropertyController.contractImg = imageTemporary;
        }else if(newPropertyController.propertyImg== null){
          newPropertyController.propertyImg = imageTemporary;
        }else if(newPropertyController.image3File== null){
          newPropertyController.image3File = imageTemporary;
        }else if(newPropertyController.image4File== null){
          newPropertyController.image4File = imageTemporary;
        }else if(newPropertyController.image5File== null){
          newPropertyController.image5File = imageTemporary;
        }else if(newPropertyController.image6File== null){
          newPropertyController.image6File = imageTemporary;
        }
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blueGrey[300]! , Colors.blueGrey[200]! , Colors.blueGrey[100]!])),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical:20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                    SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            newPropertyController.floorNum=value;
                          },
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black45, width: 2),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              labelText: "Floor number",
                              labelStyle: TextStyle(fontSize: 18,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold)


                          ),
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.number,

                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                           newPropertyController.roomNum = value;
                          },
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black45, width: 2),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              labelText: "Room number",
                              labelStyle: TextStyle(fontSize: 18,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold)


                          ),
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.number,

                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            newPropertyController.size = value;
                            print(value);
                          },
                          cursorColor: Colors.white,
                          decoration: InputDecoration(

                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black45, width: 2),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              labelText: "Size ",
                              labelStyle: TextStyle(fontSize: 18,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold)


                          ),
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.number,

                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            newPropertyController.price = value;
                          },
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black45, width: 2),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              labelText: "Price ",
                              labelStyle: TextStyle(fontSize: 18,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold)


                          ),
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.number,

                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    maxLines: 3,
                    onChanged: (value) {
                       newPropertyController.constructionCondition = value;
                    },
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black45, width: 2),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        labelText: "Description & Notes",
                        labelStyle: TextStyle(fontSize: 18,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold)


                    ),
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.text,

                  ),
                  SizedBox(height: 10,),
                  TextField(
                    onChanged: (value) {
                      newPropertyController.bathRoomNum = value;
                    },
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black45, width: 2),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        labelText: "Bathroom Number",
                        labelStyle: TextStyle(fontSize: 18,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold)


                    ),
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.number,

                  ),
                  SizedBox(height: 10,),
                  TextField(
                    onChanged: (value) {
                      newPropertyController.detailedAddress = value;
                    },
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black45, width: 2),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        labelText: "Detailed address",
                        labelStyle: TextStyle(fontSize: 18,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold)


                    ),
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.text,

                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Expanded(
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black45,
                                        width: 2),
                                    borderRadius: BorderRadius.circular(10)
                                )),
                            hint: Text('Address', style: TextStyle(fontSize: 20,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),),
                            onChanged: (item) {
                              setState(() {
                                newPropertyController.address = item;
                                address = item;
                              });
                            },
                            value: address,
                            items: adresses,
                          )),
                      SizedBox(width: 10,),
                      Expanded(
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black45,
                                        width: 2),
                                    borderRadius: BorderRadius.circular(10)
                                )),
                            hint: Text('Type', style: TextStyle(fontSize: 20,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),),
                            onChanged: (item) {
                              setState(() {
                                newPropertyController.constructionType = item;
                                constructionType = item;

                              });
                            },
                            value: constructionType,
                            items: availableTypes,
                          )),
                    ],
                  ) ,
                  SizedBox(height: 10,),
                  Text('Upload 6 images about your own property , the first 2 is the contract and the ID , the last 4 is the property images ,place the images in ORDER.',
                    maxLines: 3,
                    style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5,),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: FlatButton(
                            onPressed: ()async {

                          await pickImage(ImageSource.gallery );
                           imageCounter++;
                        },
                            color: Colors.blue[300],
                            child: Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.3,
                              child: Row(
                                children: [
                                  Icon(Icons.photo),
                                  SizedBox(width: 10,),
                                  Text('Pick gallery', style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold),)
                                ],
                              ),
                            )
                        ),
                      ),
                      SizedBox(width: 30,),
                      Expanded(
                        child: FlatButton(onPressed: () async{
                          await pickImage(ImageSource.camera);
                              imageCounter++;
                        },
                            color: Colors.blue[300],
                            child: Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.3,
                              child: Row(
                                children: [
                                  Icon(Icons.camera),
                                  SizedBox(width: 10,),
                                  Text('Pick camera', style: TextStyle(fontSize: 14,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold),)
                                ],
                              ),
                            )
                        ),
                      ),

                    ],

                  ),

                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      newPropertyController.contractImg != null
                          ? Stack(
                        children: [
                          Container(
                              height: 160,
                              width: 100,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Image.file(newPropertyController.contractImg!)),
                          Positioned(
                            top: -14,
                            left: -8,
                            child: Container(
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.close ),
                                  onPressed: (){
                                    setState(() {
                                      newPropertyController.contractImg = null;

                                    });

                                  },
                                )
                            ),
                          )
                        ],
                      )
                          : Text(''),
                      SizedBox(width: 8,),
                      newPropertyController.propertyImg != null
                          ? Stack(
                        children: [
                          Container(
                              height: 160,
                              width: 120,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Image.file(newPropertyController.propertyImg!)),
                          Positioned(
                            top: -14,
                            left: -8,
                            child: Container(
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.close ),
                                  onPressed: (){
                                    setState(() {
                                      newPropertyController.propertyImg =null;
                                    });

                                  },
                                )
                            ),
                          )
                        ],
                      )
                          : Text(''),
                      SizedBox(width: 8,),
                      newPropertyController.image3File != null
                          ? Stack(
                        children: [
                          Container(
                              height: 160,
                              width:120,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Image.file(newPropertyController.image3File!)),
                          Positioned(
                            top: -14,
                            left: -8,
                            child: Container(
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.close ),
                                  onPressed: (){
                                    setState(() {
                                      newPropertyController.image3File = null;
                                    });

                                  },
                                )
                            ),
                          )
                        ],
                      )
                          : Text(''),
                    ],
                  ),
                    SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      newPropertyController.image4File != null
                          ? Expanded(
                            child: Stack(
                        children: [
                            Container(
                              height: 160,
                              width: 120,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Image.file(newPropertyController.image4File!)),
                          Positioned(
                            top: -14,
                            left: -8,
                            child: Container(
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.close ),
                                  onPressed: (){
                                    setState(() {
                                      newPropertyController.image4File = null;
                                    });
                                  },
                                )
                            ),
                          )
                               ],
                      ),
                          )
                          : Text(''),
                      SizedBox(width: 8,),
                      newPropertyController.image5File != null
                          ? Expanded(
                            child: Stack(
                        children: [
                            Container(
                                width: 120,
                                height: 160,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Image.file(newPropertyController.image5File!)),
                            Positioned(
                              top: -14,
                              left: -8,
                              child: Container(
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: IconButton(
                                    icon: Icon(Icons.close ),
                                    onPressed: (){
                                     setState(() {
                                       newPropertyController.image5File = null;
                                     });
                                    },
                                  )
                              ),
                            )
                        ],
                      ),
                          )
                          : Text(''),
                      SizedBox(width: 8,),
                      newPropertyController.image6File != null
                          ? Expanded(
                            child: Stack(
                        children: [
                            Container(
                                height: 160,
                                width: 120,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Image.file(newPropertyController.image6File!)),
                            Positioned(
                              top: -14,
                              left: -8,
                              child: Container(
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: IconButton(
                                    icon: Icon(Icons.close ,),
                                    onPressed: (){
                                    setState(() {
                                      newPropertyController.image6File = null;
                                    });
                                    },
                                  )
                              ),
                            )
                        ],
                      ),
                          )
                          : Text(''),
                    ],
                  ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(buttonColor: Colors.green[300], onPressed: (){
                            //print(newPropertyController);

                            Property newOne =
                            Property(
                                floorNum: newPropertyController.floorNum,
                                roomNum: newPropertyController.roomNum,
                                bathRoomNum: newPropertyController.bathRoomNum,
                                size: newPropertyController.size,
                                price: newPropertyController.price,
                                constructionType: newPropertyController.constructionType,
                                address: newPropertyController.address,
                                detailedAddress: newPropertyController.detailedAddress,
                                constructionCondition: newPropertyController.constructionCondition,
                                contractImg: newPropertyController.contractImg,
                                propertyImg: newPropertyController.propertyImg,
                                image3File: newPropertyController.image3File,
                                image4File: newPropertyController.image4File,
                                image5File: newPropertyController.image5File,
                                image6File: newPropertyController.image6File
                            );
                            if(newPropertyController.floorNum == null ||
                                newPropertyController.roomNum == null ||
                                newPropertyController.bathRoomNum == null ||
                                newPropertyController.size == null ||
                                newPropertyController.price == null ||
                                newPropertyController.constructionType == null ||
                                newPropertyController.detailedAddress == null ||
                                newPropertyController.address == null ||
                                newPropertyController.constructionCondition == null ||
                                newPropertyController.contractImg == null ||
                                newPropertyController.propertyImg == null ||
                                newPropertyController.image3File == null ||
                                newPropertyController.image4File == null ||
                                newPropertyController.image5File == null ||
                                newPropertyController.image6File == null
                            )
                            {
                              EasyLoading.showError('All fields are required !',duration: Duration(seconds: 3));
                            }else{
                              addRealEstateToDataBase(newOne);
                              newPropertyController.contractImg = null;
                              newPropertyController.propertyImg = null;
                              newPropertyController.image3File = null;
                              newPropertyController.image4File = null;
                              newPropertyController.image5File = null;
                              newPropertyController.image6File = null;

                            }



                          }
                              , buttonText:'Submit'),
                        ),
                         SizedBox(width: 20,),
                        Expanded(
                          child: CustomButton(buttonColor: Colors.red[300], onPressed: (){
                            Navigator.pop(context);
                          }, buttonText: 'Back'),
                        )
                      ],
                    )


                ],
              ),
            ),
          ),
        ),
    ));
  }
}

/*

 */


// Image.file( newPropertyController.image4File!, width: 120, height: 160,)

/*
switch(imageCounter){
          case 0:
            newPropertyController.contractImg = imageTemporary;
            break;
          case 1:
            newPropertyController.propertyImg = imageTemporary;
            break;
          case 2:
            newPropertyController.image3File = imageTemporary;
            break;
          case 3:
            newPropertyController.image4File = imageTemporary;
            break;
          case 4:
            newPropertyController.image5File = imageTemporary;
            break;
          case 5:
            newPropertyController.image6File = imageTemporary;
            break;
        }
 */