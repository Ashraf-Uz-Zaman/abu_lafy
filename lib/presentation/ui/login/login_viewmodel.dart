import 'dart:async';
import 'package:abu_lafy/application/app_preferences.dart';
import 'package:abu_lafy/application/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:abu_lafy/algo/algo.dart';
import 'package:abu_lafy/application/functions.dart';
import 'package:abu_lafy/domain/usecase/login_usecase.dart';
import 'package:abu_lafy/presentation/base/baseviewmodel.dart';
import 'package:abu_lafy/presentation/common/freezed_data_classes.dart';
import 'package:abu_lafy/presentation/common/state_renderer/state_renderer.dart';
import 'package:abu_lafy/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:abu_lafy/presentation/ui/login/login_interface.dart';



class LoginViewModel extends BaseViewModel implements LoginViewModelInputs, LoginViewModelOutputs {

  /// --- Start --- ///
  final StreamController _phoneStreamController = StreamController<String>.broadcast();
  final StreamController _passwordStreamController = StreamController<String>.broadcast();
  final StreamController _isPasswordVisibleStreamController = StreamController<bool>.broadcast();
  final StreamController _isAllInputValidStreamController = StreamController<void>.broadcast();
  final StreamController isUserLoggedInSuccessfullyStreamController = StreamController<String>();
  final LoginUseCase _useCase;
  bool isPasswordVisible = true;
  LoginObject loginObject = LoginObject("", "","");
  final AppPreferences _appPreferences = instance<AppPreferences>();
  /// --- End --- ///


  /// --- Start Constructor --- ///
  LoginViewModel(this._useCase);
  /// --- End Constructor --- ///

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    _phoneStreamController.close();
    _passwordStreamController.close();
    _isPasswordVisibleStreamController.close();
    _isAllInputValidStreamController.close();
    isUserLoggedInSuccessfullyStreamController.close();
  }


  // Input
  @override
  Sink get inputPhone => _phoneStreamController.sink;

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputIsPasswordVisible => _isPasswordVisibleStreamController.sink;

  @override
  Sink get inputIsAllInputValid => _isAllInputValidStreamController.sink;


  // Output Stream
  @override
  Stream<bool> get outputIsPhoneValid => _phoneStreamController.stream
      .map((phone) => isPhoneValid(removeFirstLetter(phone)));

  @override
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream
      .map((password) => isPasswordValid(password));

  @override
  Stream<bool> get outputIsPasswordVisible =>
      _isPasswordVisibleStreamController.stream.map((visible) => isPasswordVisible);

  @override
  Stream<bool> get outputIsAllInputsValid =>
      _isAllInputValidStreamController.stream.map((_) => _isAllInputsValid());


  _validate() {
    inputIsAllInputValid.add(null);
  }


  bool _isAllInputsValid() {
    return isPasswordValid(loginObject.password) &&
        isPhoneValid(loginObject.phone);
  }


  /// --- Start set data --- ///
  @override
  setPhone(String phone) {
    inputPhone.add(removeFirstLetter(phone));
    loginObject = loginObject.copyWith(phone: removeFirstLetter(phone));
    _validate();
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
    _validate();
  }

  @override
  setIsPasswordVisible() {
    isPasswordVisible = !isPasswordVisible;
    inputIsPasswordVisible.add(isPasswordVisible);
  }
  /// --- End set data --- ///




  /// --- Start api --- ///
  @override
  login(BuildContext context) async {
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));

    (await _useCase.execute(
        LoginUseCaseInput(loginObject.phone, loginObject.password,"",""))).fold(
            (failure) => {
          // left -> failure
          // inputState.add(ErrorState(
          //     StateRendererType.POPUP_ERROR_STATE, failure.message))
          inputState.add(ContentState()),
        }, (data) {
      // right -> success (data)
      // inputState.add(ContentState());
      inputState.add(ContentState());
      _appPreferences.setUser(data);
      _appPreferences.setIsUserLoggedIn(true);
      isUserLoggedInSuccessfullyStreamController.add("abcdefgh");

    });
  }
  /// --- End api --- ///

}