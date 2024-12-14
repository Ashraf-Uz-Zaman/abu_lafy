import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:abu_lafy/presentation/resources/assets_manager.dart';
import 'package:abu_lafy/presentation/resources/color_manager.dart';
import 'package:abu_lafy/presentation/resources/font_manager.dart';
import 'package:abu_lafy/presentation/resources/strings_manager.dart';


class ConfirmView extends StatefulWidget {
  const ConfirmView({super.key});

  @override
  State<ConfirmView> createState() => _ConfirmViewState();
}

class _ConfirmViewState extends State<ConfirmView> {


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
    return Scaffold(
        body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Positioned(
                top: 82.h,
                left: 0,
                right: 0,
                child: Text(AppStrings.confirmation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: ColorManager.white,
                        fontSize: 36.sp,
                        fontFamily: FontConstants.fontFamily,
                        fontWeight: FontWeightManager.bold)),
              ),

              Positioned(
                top: 150.h,
                right: 0,
                left: 0,
                child: Center(child: SvgPicture.asset(ImageAssets.icConfirm,width: 400.w,height: 400.h,),)
              ),

              Positioned(
                top: 525.h,
                left: 0,
                right: 0,
                child: Text(AppStrings.addedSuccessfully,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: ColorManager.white,
                        fontSize: 18.sp,
                        fontFamily: FontConstants.fontFamily,
                        fontWeight: FontWeightManager.semiBold)),
              ),
              Positioned(
                top: 560.h,
                left: 0,
                right: 0,
                child: Text(AppStrings.youHomeWill,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: ColorManager.white,
                        fontSize: 17.sp,
                        fontFamily: FontConstants.fontFamily,
                        fontWeight: FontWeightManager.regular)),
              ),

              Positioned(
                top: 713.h,
                left: 0,
                right: 0,
                child: Center(
                  child: SizedBox(
                      width: 90.w,
                      height: 90.h,
                      child: IconButton(onPressed: (){},
                        style: IconButton.styleFrom(backgroundColor: ColorManager.seaBuckthorn),
                        icon: SvgPicture.asset(ImageAssets.icArrowRight,height: 37.h,width: 37.w,),
                      )),
                ),
              ),
            ],
          ),
        ));
  }
}


