import 'dart:async';
import 'package:abu_lafy/application/app_preferences.dart';
import 'package:abu_lafy/application/dependency_injection.dart';
import 'package:abu_lafy/domain/model/post_model.dart';
import 'package:abu_lafy/domain/model/user_model.dart';
import 'package:abu_lafy/domain/usecase/home_usecase.dart';
import 'package:abu_lafy/presentation/ui/main/home/home_interface.dart';
import 'package:flutter/material.dart';

import 'package:abu_lafy/presentation/base/baseviewmodel.dart';
import 'package:abu_lafy/presentation/common/freezed_data_classes.dart';
import 'package:abu_lafy/presentation/common/state_renderer/state_renderer.dart';
import 'package:abu_lafy/presentation/common/state_renderer/state_renderer_impl.dart';

import 'main_interface.dart';



class MainViewModel extends BaseViewModel implements MainViewModelInputs, MainViewModelOutputs {

  final StreamController _userModelStreamController = StreamController<UserModel>.broadcast();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  UserModel userModel = UserModel();


  @override
  void start() {
    inputState.add(ContentState());
    user();
  }

  @override
  void dispose() {
    _userModelStreamController.close();
  }


  /// --- Start api --- ///
  @override
  main(BuildContext context) async {

  }

  @override
  void user() async{


    try{
      userModel =  await _appPreferences.getUser()  ;
      _userModelStreamController.add(userModel);
      print(userModel.image);
    }catch(e){
      print(e);
    }
  }









  @override
  // TODO: implement outputUserModel
  Stream<UserModel> get outputUserModel => _userModelStreamController.stream.map((value) => value);

  @override
  // TODO: implement inputUserModel
  Sink get inputUserModel => _userModelStreamController.sink;







}