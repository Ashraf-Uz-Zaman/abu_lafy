import 'package:abu_lafy/application/dependency_injection.dart';
import 'package:abu_lafy/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:abu_lafy/presentation/resources/assets_manager.dart';
import 'package:abu_lafy/presentation/resources/color_manager.dart';
import 'package:abu_lafy/presentation/resources/font_manager.dart';
import 'package:abu_lafy/presentation/resources/strings_manager.dart';
import 'package:abu_lafy/presentation/ui/common_widget/curve_textformfield_cw.dart';
import 'package:abu_lafy/presentation/ui/registration/registration_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  _RegistrationViewState createState() => _RegistrationViewState();
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
    _nameController
        .addListener(() => _viewModel.setName(_nameController.text));
    _phoneController
        .addListener(() => _viewModel.setPhone(_phoneController.text));
    _passwordController
        .addListener(() => _viewModel.setPassword(_passwordController.text));
    _passwordConfirmController.addListener(
        () => _viewModel.setPassword(_passwordConfirmController.text));;

    _viewModel.isUserLoggedInSuccessfullyStreamController.stream
        .listen((token) {
      // navigate to main screen
      SchedulerBinding.instance.addPostFrameCallback((_) {
        // _appPreferences.setUserToken(token);
        // _appPreferences.setIsUserLoggedIn();
        resetModules();
         Navigator.of(context).pop();
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
    return SafeArea(
        child: CustomScrollView(slivers: [
      SliverFillRemaining(
        hasScrollBody: true,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
                top: 88.h,
                left: 23.w,
                child: Text(AppStrings.createAnAccount,
                    style: Theme.of(context).textTheme.displayLarge)),
            Positioned(
                top: 271.h,
                left: 24.w,
                right: 24.w,
                child: CurveTextFormFieldCW(
                    controller: _nameController,
                    inputType: TextInputType.phone,
                    hints: AppStrings.username,
                    prefixIcon: ImageAssets.icUser)),
            Positioned(
                top: 359.h,
                left: 24.w,
                right: 24.w,
                child: StreamBuilder<bool>(
                    stream: _viewModel.outputIsPasswordValid,
                    initialData: true,
                    builder: (context, snapShotPassword) {
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
                              errorText: snapShotPassword.data ?? true
                                  ? null
                                  : "Must be 6 digit",
                              obscureText: snapShotVisible.data ?? true,
                              onTap: () {
                                _viewModel.setIsPasswordVisible();
                              },
                            );
                          });
                    })),
            Positioned(
                top: 457.h,
                left: 24.w,
                right: 24.w,
                child: StreamBuilder<bool>(
                    stream: _viewModel.outputIsPasswordConfirmValid,
                    initialData: true,
                    builder: (context, snapShotPassword) {
                      return StreamBuilder<bool>(
                          stream: _viewModel.outputIsPasswordConfirmVisible,
                          initialData: true,
                          builder: (context, snapShotVisible) {
                            return CurveTextFormFieldCW(
                              controller: _passwordConfirmController,
                              inputType: TextInputType.visiblePassword,
                              hints: AppStrings.password,
                              prefixIcon: ImageAssets.icLock,
                              suffixIcon: ImageAssets.icEye,
                              errorText: snapShotPassword.data ?? true
                                  ? null
                                  : "Must be 6 digit",
                              obscureText: snapShotVisible.data ?? true,
                              onTap: () {
                                _viewModel.setIsPasswordConfirmVisible();
                              },
                            );
                          });
                    })),
            Positioned(
                top: 555.h,
                left: 24.w,
                right: 24.w,
                child: CurveTextFormFieldCW(
                    controller: _phoneController,
                    inputType: TextInputType.phone,
                    hints: AppStrings.mobileNumber,
                    prefixIcon: ImageAssets.icPhone)),
            Positioned(
                top: 653.h,
                left: 0,
                right: 0,
                child: Center(
                    child: RichText(
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
                                  color: ColorManager.orange_1,
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
                                  color: ColorManager.orange_1,
                                  fontSize: 14.5.sp,
                                  fontFamily: FontConstants.fontFamily,
                                  fontWeight: FontWeightManager.regular),
                            ),
                          ],
                        )))),
            Positioned(
              top: 713.h,
              left: 0,
              right: 0,
              child: Center(
                child: SizedBox(
                    width: 90.w,
                    height: 90.h,
                    child: StreamBuilder<bool>(
                        stream: _viewModel.outputIsAllInputsValid,
                        builder: (context, snapshot) {
                          return IconButton(
                            onPressed: (snapshot.data ?? false)
                                ? () {
                                    //enable
                                    _viewModel.registration(context);
                                  }
                                : () {
                                    //disable
                                  },
                            style: IconButton.styleFrom(
                                backgroundColor: (snapshot.data ?? false)
                                    ? ColorManager.orange_1
                                    : ColorManager.grey1),
                            icon: SvgPicture.asset(
                              ImageAssets.icArrowRight,
                              height: 37.h,
                              width: 37.w,
                            ),
                          );
                        })),
              ),
            ),
          ],
        ),
      )
    ]));
  }
}
