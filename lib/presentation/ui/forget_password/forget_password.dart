import 'dart:async';

import 'package:abu_lafy/application/dependency_injection.dart';
import 'package:abu_lafy/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:abu_lafy/presentation/resources/assets_manager.dart';
import 'package:abu_lafy/presentation/resources/color_manager.dart';
import 'package:abu_lafy/presentation/resources/font_manager.dart';
import 'package:abu_lafy/presentation/resources/strings_manager.dart';
import 'package:abu_lafy/presentation/ui/common_widget/curve_textformfield_cw.dart';
import 'package:abu_lafy/presentation/ui/common_widget/otp/otp.dart';
import 'package:abu_lafy/presentation/ui/forget_password/forget_password_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final ForgetViewModel _viewModel = instance<ForgetViewModel>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final List<TextEditingController> _controllers =
  List.generate(4, (_) => TextEditingController());

  _bind() {
    _viewModel.start();
    _phoneController
        .addListener(() => _viewModel.setPhone(_phoneController.text));
    _passwordController
        .addListener(() => _viewModel.setPassword(_passwordController.text));

    _viewModel.isUserLoggedInSuccessfullyStreamController.stream
        .listen((token) {
      // navigate to main screen

      SchedulerBinding.instance.addPostFrameCallback((_) {
        // _appPreferences.setUserToken(token);
        // _appPreferences.setIsUserLoggedIn();
        _passwordController.clear();
        _phoneController.clear();

        resetModules();


        //Navigator.of(context).pushReplacementNamed(Routes.mainRoute);
      });
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();

    for (int i = 0; i < 4; i++) {
      _controllers[i].dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return _getContentWidget();

    return Scaffold(
        backgroundColor: ColorManager.primary,
        body: StreamBuilder<FlowState>(
          stream: _viewModel.outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                    () {
                  // _viewModel.login(context);
                }) ??
                _getContentWidget();
          },
        ));
  }

  Widget _getContentWidget() {
    return StreamBuilder<bool>(
        stream: _viewModel.outputIsOtp,
        initialData: false,
        builder: (context, snapShotOtp) {
          return StreamBuilder<bool>(
            stream: _viewModel.outputIsVerified,
            initialData: false,
            builder: (context, snapShotView) {
              return (snapShotOtp.data ?? false)
                  ? OtpView(
                onSubmit: (String value) {
                  _viewModel.setIsVerified(true);
                  _viewModel.setIsOtp(false);
                },
              )
                  : Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Positioned(
                      top: 125.h,
                      left: 26.w,
                      child: Text(AppStrings.titleForgetPassword,
                          style:
                          Theme
                              .of(context)
                              .textTheme
                              .displayLarge)),
                  Positioned(
                      top: 238.h,
                      left: 24.w,
                      right: 24.w,
                      child: Text(
                        snapShotView.data ?? false
                            ? "Mobile no : ${_phoneController.text}"
                            : "",
                        style: TextStyle(
                            color: ColorManager.white,
                            fontSize: 14.sp,
                            fontFamily: FontConstants.fontFamily,
                            fontWeight: FontWeightManager.bold),
                      )),
                  Positioned(
                      top: 268.h,
                      left: 24.w,
                      right: 24.w,
                      child: snapShotView.data ?? false
                          ? CurveTextFormFieldCW(
                          controller: _passwordController,
                          inputType: TextInputType.phone,
                          hints: AppStrings.password,
                          prefixIcon: ImageAssets.icLock)
                          : CurveTextFormFieldCW(
                          controller: _phoneController,
                          inputType: TextInputType.phone,
                          hints: AppStrings.mobileNumber,
                          prefixIcon: ImageAssets.icPhone)),
                  Positioned(
                    top: 356.h,
                    left: 27.w,
                    child: Text(
                      AppStrings.weWillSent,
                      style: TextStyle(
                          color: ColorManager.white,
                          fontSize: 12.sp,
                          fontFamily: FontConstants.fontFamily,
                          fontWeight: FontWeightManager.light),
                    ),
                  ),
                  Positioned(
                      top: 428.h,
                      left: 24.w,
                      right: 28.w,
                      child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                snapShotView.data ?? false
                                    ? "Submit"
                                    : AppStrings.sentCode,
                                style: TextStyle(
                                    color: ColorManager.white,
                                    fontSize: 25.sp,
                                    fontFamily: FontConstants.fontFamily,
                                    fontWeight: FontWeightManager.bold)),
                            SizedBox(
                              width: 60.w,
                              height: 60.h,
                              child: snapShotView.data ?? false
                                  ? StreamBuilder<bool>(
                                  stream: _viewModel.outputIsAllInputsValid,
                                  initialData: false,
                                  builder: (context, snapShotOtp) {
                                    return IconButton(
                                        onPressed: (snapShotOtp.data ?? false)
                                            ? () {
                                          _viewModel.forget(context);
                                        }
                                            : () {
                                          print("fuck");
                                        },
                                        style: IconButton.styleFrom(
                                            backgroundColor:
                                            (snapShotOtp.data ?? false)
                                                ? ColorManager.orange_1
                                                : ColorManager.grey),
                                        icon: SvgPicture.asset(
                                          ImageAssets.icArrowRight,
                                          height: 26.h,
                                          width: 26.w,
                                        ));
                                  })
                                  : StreamBuilder<bool>(
                                  stream: _viewModel.outputIsPhoneValid,
                                  initialData: false,
                                  builder: (context, snapShotOtp) {
                                    return IconButton(
                                      onPressed: (snapShotOtp.data ?? false)
                                          ? () {
                                        _viewModel.setIsOtp(true);
                                        //  _viewModel.forget(context);
                                      }
                                          : () {
                                        //  _viewModel.forget(context);
                                      },
                                      style: IconButton.styleFrom(
                                          backgroundColor: (snapShotOtp.data ??
                                              false)
                                              ? ColorManager.orange_1
                                              : ColorManager.grey),
                                      icon: SvgPicture.asset(
                                        ImageAssets.icArrowRight,
                                        height: 26.h,
                                        width: 26.w,
                                      ),
                                    );
                                  }),
                            ),
                          ])),
                ],
              );
            },
          );
        });
  }

}


