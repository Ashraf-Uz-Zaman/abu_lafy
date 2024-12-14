

import 'dart:async';

import 'package:abu_lafy/application/dependency_injection.dart';
import 'package:abu_lafy/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:abu_lafy/presentation/resources/assets_manager.dart';
import 'package:abu_lafy/presentation/resources/color_manager.dart';
import 'package:abu_lafy/presentation/resources/font_manager.dart';
import 'package:abu_lafy/presentation/resources/strings_manager.dart';
import 'package:abu_lafy/presentation/ui/common_widget/curve_textformfield_cw.dart';
import 'package:abu_lafy/presentation/ui/common_widget/otp/otp.dart';
import 'package:abu_lafy/presentation/ui/registration/registration_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  final RegistrationViewModel _viewModel = instance<RegistrationViewModel>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  _bind() {
    _viewModel.start();
    _nameController.addListener(() => _viewModel.setName(_nameController.text));
    _phoneController.addListener(() => _viewModel.setPhone(_phoneController.text));
    _passwordController.addListener(() => _viewModel.setPassword(_passwordController.text));
    _passwordConfirmController.addListener(
        () => _viewModel.setPasswordConfirm(_passwordConfirmController.text));

    _viewModel.isUserLoggedInSuccessfullyStreamController.stream
        .listen((token) {

      SchedulerBinding.instance.addPostFrameCallback((_) {
        resetModules();
        _startDelay();

      });
    });
  }

  Timer? _timer;


  _startDelay(){
    _timer = Timer( const Duration(seconds: 2),_goNext);
  }

  _goNext() {
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    _phoneController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SafeArea(child: StreamBuilder<FlowState>(
          stream: _viewModel.outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                    () {
                  // _viewModel.login(context);
                }) ??
                _getContentWidget();

          },
        )));
  }

   _getContentWidget() {
    return   StreamBuilder<bool>(
      stream: _viewModel.outputIsOtp,
      initialData: false,
      builder: (context, snapShotIsOtp) {
        return (snapShotIsOtp.data ?? false)
            ? OtpView(
          onSubmit: (String value) {
            _viewModel.setIsOtp();
            _viewModel.registration(context);
          },
        ) :_getScrollWidget();},
    );
  }

  Widget _getScrollWidget(){
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: 840.h,
          child:  Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Positioned(
                  top: 80.h,
                  left: 23.w,
                  child: Text(AppStrings.createAnAccount,
                      style: Theme.of(context).textTheme.displayLarge)),
              Positioned(
                  top: 263.h,
                  left: 24.w,
                  right: 24.w,
                  child: Column(
                    spacing: 8.h,
                    children: [
                      _getNameWidget(),
                      _getPasswordWidget(),
                      _getConfirmPasswordWidget(),
                      _getPhoneWidget(),
                      _getTermAndConditionWidget(),
                      SizedBox(height: 6.h,),
                      _getSubmitButton()
                    ],
                  )),


            ],
          ),
        ));
  }

  _getNameWidget(){
    return CurveTextFormFieldCW(
        controller: _nameController,
        inputType: TextInputType.phone,
        hints: AppStrings.username,
        errorText: '',
        prefixIcon: ImageAssets.icUser);
  }

  _getPasswordWidget(){
   return StreamBuilder<String>(
        stream: _viewModel.outputIsPasswordValid,
        initialData: '',
        builder: (context, snapShotValid) {
          return StreamBuilder<bool>(
              stream: _viewModel.outputIsPasswordVisible,
              initialData: true,
              builder: (context, snapShotVisible) {
                return CurveTextFormFieldCW(
                  controller: _passwordController,
                  inputType: TextInputType.visiblePassword,
                  hints: AppStrings.password,
                  prefixIcon: ImageAssets.icLock,
                  suffixIcon: ImageAssets.icEye,
                  errorText: snapShotValid.data ?? '',
                  obscureText: snapShotVisible.data ?? true,
                  onTap: () {
                    _viewModel.setIsPasswordVisible();
                  },
                );
              });
        });
  }

  _getConfirmPasswordWidget(){
    return StreamBuilder<String>(
        stream: _viewModel.outputIsPasswordConfirmValid,
        initialData: '',
        builder: (context, snapShotPassword) {
          return StreamBuilder<bool>(
              stream: _viewModel.outputIsPasswordConfirmVisible,
              initialData: true,
              builder: (context, snapShotVisible) {
                return CurveTextFormFieldCW(
                  controller: _passwordConfirmController,
                  inputType: TextInputType.visiblePassword,
                  hints: AppStrings.confirmPassword,
                  prefixIcon: ImageAssets.icLock,
                  suffixIcon: ImageAssets.icEye,
                  errorText: snapShotPassword.data ?? '',
                  obscureText: snapShotVisible.data ?? true,
                  onTap: () {
                    _viewModel.setIsPasswordConfirmVisible();
                  },
                );
              });
        });
  }

  _getPhoneWidget(){
    return StreamBuilder<String>(
        stream: _viewModel.outputIsPhoneValid,
        initialData: '',
        builder: (context, snapShotPhone) {
          return  CurveTextFormFieldCW(
              controller: _phoneController,
              errorText: snapShotPhone.data,
              inputType: TextInputType.phone,
              hints: AppStrings.mobileNumber,
              prefixIcon: ImageAssets.icPhone);

        });
  }

  _getTermAndConditionWidget(){
    return  RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: AppStrings.byCreate,
              style: TextStyle(
                  color: ColorManager.white,
                  fontSize: 14.5.sp,
                  fontFamily: FontConstants.fontFamily,
                  fontWeight: FontWeightManager.regular),
              children: <TextSpan>[
                TextSpan(
                  text: AppStrings.tAndC,
                  style: TextStyle(
                      color: ColorManager.amber,
                      fontSize: 14.5.sp,
                      fontFamily: FontConstants.fontFamily,
                      fontWeight: FontWeightManager.regular),
                ),
                TextSpan(
                  text: AppStrings.andAgree,
                  style: TextStyle(
                      color: ColorManager.white,
                      fontSize: 14.5.sp,
                      fontFamily: FontConstants.fontFamily,
                      fontWeight: FontWeightManager.regular),
                ),
                TextSpan(
                  text: AppStrings.pP,
                  style: TextStyle(
                      color: ColorManager.amber,
                      fontSize: 14.5.sp,
                      fontFamily: FontConstants.fontFamily,
                      fontWeight: FontWeightManager.regular),
                ),
              ],
            ));
  }

  _getSubmitButton(){
    return   StreamBuilder<bool>(
              stream: _viewModel.outputIsAllInputsValid,
              builder: (context, snapshot) {
                return IconButton(
                  onPressed: (snapshot.data ?? false)
                      ? () {
                    _viewModel.setIsOtp();
                  }
                      : null,
                  style: IconButton.styleFrom(
                    minimumSize: Size(90.w, 90.h),
                      backgroundColor: ColorManager.seaBuckthorn,),

                  icon: SvgPicture.asset(
                    ImageAssets.icArrowRight,
                    height: 37.h,
                    width: 37.w,
                  ),
                );
              },
    );
  }


}
