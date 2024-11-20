import 'dart:async';
import 'package:abu_lafy/algo/algo.dart';
import 'package:abu_lafy/application/functions.dart';
import 'package:abu_lafy/domain/usecase/registration_usecase.dart';
import 'package:abu_lafy/presentation/common/state_renderer/state_renderer.dart';
import 'package:flutter/material.dart';
import 'package:abu_lafy/presentation/common/freezed_data_classes.dart';
import 'package:abu_lafy/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:abu_lafy/presentation/base/baseviewmodel.dart';
import 'package:abu_lafy/presentation/ui/registration/registration_interface.dart';



class RegistrationViewModel extends BaseViewModel implements RegistrationViewModelInputs, RegistrationViewModelOutputs {

  /// --- Start --- ///
  final StreamController _nameStreamController = StreamController<String>.broadcast();
  final StreamController _passwordStreamController = StreamController<String>.broadcast();
  final StreamController _passwordConfirmStreamController = StreamController<String>.broadcast();
  final StreamController _phoneStreamController = StreamController<String>.broadcast();
  final StreamController _isPasswordVisibleStreamController = StreamController<bool>.broadcast();
  final StreamController _isPasswordConfirmVisibleStreamController = StreamController<bool>.broadcast();
  final StreamController _isAllInputValidStreamController = StreamController<void>.broadcast();
  final StreamController isUserLoggedInSuccessfullyStreamController = StreamController<String>();
  RegistrationObject registrationObject = RegistrationObject("", "", "");
  bool isPasswordVisible = true;
  bool isPasswordConfirmVisible = true;
  final RegistrationUseCase _useCase;
  /// --- End --- ///


  @override
  RegistrationViewModel(this._useCase);


  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    _nameStreamController.close();
    _phoneStreamController.close();
    _passwordStreamController.close();
    _passwordConfirmStreamController.close();
    _isPasswordVisibleStreamController.close();
    _isPasswordConfirmVisibleStreamController.close();
    _isAllInputValidStreamController.close();
  }


  /// --- Start input --- ///
  @override
  Sink get inputName => _nameStreamController.sink;

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputPasswordConfirm => _passwordConfirmStreamController.sink;

  @override
  Sink get inputPhone => _phoneStreamController.sink;

  @override
  Sink get inputIsPasswordVisible =>_isPasswordVisibleStreamController.sink;

  @override
  Sink get inputIsPasswordConfirmVisible => _isPasswordConfirmVisibleStreamController.sink;

  @override
  Sink get inputIsAllInputValid => _isAllInputValidStreamController.sink;
  /// --- End input --- ///



  /// --- Start output --- ///
  @override
  Stream<bool> get outputIsNameValid => _nameStreamController.stream.map((text) => isTextEmpty(text));

  @override
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream.map((password) => isPasswordValid(password));

  @override
  Stream<bool> get outputIsPasswordConfirmValid => _passwordConfirmStreamController.stream.map((password) => isPasswordValid(password));

  @override
  Stream<bool> get outputIsPhoneValid => _phoneStreamController.stream.map((phone) => isPhoneValid(removeFirstLetter(phone)));

  @override
  Stream<bool> get outputIsPasswordVisible => _isPasswordVisibleStreamController.stream.map((visible) => isPasswordVisible);

  @override
  Stream<bool> get outputIsPasswordConfirmVisible => _isPasswordConfirmVisibleStreamController.stream.map((visible) => isPasswordConfirmVisible);

  @override
  Stream<bool> get outputIsAllInputsValid =>  _isAllInputValidStreamController.stream.map((_) => _isAllInputsValid());
  /// --- End output --- ///



  /// --- Start set data --- ///
  @override
  setIsPasswordVisible() {
    isPasswordVisible = !isPasswordVisible;
    inputIsPasswordVisible.add(isPasswordVisible);
  }

  @override
  setIsPasswordConfirmVisible() {
    isPasswordConfirmVisible = !isPasswordConfirmVisible;
    inputIsPasswordConfirmVisible.add(isPasswordConfirmVisible);
  }

  @override
  setName(String name) {
    inputName.add(name);
    registrationObject = registrationObject.copyWith(name: name);
    _validate();
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    registrationObject = registrationObject.copyWith(password: password);
    _validate();
  }

  @override
  setPasswordConfirm(String password) {
    inputPasswordConfirm.add(password);
    _validate();
  }

  @override
  setPhone(String phone) {
    inputPhone.add(removeFirstLetter(phone));
    registrationObject = registrationObject.copyWith(phone: removeFirstLetter(phone));
    _validate();
  }
  /// --- End set data --- ///
  _validate() {
    inputIsAllInputValid.add(null);
  }


  bool _isAllInputsValid() {
    return isPasswordValid(registrationObject.password) && isTextEmpty(registrationObject.name) &&
        isPhoneValid(registrationObject.phone);
  }

  /// --- Start api --- ///
  @override
  void registration(BuildContext context) async{
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));

    (await _useCase.execute(
        RegistrationUseCaseInput(registrationObject.name, registrationObject.password,registrationObject.phone))).fold(
            (failure) => {
          // left -> failure
          // inputState.add(ErrorState(
          //     StateRendererType.POPUP_ERROR_STATE, failure.message))
          inputState.add(ContentState()),
        }, (data) {
      // right -> success (data)
      // inputState.add(ContentState());
      inputState.add(ContentState());
      isUserLoggedInSuccessfullyStreamController.add("abcdefgh");

    });
  }
/// --- End api --- ///






}