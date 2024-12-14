import 'package:abu_lafy/application/dependency_injection.dart';
import 'package:abu_lafy/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:abu_lafy/presentation/resources/assets_manager.dart';
import 'package:abu_lafy/presentation/resources/color_manager.dart';
import 'package:abu_lafy/presentation/resources/font_manager.dart';
import 'package:abu_lafy/presentation/resources/routes_manager.dart';
import 'package:abu_lafy/presentation/resources/strings_manager.dart';
import 'package:abu_lafy/presentation/resources/styles_manager.dart';
import 'package:abu_lafy/presentation/resources/values_manager.dart';
import 'package:abu_lafy/presentation/ui/common_widget/curve_textformfield_cw.dart';
import 'package:abu_lafy/presentation/ui/common_widget/social_login_cw.dart';
import 'package:abu_lafy/presentation/ui/login/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _viewModel = instance<LoginViewModel>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // final _formKey = GlobalKey<FormState>();

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
        resetModules();

         Navigator.of(context).pushReplacementNamed(Routes.mainRoute);
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
    // return _getContentWidget();
    return Scaffold(
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
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Positioned(
          top: AppSize.h186,
          left: AppSize.w23,
          child: Text(AppStrings.welcome,
              style: Theme.of(context).textTheme.displayLarge),
        ),
        Positioned(
          top: AppSize.h271,
          left: AppSize.w24,
          right: AppSize.w24,
          child: StreamBuilder<bool>(
              stream: _viewModel.outputIsPhoneValid,
              initialData: true,
              builder: (context, snapShotPhone) {
                return CurveTextFormFieldCW(
                    controller: _phoneController,
                    inputType: TextInputType.phone,
                    hints: AppStrings.mobileNumber,
                    errorText: snapShotPhone.data ?? true ? null: "Enter a valid phone number",
                    prefixIcon: ImageAssets.icPhone);
              }),
        ),
        Positioned(
          top: AppSize.h369,
          left: AppSize.w24,
          right: AppSize.w24,
          child: StreamBuilder<bool>(
              stream: _viewModel.outputIsPasswordValid,
              initialData: true,
              builder: (context, snapShotPassword) {
                return    StreamBuilder<bool>(
                    stream: _viewModel.outputIsPasswordVisible,
                    initialData: true,
                    builder: (context, snapShotVisible) {
                      return CurveTextFormFieldCW(
                        controller: _passwordController,
                        inputType: TextInputType.visiblePassword,
                        hints: AppStrings.password,
                        prefixIcon: ImageAssets.icLock,
                        suffixIcon: ImageAssets.icEye,
                        errorText: snapShotPassword.data ?? true ? null: "Must be 6 digit",
                        obscureText: snapShotVisible.data ?? true,
                        onTap: () {
                          _viewModel.setIsPasswordVisible();
                        },
                      );
                    });
              }),
        ),
        Positioned(
          top: AppSize.h456,
          right: AppSize.w36,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.forgotPasswordRoute);
            },
            child: Text(
              AppStrings.forgetPassword,
              style: TextStyle(
                  color: ColorManager.white,
                  fontSize: FontSize.s14,
                  fontFamily: FontConstants.fontFamily,
                  fontWeight: FontWeightManager.regular),
            ),
          ),
        ),
        Positioned(
            top: AppSize.h518,
            right: AppSize.w28,
            left: AppSize.w23,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppStrings.signIn,
                      style: getTextStyleBold(fontSize: FontSize.s25)),

                  SizedBox(
                      width: AppSize.w60,
                      height: AppSize.h60,
                      child: StreamBuilder<bool>(
                          stream: _viewModel.outputIsAllInputsValid,
                          builder: (context, snapshot) {
                            return IconButton(


                              onPressed: (snapshot.data ?? false)
                                  ? () {
                                      //enable
                                      _viewModel.login(context);
                               // Navigator.pushReplacementNamed(context, Routes.mainRoute);
                                    }
                                  : () {
                                      //disable
                                    },
                              style: IconButton.styleFrom(
                                  backgroundColor: (snapshot.data ?? false)
                                      ? ColorManager.seaBuckthorn
                                      : ColorManager.grey1),
                              icon: SvgPicture.asset(
                                ImageAssets.icArrowRight,
                                height: AppSize.h26,
                                width: AppSize.w26,
                              ),
                            );
                          })),
                ])),
        SocialLoginCw(
          onTapGoogle: () {},
          onTapApple: () {},
          onTapFacebook: () {},
        ),
      ],
    );

  }
}
