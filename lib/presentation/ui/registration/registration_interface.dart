import 'package:flutter/material.dart';

abstract class RegistrationViewModelInputs {
  setPhone(String phone);
  setPassword(String password);
  setPasswordConfirm(String password);
  setName(String name);
  setIsPasswordVisible();
  setIsPasswordConfirmVisible();
  setIsOtp();

  void registration(BuildContext context);

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

abstract class RegistrationViewModelOutputs {
  Stream<bool> get outputIsNameValid;
  Stream<String> get outputIsPasswordValid;
  Stream<String> get outputIsPhoneValid;
  Stream<bool> get outputIsPasswordVisible;
  Stream<String> get outputIsPasswordConfirmValid;
  Stream<bool> get outputIsPasswordConfirmVisible;
  Stream<bool> get outputIsAllInputsValid;
  Stream<bool> get outputIsOtp;
}