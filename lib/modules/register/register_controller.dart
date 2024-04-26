

import 'package:get/get.dart';
import 'package:real_estate/models/user.dart';
import 'package:real_estate/modules/register/register_service.dart';

class RegisterController extends GetxController{

  var fullName;
  var email;
  var password;
  var passwordConfirmation;
  var phoneNumber;

  bool status = false;


  var msg;
  var errors;

  RegisterService registerService = RegisterService();

  Future<bool> registerUserController()async{

    User user = User(
      fullname: fullName,
      email: email,
      password: password,
      passwordconfirm: passwordConfirmation,
      phoneNumber: phoneNumber,
    );

    status = await registerService.registerUserService(user);

    msg = registerService.msg;
    errors = registerService.errors;

   return status;
  }


}