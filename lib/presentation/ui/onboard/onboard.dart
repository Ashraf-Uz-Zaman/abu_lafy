

import 'package:abu_lafy/application/app_preferences.dart';
import 'package:abu_lafy/application/dependency_injection.dart';
import 'package:abu_lafy/presentation/resources/assets_manager.dart';
import 'package:abu_lafy/presentation/resources/color_manager.dart';
import 'package:abu_lafy/presentation/resources/routes_manager.dart';
import 'package:abu_lafy/presentation/resources/strings_manager.dart';
import 'package:abu_lafy/presentation/ui/common_widget/social_login_cw.dart';
import 'package:flutter/material.dart';


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
                child : Center(child:  ElevatedButton(

                    style:  getElevationButtonStyle( bgColor: ColorManager.orange_1),

                    onPressed: () {

                      Navigator.pushNamed(context, Routes.loginRoute);
                    },

                    child:  Text(AppStrings.login, style: getElevationButtonTextStyle()),
                  ),
                ),
            ),
            Positioned(
                top: AppSize.h473,left: 0,right: 0,
                child : Center(
                  child: ElevatedButton(

                      style:  getElevationButtonStyle( bgColor: ColorManager.navyBlue_1),

                      onPressed: () {

                          Navigator.pushNamed(context, Routes.registerRoute);

                      },

                      child:  Text(AppStrings.createAccount, style: getElevationButtonTextStyle(),
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