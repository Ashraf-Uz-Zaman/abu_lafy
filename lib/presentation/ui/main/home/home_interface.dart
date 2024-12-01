import 'package:abu_lafy/domain/model/post_model.dart';
import 'package:flutter/material.dart';

abstract class HomeViewModelInputs {
  setContentText(String content);
  setPassword(String password);
  setIsPasswordVisible();

  void home(BuildContext context);

  //two sinks for streams
  Sink get inputUserId;
  Sink<String> get inputContent;
  Sink get inputIsUserId;
  Sink get inputIsContent;
  Sink get inputIsImage;
}

abstract class HomeViewModelOutputs {
  Stream<bool> get outputIsUserId;
  Stream<bool> get outputIsContent;
  Stream<List<PostModel>> get outputListPostModel;
}