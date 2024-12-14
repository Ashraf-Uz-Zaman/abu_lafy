import 'package:abu_lafy/presentation/resources/assets_manager.dart';
import 'package:abu_lafy/presentation/resources/strings_manager.dart';
import 'package:abu_lafy/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SocialLoginCw extends StatelessWidget {
  final GestureTapCallback? onTapGoogle;
  final GestureTapCallback? onTapApple;
  final GestureTapCallback? onTapFacebook;

  const SocialLoginCw(
      {super.key,
      required this.onTapGoogle,
      required this.onTapApple,
      required this.onTapFacebook});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: AppSize.sp_687h,
        left: 0,
        right: 0,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 SvgPicture.asset(ImageAssets.icHorizontalLine,
                    height: AppSize.svg_89h),
                Text(
                  AppStrings.orLoginWith,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SvgPicture.asset(ImageAssets.icHorizontalLine,height: AppSize.svg_89h
                   ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 15.w,
              children: [

                InkWell(onTap: onTapGoogle,
                    splashColor: Colors.white12,
                    customBorder:  const CircleBorder(),


                    child: Padding(padding: EdgeInsets.all(10.r),
                      child: SvgPicture.asset(ImageAssets.icGoogle,
                          height: AppSize.svg_25h, width: AppSize.svg_25w)),
                    ),

                InkWell(onTap: onTapApple,
                  splashColor: Colors.white12,
                  customBorder:  const CircleBorder(),


                  child: Padding(padding: EdgeInsets.all(10.r),
                      child: SvgPicture.asset(ImageAssets.icApple,
                          height: AppSize.svg_25h, width: AppSize.svg_25w)),
                ),

                InkWell(onTap: onTapFacebook,
                  splashColor: Colors.white12,
                  customBorder:  const CircleBorder(),


                  child: Padding(padding: EdgeInsets.all(10.r),
                      child: SvgPicture.asset(ImageAssets.icFacebook,
                          height: AppSize.svg_25h, width: AppSize.svg_25w)),
                ),

              ],
            )
          ],
        ));
  }
}
