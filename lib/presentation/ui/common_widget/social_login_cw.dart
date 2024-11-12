import 'package:abu_lafy/presentation/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


class SocialLoginCw extends StatelessWidget {

  final GestureTapCallback? onTapGoogle;
  final GestureTapCallback? onTapApple;
  final GestureTapCallback? onTapFacebook;


  const SocialLoginCw({super.key, required this.onTapGoogle, required this.onTapApple, required this.onTapFacebook });

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTapGoogle,
          child: SvgPicture.asset(ImageAssets.icGoogle,height: 25.h,width: 25.w),
        ),
        SizedBox(width: 36.76.w),
        GestureDetector(
          onTap: onTapApple,
          child: SvgPicture.asset(ImageAssets.icApple,height: 25.h,width: 25.w)
        ),

        SizedBox(width: 36.76.w),
        GestureDetector(
            onTap: onTapFacebook,
            child: SvgPicture.asset(ImageAssets.icFacebook,height: 25.h,width: 25.w)
        ),

      ],
    );

  }
}