import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_data_classes.freezed.dart';

@freezed
class LoginObject with _$LoginObject {
  factory LoginObject(String phone, String password, String fcmToken) = _LoginObject;
}

@freezed
class RegistrationObject with _$RegistrationObject {
  factory RegistrationObject(String name, String password, String phone) = _RegistrationObject;
}

@freezed
class ForgetObject with _$ForgetObject {
  factory ForgetObject(String phone, String password) = _ForgetObject;
}