import 'dart:async';
import 'package:abu_lafy/algo/algo.dart';
import 'package:abu_lafy/application/functions.dart';
import 'package:abu_lafy/domain/usecase/registration_usecase.dart';
import 'package:abu_lafy/presentation/common/state_renderer/state_renderer.dart';
import 'package:abu_lafy/presentation/resources/strings_manager.dart';
import 'package:abu_lafy/presentation/ui/common_widget/common.dart';
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

  final StreamController _isOtpStreamController = StreamController<bool>.broadcast();
  RegistrationObject registrationObject = RegistrationObject( name: '', password: '', passwordVisible: true, confirmPassword: '', confirmPasswordVisible: true, phone: '',isOtp: false);
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

  @override
  Sink get inputIsOtp => _isOtpStreamController.sink;
  /// --- End input --- ///



  /// --- Start output --- ///
  @override
  Stream<bool> get outputIsNameValid => _nameStreamController.stream.map((text) => isTextEmpty(text));

  @override
  Stream<String> get outputIsPasswordValid => _passwordStreamController.stream.map((password) => isPasswordValid(password) ? '':'Must be 6 digit');

  @override
  Stream<String> get outputIsPasswordConfirmValid => _passwordConfirmStreamController.stream.map((password) => isPasswordValid(password)? '':'Must be 6 digit');

  @override
  Stream<String> get outputIsPhoneValid => _phoneStreamController.stream.map((phone) => isPhoneValid(removeFirstLetter(phone)) ?  '':'Enter a valid phone number',);

  @override
  Stream<bool> get outputIsPasswordVisible => _isPasswordVisibleStreamController.stream.map((visible) => visible);

  @override
  Stream<bool> get outputIsPasswordConfirmVisible => _isPasswordConfirmVisibleStreamController.stream.map((visible) => visible);

  @override
  Stream<bool> get outputIsAllInputsValid =>  _isAllInputValidStreamController.stream.map((_) => _isAllInputsValid());

  @override
  Stream<bool> get outputIsOtp => _isOtpStreamController.stream.map((value) => value);
  /// --- End output --- ///



  /// --- Start set data --- ///
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
    registrationObject = registrationObject.copyWith(confirmPassword: password);
    _validate();
  }

  @override
  setIsPasswordVisible() {
    registrationObject = registrationObject.copyWith(passwordVisible: !registrationObject.passwordVisible);
    inputIsPasswordVisible.add(registrationObject.passwordVisible);
  }

  @override
  setIsPasswordConfirmVisible() {
    registrationObject = registrationObject.copyWith(confirmPasswordVisible: !registrationObject.confirmPasswordVisible);
    inputIsPasswordConfirmVisible.add(registrationObject.confirmPasswordVisible);
  }

  @override
  setPhone(String phone) {
    inputPhone.add(removeFirstLetter(phone));
    registrationObject = registrationObject.copyWith(phone: removeFirstLetter(phone));
    _validate();
  }

  @override
  setIsOtp() {
    registrationObject = registrationObject.copyWith(isOtp: !registrationObject.isOtp);
    inputIsOtp.add(registrationObject.isOtp);
  }
  /// --- End set data --- ///
  _validate() {
    inputIsAllInputValid.add(null);
  }


  bool _isAllInputsValid() {
    return isPasswordValid(registrationObject.password) && isPasswordValid(registrationObject.confirmPassword) && isTextEmpty(registrationObject.name) &&
        isPhoneValid(registrationObject.phone) && registrationObject.password == registrationObject.confirmPassword;
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
              getFailToast( "${failure.status}  ${failure.message}"),
        }, (data) {
      // right -> success (data)
      // inputState.add(ContentState());
      inputState.add(ContentState());
      getSucessToast();
      isUserLoggedInSuccessfullyStreamController.add("abcdefgh");

    });
  }
/// --- End api --- ///






}