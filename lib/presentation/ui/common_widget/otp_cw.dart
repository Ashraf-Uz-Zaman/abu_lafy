import 'package:abu_lafy/presentation/resources/assets_manager.dart';
import 'package:abu_lafy/presentation/resources/color_manager.dart';
import 'package:abu_lafy/presentation/resources/font_manager.dart';
import 'package:abu_lafy/presentation/resources/strings_manager.dart';
import 'package:abu_lafy/presentation/ui/forget_password/forget_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/svg.dart';


class OtpCW extends StatelessWidget {

  void next(context){
    FocusScope.of(context).nextFocus();
  }

  final List<TextEditingController> controllers;
  final BuildContext ctx;
  final ForgetPasswordView widgets;


  const OtpCW({super.key, required this.controllers, required this.ctx,required this.widgets});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Positioned(
          top: 115.h,left: 0,right: 0,
          child :
          Center(child: SvgPicture.asset(ImageAssets.icOtp,height: 245.h,width: 207.w,),),
        ),

        Positioned(
            top: 387.h,
            left: 0,
            right: 0,
            child:
            Center(
                child: Text(AppStrings.otpVerification, style: TextStyle(color: ColorManager.white,fontSize: 40.sp, fontFamily: FontConstants.fontFamily,fontWeight: FontWeightManager.semiBold))
            )),

        Positioned(
            top: 387.h,
            left: 0,
            right: 0,
            child:
            Center(
                child: Text(AppStrings.otpVerification, style: TextStyle(color: ColorManager.white,fontSize: 40.sp, fontFamily: FontConstants.fontFamily,fontWeight: FontWeightManager.semiBold))
            )),

        Positioned(
            top: 507.h,
            left: 0,
            right: 0,
            child:
            Center(
                child:
                RichText(
                    textAlign: TextAlign.center,
                    text:  TextSpan(
                      text:  AppStrings.weWillSendOtp,
                      style: TextStyle(color: ColorManager.white,fontSize: 15.sp, fontFamily: FontConstants.fontFamily,fontWeight: FontWeightManager.regular),
                      children: <TextSpan>[
                        TextSpan(

                          text: AppStrings.thisOtp,
                          style: TextStyle(color: ColorManager.white,fontSize: 15.sp, fontFamily: FontConstants.fontFamily,fontWeight: FontWeightManager.regular),
                        ),
                        TextSpan(
                          text: AppStrings.mobileNumberOtp,
                          style: TextStyle(color: ColorManager.white,fontSize: 15.sp, fontFamily: FontConstants.fontFamily,fontWeight: FontWeightManager.semiBold),
                        ),
                        TextSpan(

                          text: '+8801- 7000000',
                          style: TextStyle(color: ColorManager.white,fontSize: 15.sp, fontFamily: FontConstants.fontFamily,fontWeight: FontWeightManager.semiBold),
                        ),
                      ],
                    )
                )

            )
        ),



        Positioned(
            top: 607.h,
            left: 0,
            right: 0,
            child:
            Center(
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                List.generate(4, (index) {
                  return Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 7.w),
                    child: CircleOTPField1(
                      controller: controllers[index],
                      onChanged:(String value) {
                        if (value.isNotEmpty && index == 3) {

                        }
                        if (value.isNotEmpty && index < 3) {
                          FocusScope.of(context).nextFocus();
                        }
                        if (value.isEmpty && index > 0) {
                          FocusScope.of(context).previousFocus();
                        }
                      },
                    ),
                  );
                }),
              ),

            )
        ),


        Positioned(
            top: 698.h,
            left: 0,
            right: 0,
            child:
            Center(
                child:
                RichText(
                    textAlign: TextAlign.center,
                    text:  TextSpan(
                      text:  AppStrings.doNotSendOTP,
                      style: TextStyle(color: ColorManager.white,fontSize: 12.sp, fontFamily: FontConstants.fontFamily,fontWeight: FontWeightManager.regular),
                      children: <TextSpan>[
                        TextSpan(

                          text: AppStrings.sendOTP,
                          style: TextStyle(color: ColorManager.yellow_1,fontSize: 12.sp, fontFamily: FontConstants.fontFamily,fontWeight: FontWeightManager.semiBold),
                        ),

                      ],
                    )
                )

            )
        ),

      ],
    );

  }
}



class CircleOTPField1 extends StatelessWidget {
  final TextEditingController controller;

  final ValueChanged<String> onChanged;

  const CircleOTPField1({super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 42,width: 42,
      child: TextField(
        controller: controller,
        onChanged: onChanged,

        style: TextStyle(color: ColorManager.primary,fontSize: 20.sp, fontFamily: FontConstants.fontFamily,fontWeight: FontWeightManager.bold),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],

        decoration: InputDecoration(
          counterText: "", // Hide the counter text (maxLength label)
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(10.r),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r), // Circular shape
            borderSide: BorderSide(color: ColorManager.dark_brown_1, width: 1.5.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
            borderSide: BorderSide(color: ColorManager.orange_1, width: 1.5.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
            borderSide: BorderSide(color: ColorManager.dark_brown_1, width: 1.5.r),
          ),
        ),
      ),
    );
  }
}
