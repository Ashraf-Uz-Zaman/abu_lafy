import 'package:flutter/material.dart';

abstract class ForgetViewModelInputs {
  setPhone(String phone);
  setPassword(String password);

  void forget(BuildContext context);

  //two sinks for streams
  Sink get inputPhone;
  Sink get inputPassword;
  Sink get inputIsAllInputValid;
}

abstract class ForgetViewModelOutputs {
  Stream<bool> get outputIsPhoneValid;
  Stream<bool> get outputIsPasswordValid;
  Stream<bool> get outputIsAllInputsValid;
}