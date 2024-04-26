

import 'package:get/get.dart';
import 'package:real_estate/modules/login/login_service.dart';

import '../../models/user.dart';

class LoginController extends GetxController{


  var email = '';
  var password = '';
  var statusMsg; // this var will contain the info of the error msg if exists.

  bool status = false; //variable represent the requst status if it done or not.

  LoginService _loginService = LoginService();

  Future<bool> loginUserController()async{

    User user = User(
      email: email,
      password: password,
    );
    status = await _loginService.loginUserService(user);
    statusMsg = _loginService.statusMsg;

    return status;
  }


}
