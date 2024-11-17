import 'dart:typed_data';

class LoginRequest {
  String phone;
  String password;
  String? fcmToken;
  String? deviceImei;
  String? deviceType;


  LoginRequest({required this.phone,required this.password, this.fcmToken, this.deviceImei, this.deviceType});
}
