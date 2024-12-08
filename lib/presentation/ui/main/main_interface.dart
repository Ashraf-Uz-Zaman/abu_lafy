import 'package:abu_lafy/domain/model/post_model.dart';
import 'package:abu_lafy/domain/model/user_model.dart';
import 'package:flutter/material.dart';

abstract class MainViewModelInputs {


  void main(BuildContext context);

  void user();

  //two sinks for streams
  Sink get inputUserModel;
}

abstract class MainViewModelOutputs {

  Stream<UserModel> get outputUserModel;
}