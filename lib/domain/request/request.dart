
class LoginRequest {
  String phone;
  String password;
  String fcmToken;
  String deviceType;


  LoginRequest({required this.phone,required this.password, required this.fcmToken, required this.deviceType});
}

class RegistrationRequest {
  String name;
  String password;
  String phone;


  RegistrationRequest({required this.name,required this.password, required this.phone});
}


class ForgotRequest {
  String phone;
  String password;



  ForgotRequest({required this.phone,required this.password});
}

class HomeRequest {
  int user_id;
  String content;
  bool is_image;



  HomeRequest({required this.user_id,required this.content,required this.is_image});
}