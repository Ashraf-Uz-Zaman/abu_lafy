import 'package:abu_lafy/presentation/resources/assets_manager.dart';
import 'package:abu_lafy/presentation/resources/color_manager.dart';
import 'package:abu_lafy/presentation/resources/font_manager.dart';
import 'package:abu_lafy/presentation/resources/strings_manager.dart';
import 'package:abu_lafy/presentation/ui/common_widget/otp/otp_pin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/svg.dart';

typedef OnCodeEnteredCompletion = void Function(String value);

class OtpView extends StatefulWidget {
  final OnCodeEnteredCompletion onSubmit;


  OtpView({super.key,required this.onSubmit,}) ;

  @override
  State<OtpView> createState() => _OtpViewState();
}
class _OtpViewState extends State<OtpView>  {

  @override
  Widget build(BuildContext context) {
    return  Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Positioned(
          top: 85.h,left: 0,right: 0,
          child :
          Center(child: SvgPicture.asset(ImageAssets.icOtp,height: 200 .h,width: 169.w,),),
        ),

        Positioned(
            top: 337.h,
            left: 0,
            right: 0,
            child:
            Center(
                child: Text(AppStrings.otpVerification, style: TextStyle(color: ColorManager.white,fontSize: 37.sp, fontFamily: FontConstants.fontFamily,fontWeight: FontWeightManager.semiBold))
            )),


        Positioned(
            top: 415.h,
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
            top: 515.h,
            left: 0,
            right: 0,
            child:
            Center(
              child:
               OtpPinView(onSubmit: (String value) {

                        widget.onSubmit(value);
                      }, onCodeChanged: (String value) {

                      },)
                  )
                ),






        Positioned(
            top: 606.h,
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
                          style: TextStyle(color: ColorManager.amber,fontSize: 12.sp, fontFamily: FontConstants.fontFamily,fontWeight: FontWeightManager.semiBold),
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
