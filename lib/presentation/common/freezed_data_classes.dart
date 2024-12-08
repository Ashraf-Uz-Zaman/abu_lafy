import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_data_classes.freezed.dart';

@freezed
class LoginObject with _$LoginObject {
  factory LoginObject(String phone, String password, String fcmToken) = _LoginObject;
}

@freezed
class RegistrationObject with _$RegistrationObject {
  factory RegistrationObject({required String name,required String password,required String confirmPassword,required bool passwordVisible,required bool confirmPasswordVisible,required String phone,required bool isOtp}) = _RegistrationObject;
}

@freezed
class ForgetObject with _$ForgetObject {
  factory ForgetObject(String phone, String password) = _ForgetObject;
}

@freezed
class HomeObject with _$HomeObject {
  factory HomeObject(int userId, String content, bool isImage) = _HomeObject;
}