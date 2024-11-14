import 'package:abu_lafy/presentation/resources/assets_manager.dart';
import 'package:abu_lafy/presentation/resources/strings_manager.dart';
import 'package:abu_lafy/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
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
        top: AppSize.h687,
        left: 0,
        right: 0,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                    width: AppSize.w89_1,
                    image: const AssetImage(
                      ImageAssets.orLoginWith,
                    )),
                Text(
                  AppStrings.orLoginWith,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Image(
                    width: AppSize.w89_1,
                    image: const AssetImage(
                      ImageAssets.orLoginWith,
                    )),
              ],
            ),
            SizedBox(
              height: AppSize.h38,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: onTapGoogle,
                  child: SvgPicture.asset(ImageAssets.icGoogle,
                      height: AppSize.h25, width: AppSize.w25),
                ),
                SizedBox(width: AppSize.w37_76),
                GestureDetector(
                    onTap: onTapApple,
                    child: SvgPicture.asset(ImageAssets.icApple,
                        height: AppSize.h25, width: AppSize.w25)),
                SizedBox(width: AppSize.w37_76),
                GestureDetector(
                    onTap: onTapFacebook,
                    child: SvgPicture.asset(ImageAssets.icFacebook,
                        height: AppSize.h25, width: AppSize.w25)),
              ],
            )
          ],
        ));
  }
}
