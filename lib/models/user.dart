class User{

  static var userId;
  String? fullname;
  String? email;
  String? password;
  String? passwordconfirm;
  var phoneNumber;


  static var user_token = '';

  User({
    this.fullname,
    this.email,
    this.password,
    this.passwordconfirm,
    this.phoneNumber
  });


}