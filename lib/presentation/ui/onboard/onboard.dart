import 'package:abu_lafy/presentation/resources/assets_manager.dart';
import 'package:abu_lafy/presentation/resources/color_manager.dart';
import 'package:abu_lafy/presentation/resources/font_manager.dart';
import 'package:abu_lafy/presentation/resources/routes_manager.dart';
import 'package:abu_lafy/presentation/resources/strings_manager.dart';
import 'package:abu_lafy/presentation/ui/common_widget/social_login_cw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';


class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {


  _bind() {

  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.primary,
      body:  Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              top: AppSize.h82,
              left: 0,
              right: 0,
              child : const Center(child: Image(image:  AssetImage(ImageAssets.onboardingLogo,)),) ,
            ),
            Positioned(
              top: AppSize.h361,left: 0,right: 0,
                child : Center(child: SizedBox(
                  width: AppSize.w380,
                  height: AppSize.h77,
                  child: ElevatedButton(

                    style:  ElevatedButton.styleFrom(
                        textStyle: getRegularStyle(fontSize: FontSize.s20, color: ColorManager.white),
                        backgroundColor: ColorManager.orange_1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSize.s20))),

                    onPressed: () {
                      Navigator.pushNamed(context, Routes.loginRoute);
                    },

                    child:  Text(AppStrings.login, style: TextStyle(color: ColorManager.white,fontSize: 20.sp, fontFamily: FontConstants.fontFamily,fontWeight: FontWeightManager.bold)),
                  ),
                ),)
            ),
            Positioned(
                top: AppSize.h473,left: 0,right: 0,
                child : Center(
                  child: SizedBox(
                    width: AppSize.w380,
                    height: AppSize.h77,
                    child: ElevatedButton(

                      style:  ElevatedButton.styleFrom(
                          textStyle: getRegularStyle(fontSize: FontSize.s20, color: ColorManager.white),
                          backgroundColor: ColorManager.navyBlue_1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppSize.s20))),

                      onPressed: () {

                          Navigator.pushNamed(context, Routes.registerRoute);

                      },

                      child:  Text(AppStrings.createAccount, style: TextStyle(color: ColorManager.white,fontSize: 20.sp, fontFamily: FontConstants.fontFamily,fontWeight: FontWeightManager.bold),
                        ),
                    ),
                  ),
                )
            ),
             SocialLoginCw(onTapGoogle: () {  }, onTapApple: () {  }, onTapFacebook: () {  }),




          ]

        )

    );
  }


  @override
  void dispose() {
    super.dispose();
  }
}