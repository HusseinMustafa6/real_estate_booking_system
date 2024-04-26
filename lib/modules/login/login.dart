
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:real_estate/modules/login/login_controller.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/LoginPage2';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  LoginController _loginController = Get.find();

  Future<void> loginUser()async{
    EasyLoading.show(status: 'Loading...',dismissOnTap: true);
    bool loginStauts = await _loginController.loginUserController();

    if(loginStauts){
      EasyLoading.showSuccess('Done',duration: Duration(seconds: 2));
      Get.offAllNamed('/homePage');
    }else{
      EasyLoading.showError(_loginController.statusMsg.toString(),duration: Duration(seconds: 4));
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[


                        _title(),

                        SizedBox(
                          height: 50,
                        ),

                        _emailPasswordWidget(),

                        SizedBox(
                          height: 20,
                        ),


                        _submitButton(),

                        _createAccountLabel(),


                        SizedBox(height: 80,)




                      ],
                    ),
                  ),




                  Positioned(top: 40, left: 0, child: _backButton()),


                  Positioned(
                      top: -MediaQuery.of(context).size.height * .2,
                      right: -MediaQuery.of(context).size.width * .52,
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
              _loginController.password = value;
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
              _loginController.email = value;
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
          'Login',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      onTap: (){
        print(_loginController.email);
        print(_loginController.password);
        loginUser();
      },
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
              width: 20,

          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),

          Text('or'),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),

          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }


  Widget _facebookButton() {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: <Widget>[

          Expanded(
            flex: 1,
            child: Container(

              decoration: BoxDecoration(
                color: Color(0xff1959a9),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5)),
              ),
              alignment: Alignment.center,


              child: Text('f',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400)),
            ),
          ),


          Expanded(
            flex: 5,
            child: Container(

                decoration: BoxDecoration(
                  color: Color(0xff2872ba),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Text('Continue with Facebook',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),

            ),
          ),
        ],
      ),
    );
  }

  Widget _createAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Don\'t have an account? ',style: TextStyle(fontSize: 12,color: Colors.black),),
          InkWell(child: Text('Register',style: TextStyle(fontSize: 12,color: Colors.red ,fontWeight: FontWeight.bold ),), onTap: ()=>Get.toNamed('/register'),)
        ],
      ),

    );
  }


  Widget _title() {

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Login',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(220, 0, 50, 79),
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

    RxBool showText = true.obs;
    var t;
    return Column(
      children: <Widget>[

        _entryField("Email id","someone@email.com",t,showText: false.obs),

        _entryField("Password"," ",t,isPassword: true,showText: showText),
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
        angle: -pi / 3.5,
        child: ClipPath(

            clipper: ClipPainter(),


        child: Container(
          height: MediaQuery.of(context).size.height * .5,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color.fromARGB(220, 0, 50, 79),Colors.red[300]!])),
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