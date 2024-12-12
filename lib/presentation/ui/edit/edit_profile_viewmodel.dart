import 'package:abu_lafy/presentation/base/baseviewmodel.dart';




class EditProfileViewModel extends BaseViewModel  {
  @override
  void start() {
    // TODO: implement start
  }

//   /// --- Start --- ///
//   final StreamController _nameStreamController = StreamController<String>.broadcast();
//   final StreamController _passwordStreamController = StreamController<String>.broadcast();
//   final StreamController _passwordConfirmStreamController = StreamController<String>.broadcast();
//   final StreamController _phoneStreamController = StreamController<String>.broadcast();
//   final StreamController _isPasswordVisibleStreamController = StreamController<bool>.broadcast();
//   final StreamController _isPasswordConfirmVisibleStreamController = StreamController<bool>.broadcast();
//   final StreamController _isAllInputValidStreamController = StreamController<void>.broadcast();
//   final StreamController isUserLoggedInSuccessfullyStreamController = StreamController<String>();
//
//   final StreamController _isOtpStreamController = StreamController<bool>.broadcast();
//   ProfileObject ProfileObject = ProfileObject( name: '', password: '', passwordVisible: true, confirmPassword: '', confirmPasswordVisible: true, phone: '',isOtp: false);
//   final ProfileUseCase _useCase;
//   /// --- End --- ///
//
//
//   @override
//   ProfileViewModel(this._useCase);
//
//
//   @override
//   void start() {
//     inputState.add(ContentState());
//   }
//
//   @override
//   void dispose() {
//     _nameStreamController.close();
//     _phoneStreamController.close();
//     _passwordStreamController.close();
//     _passwordConfirmStreamController.close();
//     _isPasswordVisibleStreamController.close();
//     _isPasswordConfirmVisibleStreamController.close();
//     _isAllInputValidStreamController.close();
//   }
//
//
//   /// --- Start input --- ///
//   @override
//   Sink get inputName => _nameStreamController.sink;
//
//   @override
//   Sink get inputPassword => _passwordStreamController.sink;
//
//   @override
//   Sink get inputPasswordConfirm => _passwordConfirmStreamController.sink;
//
//   @override
//   Sink get inputPhone => _phoneStreamController.sink;
//
//   @override
//   Sink get inputIsPasswordVisible =>_isPasswordVisibleStreamController.sink;
//
//   @override
//   Sink get inputIsPasswordConfirmVisible => _isPasswordConfirmVisibleStreamController.sink;
//
//   @override
//   Sink get inputIsAllInputValid => _isAllInputValidStreamController.sink;
//
//   @override
//   Sink get inputIsOtp => _isOtpStreamController.sink;
//   /// --- End input --- ///
//
//
//
//   /// --- Start output --- ///
//   @override
//   Stream<bool> get outputIsNameValid => _nameStreamController.stream.map((text) => isTextEmpty(text));
//
//   @override
//   Stream<String> get outputIsPasswordValid => _passwordStreamController.stream.map((password) => isPasswordValid(password) ? '':'Must be 6 digit');
//
//   @override
//   Stream<String> get outputIsPasswordConfirmValid => _passwordConfirmStreamController.stream.map((password) => isPasswordValid(password)? '':'Must be 6 digit');
//
//   @override
//   Stream<String> get outputIsPhoneValid => _phoneStreamController.stream.map((phone) => isPhoneValid(removeFirstLetter(phone)) ?  '':'Enter a valid phone number',);
//
//   @override
//   Stream<bool> get outputIsPasswordVisible => _isPasswordVisibleStreamController.stream.map((visible) => visible);
//
//   @override
//   Stream<bool> get outputIsPasswordConfirmVisible => _isPasswordConfirmVisibleStreamController.stream.map((visible) => visible);
//
//   @override
//   Stream<bool> get outputIsAllInputsValid =>  _isAllInputValidStreamController.stream.map((_) => _isAllInputsValid());
//
//   @override
//   Stream<bool> get outputIsOtp => _isOtpStreamController.stream.map((value) => value);
//   /// --- End output --- ///
//
//
//
//   /// --- Start set data --- ///
//   @override
//   setName(String name) {
//     inputName.add(name);
//     ProfileObject = ProfileObject.copyWith(name: name);
//     _validate();
//   }
//
//   @override
//   setPassword(String password) {
//     inputPassword.add(password);
//     ProfileObject = ProfileObject.copyWith(password: password);
//     _validate();
//   }
//
//   @override
//   setPasswordConfirm(String password) {
//     inputPasswordConfirm.add(password);
//     ProfileObject = ProfileObject.copyWith(confirmPassword: password);
//     _validate();
//   }
//
//   @override
//   setIsPasswordVisible() {
//     ProfileObject = ProfileObject.copyWith(passwordVisible: !ProfileObject.passwordVisible);
//     inputIsPasswordVisible.add(ProfileObject.passwordVisible);
//   }
//
//   @override
//   setIsPasswordConfirmVisible() {
//     ProfileObject = ProfileObject.copyWith(confirmPasswordVisible: !ProfileObject.confirmPasswordVisible);
//     inputIsPasswordConfirmVisible.add(ProfileObject.confirmPasswordVisible);
//   }
//
//   @override
//   setPhone(String phone) {
//     inputPhone.add(removeFirstLetter(phone));
//     ProfileObject = ProfileObject.copyWith(phone: removeFirstLetter(phone));
//     _validate();
//   }
//
//   @override
//   setIsOtp() {
//     ProfileObject = ProfileObject.copyWith(isOtp: !ProfileObject.isOtp);
//     inputIsOtp.add(ProfileObject.isOtp);
//   }
//   /// --- End set data --- ///
//   _validate() {
//     inputIsAllInputValid.add(null);
//   }
//
//
//   bool _isAllInputsValid() {
//     return isPasswordValid(ProfileObject.password) && isPasswordValid(ProfileObject.confirmPassword) && isTextEmpty(ProfileObject.name) &&
//         isPhoneValid(ProfileObject.phone) && ProfileObject.password == ProfileObject.confirmPassword;
//   }
//
//   /// --- Start api --- ///
//   @override
//   void Profile(BuildContext context) async{
//     inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
//
//     (await _useCase.execute(
//         ProfileUseCaseInput(ProfileObject.name, ProfileObject.password,ProfileObject.phone))).fold(
//             (failure) => {
//           // left -> failure
//           // inputState.add(ErrorState(
//           //     StateRendererType.POPUP_ERROR_STATE, failure.message))
//           inputState.add(ContentState()),
//               getFailToast( "${failure.status}  ${failure.message}"),
//         }, (data) {
//       // right -> success (data)
//       // inputState.add(ContentState());
//       inputState.add(ContentState());
//       getSucessToast();
//       isUserLoggedInSuccessfullyStreamController.add("abcdefgh");
//
//     });
//   }
// /// --- End api --- ///
//
//




}