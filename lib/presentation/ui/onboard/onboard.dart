
import 'package:abu_lafy/presentation/resources/assets_manager.dart';
import 'package:abu_lafy/presentation/resources/color_manager.dart';
import 'package:abu_lafy/presentation/resources/routes_manager.dart';
import 'package:abu_lafy/presentation/resources/strings_manager.dart';
import 'package:abu_lafy/presentation/ui/common_widget/social_login_cw.dart';
import 'package:flutter/material.dart';

import '../../resources/values_manager.dart';


class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  createState() => _OnBoardingViewState();
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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              top: AppSize.sp_82h,
              left: 0,
              right: 0,
              child : const Center(child: Image(image:  AssetImage(ImageAssets.onboardingLogo,)),) ,
            ),
            Positioned(
              top: AppSize.sp_361h,left: 0,right: 0,
                child : Center(child:  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.loginRoute);
                    },
                    child: const Text(AppStrings.login),
                  ),
                ),
            ),
            Positioned(
                top: AppSize.sp_473h,left: 0,right: 0,
                child : Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: ColorManager.cloudBurst),
                      onPressed: () {
                          Navigator.pushNamed(context, Routes.registerRoute);
                      },

                      child:  const Text(AppStrings.createAccount),
                    ),

                )
            ),
             SocialLoginCw(onTapGoogle: () {  }, onTapApple: () {  }, onTapFacebook: () {  }),



          ]

        )

    );
  }



}