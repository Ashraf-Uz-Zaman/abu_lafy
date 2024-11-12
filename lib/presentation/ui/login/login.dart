import 'package:abu_lafy/presentation/resources/assets_manager.dart';
import 'package:abu_lafy/presentation/resources/color_manager.dart';
import 'package:abu_lafy/presentation/resources/font_manager.dart';
import 'package:abu_lafy/presentation/resources/strings_manager.dart';
import 'package:abu_lafy/presentation/ui/common_widget/curve_textformfield_cw.dart';
import 'package:abu_lafy/presentation/ui/common_widget/social_login_cw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isTextVisible = true;
  // final _formKey = GlobalKey<FormState>();

  _bind() {

  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return _getContentWidget();
    return Scaffold(
        backgroundColor: ColorManager.primary,
        body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Positioned(
                top: 186.h,
                left: 23.w,
                child: Text(AppStrings.welcome,
                    style: TextStyle(
                        color: ColorManager.white,
                        fontSize: 40.sp,
                        fontFamily: FontConstants.fontFamily,
                        fontWeight: FontWeightManager.bold)),
              ),
              Positioned(
                  top: 271.h,
                  left: 24.w,
                  right: 24.w,
                  child: CurveTextFormFieldCW(
                      controller: _userNameController,
                      inputType: TextInputType.phone,
                      hints: AppStrings.username,
                      prefixIcon: ImageAssets.icUser)),
              Positioned(
                  top: 369.h,
                  left: 24.w,
                  right: 24.w,
                  child: CurveTextFormFieldCW(
                    controller: _passwordController,
                    inputType: TextInputType.text,
                    hints: AppStrings.password,
                    prefixIcon: ImageAssets.icLock,
                    suffixIcon: ImageAssets.icEye,
                    obscureText: isTextVisible,
                    onTap: () {
                      isTextVisible = !isTextVisible;
                    },
                  )),
              Positioned(
                top: 456.h,
                right: 36.w,
                child: Text(
                  AppStrings.forgetPassword,
                  style: TextStyle(
                      color: ColorManager.white,
                      fontSize: 12.sp,
                      fontFamily: FontConstants.fontFamily,
                      fontWeight: FontWeightManager.regular),
                ),
              ),
              Positioned(
                  top: 518.h,
                  right: 28.w,
                  left: 23.w,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppStrings.signIn,
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
              Positioned(
                top: 687.h,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                        width: 89.w,
                        image: const AssetImage(
                          ImageAssets.orLoginWith,
                        )),
                    Text(
                      AppStrings.orLoginWith,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Image(
                        width: 89.w,
                        image: const AssetImage(
                          ImageAssets.orLoginWith,
                        )),
                  ],
                ),
              ),
              Positioned(
                top: 748.h,
                left: 0,
                right: 0,
                child: SocialLoginCw(onTapGoogle: () {  }, onTapApple: () {  }, onTapFacebook: () {  },),
              ),
            ],
          ),
        ));
  }
}
