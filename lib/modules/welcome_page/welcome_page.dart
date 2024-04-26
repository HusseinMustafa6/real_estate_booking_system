import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:real_estate/modules/login/login.dart';
import 'package:get/get.dart';
import '../register/register.dart';

const colorizeColors = [
  Color.fromARGB(220, 0, 50, 79),
  Colors.red,
  Colors.redAccent,
  Color.fromARGB(220, 0, 50, 79),

];

const colorizeTextStyle = TextStyle(
  fontSize: 40.0,
  fontFamily: 'Pushster',
);


class WelcomePage extends StatefulWidget {



  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
             color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
             ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/real-estate2.png',width: 300,height: 280,),
              SizedBox(
                width: 250.0,
                child: AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'Welcome',
                      textStyle: colorizeTextStyle,
                      colors: colorizeColors,
                      speed: Duration(milliseconds: 800),
                      textAlign: TextAlign.center,
                    ),
                  ],
                  isRepeatingAnimation: true,
                  repeatForever: true,

                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
              SizedBox(
                width: 250.0,
                child: AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'Real-Estate App',
                      textStyle: colorizeTextStyle,
                      colors: colorizeColors,
                      speed: Duration(milliseconds: 700),
                      textAlign: TextAlign.center,
                    ),
                  ],
                  isRepeatingAnimation: true,
                  repeatForever: true,

                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
              SizedBox(height: 120,),
              SizedBox(
                width: 250.0,
                child: DefaultTextStyle(
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.grey[800]
                  ),
                  child: AnimatedTextKit(
                    totalRepeatCount: 3,
                    animatedTexts: [
                      TypewriterAnimatedText('Sign up to get started',speed: Duration(milliseconds: 100) ,textAlign: TextAlign.center),
                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ) ,
              _signUpButton(),
              SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account? ',style: TextStyle(fontSize: 12,color: Colors.black),),
                  InkWell(child: Text('Login',style: TextStyle(fontSize: 12,color: Colors.blue ),), onTap: ()=>Get.toNamed('/login'),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }


  Widget _submitButton() {

    return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
        },
        child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
    padding: EdgeInsets.symmetric(vertical: 13),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.red.withAlpha(100),
                    offset: Offset(2, 4),
                    blurRadius: 8,
                    spreadRadius: 2)
              ],
              color: Colors.blue[200]),
          child: Text(
            'Sign In',
            style: TextStyle(fontSize: 20, color: Colors.white,fontFamily: 'Pushster',),
          ),
        ),
    );
  }


  Widget _signUpButton() {

    return Padding(
      padding:  EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Get.toNamed('/register');
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.75,
          padding: EdgeInsets.symmetric(vertical: 13),
          alignment: Alignment.center,


          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.red.withAlpha(100),
                    offset: Offset(2, 4),
                    blurRadius: 8,
                    spreadRadius: 2)
              ],
             gradient:  LinearGradient(
                 begin: Alignment.centerLeft,
                 end: Alignment.centerRight,
                 colors: [Color.fromARGB(220, 0, 50, 79), Colors.red[400]!])
              ),
          child: Text(
            'Sign Up',
            style: TextStyle(fontSize: 18, color: Colors.white ,fontFamily: 'Pushster',),
          ),
        ),
      ),
    );
  }




}
/*
SizedBox(
                width: 250.0,
                child: DefaultTextStyle(
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.grey[800]
                  ),
                  child: AnimatedTextKit(
                    totalRepeatCount: 3,
                    animatedTexts: [
                      TypewriterAnimatedText('Sign up to get started.',speed: Duration(milliseconds: 100) ,textAlign: TextAlign.center),
                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ) ,
 */

/*
 gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [ Colors.red,Colors.lightBlueAccent,])
 */