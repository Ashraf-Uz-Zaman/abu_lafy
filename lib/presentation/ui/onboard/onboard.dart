import 'package:abu_lafy/presentation/resources/assets_manager.dart';
import 'package:abu_lafy/presentation/resources/color_manager.dart';
import 'package:abu_lafy/presentation/resources/font_manager.dart';
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
      body:  SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              top: 82.h,
              left: 0,
              right: 0,
              child : const Center(child: Image(image:  AssetImage(ImageAssets.onboardingLogo,)),) ,
            ),
            Positioned(
              top: 361.h,left: 0,right: 0,
                child : Center(child: SizedBox(
                  width: 380.w,
                  height: 77.h,
                  child: ElevatedButton(

                    style:  ElevatedButton.styleFrom(
                        textStyle: getRegularStyle(fontSize: FontSize.s20, color: ColorManager.white),
                        backgroundColor: ColorManager.orange_1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSize.s20))),

                    onPressed: () {},

                    child:  Text(AppStrings.login, style: Theme.of(context).textTheme.bodyLarge,),
                  ),
                ),)
            ),
            Positioned(
                top: 473.h,left: 0,right: 0,
                child : Center(
                  child: SizedBox(
                    width: 380.w,
                    height: 77.h,
                    child: ElevatedButton(

                      style:  ElevatedButton.styleFrom(
                          textStyle: getRegularStyle(fontSize: FontSize.s20, color: ColorManager.white),
                          backgroundColor: ColorManager.navyBlue_1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppSize.s20))),

                      onPressed: () {},

                      child:  Text(AppStrings.createAccount, style: Theme.of(context).textTheme.bodyLarge,),
                    ),
                  ),
                )
            ),
            Positioned(
                top: 699.h,left: 0,right: 0,
                child : Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image( width : 89.w, image: const AssetImage(ImageAssets.orLoginWith,)),
                    Text(AppStrings.orLoginWith, style: Theme.of(context).textTheme.titleMedium,),
                    Image( width : 89.w, image: const AssetImage(ImageAssets.orLoginWith,)),
                ],),

            ),


            Positioned(
              top: 748.h,
              left: 0,
              right: 0,
              child: SocialLoginCw(onTapGoogle: () {  }, onTapApple: () {  }, onTapFacebook: () {  },),
            ),
          ]

        )
      )
    );
  }


  @override
  void dispose() {
    super.dispose();
  }
}