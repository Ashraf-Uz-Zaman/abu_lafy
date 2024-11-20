import 'package:flutter/material.dart';

abstract class RegistrationViewModelInputs {
  setPhone(String phone);
  setPassword(String password);
  setPasswordConfirm(String password);
  setName(String name);
  setIsPasswordVisible();
  setIsPasswordConfirmVisible();

  void registration(BuildContext context);

  //two sinks for streams
  Sink get inputPhone;
  Sink get inputPassword;
  Sink get inputPasswordConfirm;
  Sink get inputName;
  Sink get inputIsPasswordVisible;
  Sink get inputIsPasswordConfirmVisible;
  Sink get inputIsAllInputValid;
}

abstract class RegistrationViewModelOutputs {
  Stream<bool> get outputIsPhoneValid;
  Stream<bool> get outputIsPasswordValid;
  Stream<bool> get outputIsPasswordConfirmValid;
  Stream<bool> get outputIsNameValid;
  Stream<bool> get outputIsPasswordVisible;
  Stream<bool> get outputIsPasswordConfirmVisible;
  Stream<bool> get outputIsAllInputsValid;
}