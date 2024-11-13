import 'package:flutter/material.dart';

abstract class LoginViewModelInputs {
  setPhone(String phone);
  setPassword(String password);
  setIsPasswordVisible();

  //void login(BuildContext context);

  //two sinks for streams
  Sink get inputPhone;
  Sink get inputPassword;
  Sink get inputIsPasswordVisible;
  Sink get inputIsAllInputValid;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outputIsPhoneValid;
  Stream<bool> get outputIsPasswordValid;
  Stream<bool> get outputIsPasswordVisible;
  Stream<bool> get outputIsAllInputsValid;
}