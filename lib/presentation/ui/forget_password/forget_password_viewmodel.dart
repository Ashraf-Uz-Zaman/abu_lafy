
import 'dart:async';

import 'package:abu_lafy/algo/algo.dart';
import 'package:abu_lafy/application/functions.dart';
import 'package:abu_lafy/domain/usecase/forget_usecase.dart';
import 'package:abu_lafy/presentation/base/baseviewmodel.dart';
import 'package:abu_lafy/presentation/common/freezed_data_classes.dart';
import 'package:abu_lafy/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:abu_lafy/presentation/ui/forget_password/forget_password_interface.dart';
import 'package:flutter/src/widgets/framework.dart';

class ForgetViewModel extends BaseViewModel implements ForgetViewModelInputs, ForgetViewModelOutputs {

  /// --- Start --- ///
  final StreamController _phoneStreamController = StreamController<String>.broadcast();
  final StreamController _passwordStreamController = StreamController<String>.broadcast();
  final StreamController _isAllInputValidStreamController = StreamController<void>.broadcast();
  final StreamController isUserLoggedInSuccessfullyStreamController = StreamController<String>();
  final ForgetUseCase _useCase;
  bool isPasswordVisible = true;
  ForgetObject _object = ForgetObject("", "");
  /// --- End --- ///


  /// --- Start Constructor --- ///
  ForgetViewModel(this._useCase);
  /// --- End Constructor --- ///

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    _phoneStreamController.close();
    _passwordStreamController.close();
    _isAllInputValidStreamController.close();
  }


  /// --- Start Input --- ///
  @override
  Sink get inputPhone => _phoneStreamController.sink;

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputIsAllInputValid => _isAllInputValidStreamController.sink;
  /// --- End Input --- ///


  /// --- Start Output --- ///
  @override
  Stream<bool> get outputIsPhoneValid => _phoneStreamController.stream
      .map((phone) => isPhoneValid(removeFirstLetter(phone)));

  @override
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream
      .map((password) => isPasswordValid(password));

  @override
  Stream<bool> get outputIsAllInputsValid =>
      _isAllInputValidStreamController.stream.map((_) => _isAllInputsValid());
  /// --- End Output --- ///


  /// --- Start Validation --- ///
  void _validate() {
    inputIsAllInputValid.add(null);
  }

  bool _isAllInputsValid() {
    return isPasswordValid(_object.password) &&
        isPhoneValid(_object.phone);
  }
  /// --- End Validation --- ///

  /// --- Start set data --- ///
  @override
  setPhone(String phone) {
    inputPhone.add(removeFirstLetter(phone));
    _object = _object.copyWith(phone: removeFirstLetter(phone));
    _validate();
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    _object = _object.copyWith(password: password);
    _validate();
  }
  /// --- End set data --- ///




  /// --- Start api --- ///
  @override
  void forget(BuildContext context) async {
    // inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    //
    // (await _useCase.execute(
    //     LoginUseCaseInput(loginObject.phone, loginObject.password,"",""))).fold(
    //         (failure) => {
    //       // left -> failure
    //       // inputState.add(ErrorState(
    //       //     StateRendererType.POPUP_ERROR_STATE, failure.message))
    //       inputState.add(ContentState()),
    //     }, (data) {
    //   // right -> success (data)
    //   // inputState.add(ContentState());
    //   inputState.add(ContentState());
    //   isUserLoggedInSuccessfullyStreamController.add("abcdefgh");
    //
    // });
  }
  /// --- End api --- ///

}