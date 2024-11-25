import 'package:flutter/material.dart';

abstract class ForgetViewModelInputs {
  setPhone(String phone);
  setPassword(String password);
  setIsOtp(bool value);
  setIsVerified(bool value);


  void forget(BuildContext context);

  //two sinks for streams
  Sink get inputPhone;
  Sink get inputPassword;
  Sink get inputIsOtp;
  Sink get inputIsVerified;
  Sink get inputIsAllInputValid;

}

abstract class ForgetViewModelOutputs {
  Stream<bool> get outputIsPhoneValid;
  Stream<bool> get outputIsPasswordValid;
  Stream<bool> get outputIsVerified;
  Stream<bool> get outputIsOtp;
  Stream<bool> get outputIsAllInputsValid;

}