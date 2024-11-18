import 'dart:io';

import 'package:abu_lafy/data/network/failure.dart';
import 'package:abu_lafy/domain/model/user_model.dart';
import 'package:abu_lafy/domain/repository/repository.dart';
import 'package:abu_lafy/domain/request/request.dart';
import 'package:abu_lafy/domain/usecase/base_usercase.dart';
import 'package:dartz/dartz.dart';
import 'package:device_info_plus/device_info_plus.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, UserDetailsModel> {
  final Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, UserDetailsModel>> execute(
      LoginUseCaseInput input) async {
    String deviceType = "";
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if(Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      deviceType = androidInfo.model;
    }else if(Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      deviceType = iosInfo.model;
    }
    return await _repository.login(LoginRequest(phone:input.phone,password: input.password, fcmToken: '', deviceImei: '', deviceType: deviceType));
  }
}

class LoginUseCaseInput {
  String phone;
  String password;
  String fcmToken;
  String deviceType;
  LoginUseCaseInput(this.phone, this.password, this.fcmToken, this.deviceType);
}
