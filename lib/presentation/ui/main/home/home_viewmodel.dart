import 'dart:async';
import 'package:abu_lafy/domain/model/post_model.dart';
import 'package:abu_lafy/domain/usecase/home_usecase.dart';
import 'package:abu_lafy/presentation/ui/main/home/home_interface.dart';
import 'package:flutter/material.dart';

import 'package:abu_lafy/presentation/base/baseviewmodel.dart';
import 'package:abu_lafy/presentation/common/freezed_data_classes.dart';
import 'package:abu_lafy/presentation/common/state_renderer/state_renderer.dart';
import 'package:abu_lafy/presentation/common/state_renderer/state_renderer_impl.dart';



class HomeViewModel extends BaseViewModel implements HomeViewModelInputs, HomeViewModelOutputs {

  /// --- Start --- ///
  final StreamController _userStreamController = StreamController<int>.broadcast();
  final StreamController<String> _contentStreamController = StreamController<String>.broadcast();
  final StreamController _isUserStreamController = StreamController<bool>.broadcast();
  final StreamController _isContentStreamController = StreamController<bool>.broadcast();
  final StreamController _isImageStreamController = StreamController<bool>.broadcast();

  final StreamController _postModel = StreamController<List<PostModel>>.broadcast();

  final HomeUseCase _useCase;
  HomeObject object = HomeObject(0, "",false);

  /// --- End --- ///


  /// --- Start Constructor --- ///
  HomeViewModel(this._useCase);
  /// --- End Constructor --- ///

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {

  }





  // Output Stream







  //
  // bool _isAllInputsValid() {
  //   return isPasswordValid(loginObject.password) &&
  //       isPhoneValid(loginObject.phone);
  // }


  /// --- Start set data --- ///
  @override
  setContentText(String content) {
    inputContent.add(content);
    inputUserId.add(1);
    inputIsImage.add(false);
    object = object.copyWith(content: content,userId: 1,isImage: false);
  }

  @override
  setPassword(String password) {

  }

  @override
  setIsPasswordVisible() {

  }
  /// --- End set data --- ///




  /// --- Start api --- ///
  @override
  home(BuildContext context) async {
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));

    (await _useCase.execute(
        HomeUseCaseInput(object.userId, object.content,object.isImage))).fold(
            (failure) => {
          // left -> failure
          // inputState.add(ErrorState(
          //     StateRendererType.POPUP_ERROR_STATE, failure.message))
            print("UnSucess Fucking "),
          inputState.add(ContentState()),
        }, (data) {
      // right -> success (data)
      // inputState.add(ContentState());
      inputState.add(ContentState());
      _postModel.add(data);
      print("Sucess Fucking ");

    });
  }

  @override
  // TODO: implement outputIsContent
  Stream<bool> get outputIsContent => _userStreamController.stream
      .map((value) => value != 0);

  @override
  // TODO: implement outputIsUserId
  Stream<bool> get outputIsUserId => _contentStreamController.stream
      .map((password) => password.isNotEmpty);



  // Input

  @override
  // TODO: implement inputContent
  Sink<String> get inputContent => _contentStreamController.sink;

  @override
  // TODO: implement inputIsContent
  Sink get inputIsContent =>  _isContentStreamController.sink;

  @override
  // TODO: implement inputIsImage
  Sink get inputIsImage => _isImageStreamController.sink;

  @override
  // TODO: implement inputIsUserId
  Sink get inputIsUserId => _isUserStreamController.sink;

  @override
  // TODO: implement inputUserId
  Sink get inputUserId => _userStreamController.sink;

  @override
  // TODO: implement outputListPostModel
  Stream<List<PostModel>> get outputListPostModel => _postModel.stream
      .map((value) => value);


/// --- End api --- ///

}