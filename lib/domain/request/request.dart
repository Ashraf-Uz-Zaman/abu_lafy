
class LoginRequest {
  String phone;
  String password;
  String fcmToken;
  String deviceImei;
  String deviceType;


  LoginRequest({required this.phone,required this.password, required this.fcmToken,required this.deviceImei,required this.deviceType});
}
