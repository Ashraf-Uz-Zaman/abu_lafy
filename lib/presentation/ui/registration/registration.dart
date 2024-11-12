import 'package:abu_lafy/presentation/resources/assets_manager.dart';
import 'package:abu_lafy/presentation/resources/color_manager.dart';
import 'package:abu_lafy/presentation/resources/font_manager.dart';
import 'package:abu_lafy/presentation/resources/strings_manager.dart';
import 'package:abu_lafy/presentation/ui/common_widget/curve_textformfield_cw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  _RegistrationViewState createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  bool isTextVisible = true;

  // final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _userNameEditingController = TextEditingController();
  final TextEditingController _passwordEditingController = TextEditingController();
  final TextEditingController _passwordConfirmEditingController = TextEditingController();
  final TextEditingController _mobileTextEditingController =
  TextEditingController();


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
    return Scaffold(
        backgroundColor: ColorManager.primary,
        body:
        SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Positioned(
                top: 88.h,
                left: 23.w,
                child:
                Text(AppStrings.createAnAccount, style: TextStyle(
                    color: ColorManager.white,
                    fontSize: 40.sp,
                    fontFamily: FontConstants.fontFamily,
                    fontWeight: FontWeightManager.semiBold)),),


              Positioned(
                  top: 271.h,
                  left: 24.w,
                  right: 24.w,
                  child:
                  CurveTextFormFieldCW(
                      controller: _userNameEditingController,
                      inputType: TextInputType.phone,
                      hints: AppStrings.username,
                      prefixIcon: ImageAssets.icUser)),

              Positioned(
                  top: 359.h,
                  left: 24.w,
                  right: 24.w,
                  child: CurveTextFormFieldCW(
                controller: _passwordEditingController,
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
                  top: 457.h,
                  left: 24.w,
                  right: 24.w,
                  child: CurveTextFormFieldCW(
                    controller: _passwordConfirmEditingController,
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
                  top: 555.h,
                  left: 24.w,
                  right: 24.w,
                  child:
                  CurveTextFormFieldCW(
                      controller: _mobileTextEditingController,
                      inputType: TextInputType.phone,
                      hints: AppStrings.mobileNumber,
                      prefixIcon: ImageAssets.icPhone)),

              Positioned(
                  top: 653.h,
                  left: 0,
                  right: 0,
                  child:
                  Center(
                      child:
                      RichText(
                          textAlign: TextAlign.center,
                          text:  TextSpan(
                            text:  AppStrings.byCreate,
                            style: TextStyle(color: ColorManager.white,fontSize: 14.5.sp, fontFamily: FontConstants.fontFamily,fontWeight: FontWeightManager.regular),
                            children: <TextSpan>[
                              TextSpan(

                                text: AppStrings.tAndC,
                                style: TextStyle(color: ColorManager.orange_1,fontSize: 14.5.sp, fontFamily: FontConstants.fontFamily,fontWeight: FontWeightManager.regular),
                              ),
                              TextSpan(
                                text: AppStrings.andAgree,
                                style: TextStyle(color: ColorManager.white,fontSize: 14.5.sp, fontFamily: FontConstants.fontFamily,fontWeight: FontWeightManager.regular),
                              ),
                              TextSpan(

                                text: AppStrings.pP,
                                style: TextStyle(color: ColorManager.orange_1,fontSize: 14.5.sp, fontFamily: FontConstants.fontFamily,fontWeight: FontWeightManager.regular),
                              ),
                            ],
                          )
                      )

                  )
              ),


              Positioned(
                  top: 713.h,
                  left: 0,
                  right: 0,
                  child: Center(
                    child:   SizedBox(
                        width: 90.w,
                        height: 90.h,
                        child: IconButton(onPressed: (){},
                          style: IconButton.styleFrom(backgroundColor: ColorManager.orange_1),
                          icon: SvgPicture.asset(ImageAssets.icArrowRight,height: 37.h,width: 37.w,),
                        )),
                  ),
                 ),

            ],
          ),
        )
    );
  }
}
