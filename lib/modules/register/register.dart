

import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:real_estate/modules/register/register_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../login/login.dart';


class SignUpPage extends StatefulWidget {

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {


  RegisterController _registerController = Get.find();

  Future<void> registerUser()async{
    EasyLoading.show(status: 'Loading...',dismissOnTap: true);
    bool isRegistered = await _registerController.registerUserController();
    
    if(isRegistered){
      EasyLoading.showSuccess('SIGN UP Done',duration: Duration(seconds: 2));
      Get.offAllNamed('/login');
    }else{
        var email = _registerController.errors['email'][0];
        var phone = _registerController.errors['phoneNumber'][0];
        EasyLoading.showError(_registerController.msg.toString() + email.toString() + phone.toString(),duration: Duration(seconds: 4));
    }
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: ListView(

                      children: <Widget>[

                        SizedBox(
                          height: 75,
                        ),
                        _title(),

                        SizedBox(
                          height:30,
                        ),
                        _emailPasswordWidget(),

                        SizedBox(
                          height: 20,
                        ),

                        _submitButton(),
                        Align(alignment: Alignment.bottomCenter,
                          child: _loginAccountLabel(),
                        ),

                      ],
                    ),
                  ),


                  Positioned(top: 40, left: 0, child: _backButton()),


                  Positioned(
                      top: -MediaQuery.of(context).size.height * .16,
                      right: -MediaQuery.of(context).size.width * .57,
                      child: BezierContainer())


                ],
              ),
            )));
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Get.offAllNamed('/welcomePage');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))


          ],
        ),
      ),
    );
  }


  Widget _entryField(String title,String hint,var inputHolder ,{bool isPassword = false ,required RxBool showText}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),

          SizedBox(
            height: 10,
          ),

          isPassword ? Obx(()=> TextField(
            onChanged: (value){
              if(title == "Password"){
                _registerController.password = value;
              }

              if(title == "Password Confirmation"){
                _registerController.passwordConfirmation = value;
              }

            },
            obscureText: showText.value,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(fontSize: 14,color: Colors.grey[500]),
              border: InputBorder.none,
              fillColor: Color(0xfff3f3f4),
              filled: true,
              suffixIcon: IconButton(onPressed: (){
                showText.value = !showText.value;
              }, icon:Icon(showText.value ? Icons.visibility_off:Icons.visibility),splashRadius: 15,),
            ),))
              :TextField(
            onChanged: (value){
              if(title == "User Name"){
                _registerController.fullName =value;
              }
              if(title == "Email id"){
                _registerController.email = value;
              }
              if(title == "Phone Number"){
                 _registerController.phoneNumber = value;
              }

            },
            obscureText: isPassword,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(fontSize: 14,color: Colors.grey[500]),
              border: InputBorder.none,
              fillColor: Color(0xfff3f3f4),
              filled: true,
            ),

          ),

        ],
      ),
    );
  }


  Widget _submitButton() {
    return GestureDetector(
      onTap: (){

        if(_registerController.fullName.toString().length < 1){
          EasyLoading.showError('user name filed is required !',duration: Duration(seconds: 4));
          return;
        }
        if(_registerController.email.toString().length < 1){
          EasyLoading.showError('email id filed is required !',duration: Duration(seconds: 4));
          return;
        }

        if(_registerController.password.toString().length < 8){
          EasyLoading.showError('password filed should be at least 8 character !',duration: Duration(seconds: 4));
          return;
        }
        if(_registerController.password != _registerController.passwordConfirmation){
          EasyLoading.showError('password and password confirmation filed does not match !',duration: Duration(seconds: 4));
          return;
        }

        registerUser();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],

            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color.fromARGB(220, 0, 50, 79), Colors.red[400]!])),

        child: Text(
          'Register Now',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _loginAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical:10),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Already have an account? ',style: TextStyle(fontSize: 12,color: Colors.black),),
          InkWell(child: Text('Login',style: TextStyle(fontSize: 12,color: Colors.red ,fontWeight: FontWeight.bold),), onTap: ()=>Get.toNamed('/login'),)
        ],
      ),
    );
  }

  Widget _title() {

    return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
    text: 'Sign Up',
    style: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    color:Color.fromARGB(220, 0, 50, 79),
    ),
    children: [

    TextSpan(
    text: ' ',
    style: TextStyle(color: Colors.red, fontSize: 30),
    ),
    ]),
    );
  }


  Widget _emailPasswordWidget() {

    RxBool showPassword = true.obs;
    RxBool showPasswordConfirmation = true.obs;
    return Column(
      children: <Widget>[
        _entryField("User Name","Enter user name",_registerController.fullName,showText: false.obs),
        _entryField("Email id","someone@email.com",_registerController.email,showText: false.obs),
        _entryField("Phone Number","",_registerController.phoneNumber,showText: false.obs),
        _entryField("Password","",_registerController.password,isPassword: true,showText: showPassword),
        _entryField("Password Confirmation","",_registerController.passwordConfirmation,isPassword: true,showText: showPasswordConfirmation),
      ],
    );
  }
}



class BezierContainer extends StatelessWidget {
  const BezierContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

        child: Transform.rotate(
          angle: -pi / 3.9,
          child: ClipPath(
            clipper: ClipPainter(),

            child: Container(
              height: MediaQuery.of(context).size.height * .5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color.fromARGB(220, 0, 50, 79), Colors.red[300]!])),
            ),
          ),
        ));
  }
}

class ClipPainter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var height = size.height;
    var width = size.width;
    var path = new Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width, height);
    path.lineTo(size.width, 0);

    /// [Top Left corner]
    var secondControlPoint = Offset(0, 0);
    var secondEndPoint = Offset(width * .2, height * .3);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    /// [Left Middle]
    var fifthControlPoint = Offset(width * .3, height * .5);
    var fiftEndPoint = Offset(width * .23, height * .6);
    path.quadraticBezierTo(fifthControlPoint.dx, fifthControlPoint.dy,
    fiftEndPoint.dx, fiftEndPoint.dy);

    /// [Bottom Left corner]
    var thirdControlPoint = Offset(0, height);
    var thirdEndPoint = Offset(width, height);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
    thirdEndPoint.dx, thirdEndPoint.dy);

    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {

    return true;
  }
}