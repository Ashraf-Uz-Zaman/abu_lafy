import 'package:flutter/material.dart';

abstract class EditProfileViewModelInputs {
  setPhone(String phone);
  setPassword(String password);
  setPasswordConfirm(String password);
  setName(String name);
  setIsPasswordVisible();
  setIsPasswordConfirmVisible();
  setIsOtp();

  void profile(BuildContext context);

  //two sinks for streams
  Sink get inputName;
  Sink get inputPhone;
  Sink get inputPassword;
  Sink get inputPasswordConfirm;
  Sink get inputIsPasswordConfirmVisible;
  Sink get inputIsPasswordVisible;
  Sink get inputIsAllInputValid;
  Sink get inputIsOtp;
}

abstract class EditProfileViewModelOutputs {
  Stream<bool> get outputIsNameValid;
  Stream<String> get outputIsPasswordValid;
  Stream<String> get outputIsPhoneValid;
  Stream<bool> get outputIsPasswordVisible;
  Stream<String> get outputIsPasswordConfirmValid;
  Stream<bool> get outputIsPasswordConfirmVisible;
  Stream<bool> get outputIsAllInputsValid;
  Stream<bool> get outputIsOtp;
}