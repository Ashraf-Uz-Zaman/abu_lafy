import 'package:abu_lafy/presentation/resources/assets_manager.dart';
import 'package:abu_lafy/presentation/resources/color_manager.dart';
import 'package:abu_lafy/presentation/resources/font_manager.dart';
import 'package:abu_lafy/presentation/resources/strings_manager.dart';
import 'package:abu_lafy/presentation/ui/common_widget/curve_textformfield_cw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';



class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {

  final TextEditingController _phoneController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _passwordConfirmController =
  //     TextEditingController();


  _bind() {

  }

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return _getContentWidget();
    return  Scaffold(
        backgroundColor: ColorManager.primary,
        body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Positioned(
                top: 125.h,
                left: 26.w,
                child: Text(AppStrings.titleForgetPassword,
                    style: TextStyle(
                        color: ColorManager.white,
                        fontSize: 40.sp,
                        fontFamily: FontConstants.fontFamily,
                        fontWeight: FontWeightManager.bold)),
              ),
              Positioned(
                  top: 268.h,
                  left: 24.w,
                  right: 24.w,
                  child: CurveTextFormFieldCW(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppStrings.sentCode,
                            style: TextStyle(
                                color: ColorManager.white,
                                fontSize: 25.sp,
                                fontFamily: FontConstants.fontFamily,
                                fontWeight: FontWeightManager.bold)),
                        SizedBox(
                            width: 60.w,
                            height: 60.h,
                            child:
                            IconButton(onPressed: (){},
                              style: IconButton.styleFrom(backgroundColor: ColorManager.orange_1),
                              icon: SvgPicture.asset(ImageAssets.icArrowRight,height: 26.h,width: 26.w,),
                            )

                        ),
                      ])),


            ],
          ),
        ));
  }


  // @override
  // Widget build(BuildContext context) {
  //   // return _getContentWidget();
  //   return Scaffold(
  //     backgroundColor: ColorManager.white,
  //     body: StreamBuilder<FlowState>(
  //       stream: _viewModel.outputState,
  //       builder: (context, snapshot) {
  //         return snapshot.data?.getScreenWidget(context, _getContentWidget(),
  //                 () {
  //               // _viewModel.login();
  //             }) ??
  //             _getContentWidget();
  //       },
  //     ),
  //   );
  // }
  //
  // Widget _getContentWidget() {
  //   return Container(
  //     padding:  EdgeInsets.only(top: AppPadding.p100),
  //     child: SingleChildScrollView(
  //       child: Form(
  //         key: _formKey,
  //         child: Padding(
  //           padding:  EdgeInsets.only(
  //               left: AppPadding.p28,
  //               right: AppPadding.p28,
  //               top: AppPadding.p16),
  //           child: Column(
  //             children: <Widget>[
  //               const Image(image: AssetImage(ImageAssets.splashLogo)),
  //                SizedBox(
  //                 height: AppSize.s28,
  //               ),
  //               InputTextWidget(
  //                   stream: _viewModel.outputIsEmailValid,
  //                   controller: _emailController,
  //                   inputType: TextInputType.text,
  //                   hints: AppStrings.username.tr(),
  //                   error: AppStrings.usernameError),
  //                SizedBox(
  //                 height: AppSize.s28,
  //               ),
  //               InputTextWidget(
  //                   stream: _viewModel.outputIsPasswordValid,
  //                   controller: _passwordController,
  //                   inputType: TextInputType.text,
  //                   hints: AppStrings.username.tr(),
  //                   error: AppStrings.passwordError),
  //                SizedBox(
  //                 height: AppSize.s28,
  //               ),
  //               InputTextWidget(
  //                   stream: _viewModel.outputIsPasswordConfirmValid,
  //                   controller: _passwordConfirmController,
  //                   inputType: TextInputType.text,
  //                   hints: AppStrings.username.tr(),
  //                   error: AppStrings.passwordError),
  //                SizedBox(
  //                 height: AppSize.s28,
  //               ),
  //               ElevatedButton(
  //                   onPressed:() {
  //                     _viewModel.email_api();
  //                   },
  //                   child: const Text(AppStrings.login)),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
