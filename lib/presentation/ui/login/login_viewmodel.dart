import 'dart:async';

import 'package:abu_lafy/application/functions.dart';
import 'package:abu_lafy/presentation/base/baseviewmodel.dart';
import 'package:abu_lafy/presentation/common/freezed_data_classes.dart';
import 'package:abu_lafy/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:abu_lafy/presentation/ui/login/login_interface.dart';


class LoginViewModel extends BaseViewModel implements LoginViewModelInputs, LoginViewModelOutputs {

  final StreamController _phoneStreamController = StreamController<String>.broadcast();
  final StreamController _passwordStreamController = StreamController<String>.broadcast();
  final StreamController _isPasswordVisibleStreamController = StreamController<bool>.broadcast();
  final StreamController _isAllInputValidStreamController = StreamController<void>.broadcast();

  bool isPasswordVisible = true;

  var loginObject = LoginObject("", "","");



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


  // Set data
  @override
  setPhone(String phone) {
    inputPhone.add(phone);
    loginObject = loginObject.copyWith(phone: phone);
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


  // Output Stream
  @override
  Stream<bool> get outputIsPhoneValid => _phoneStreamController.stream
      .map((phone) => isPhoneValid(phone));

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


}