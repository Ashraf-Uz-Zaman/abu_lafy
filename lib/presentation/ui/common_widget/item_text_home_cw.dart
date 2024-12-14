import 'package:abu_lafy/presentation/resources/assets_manager.dart';
import 'package:abu_lafy/presentation/resources/color_manager.dart';
import 'package:abu_lafy/presentation/resources/font_manager.dart';
import 'package:abu_lafy/presentation/resources/strings_manager.dart';
import 'package:abu_lafy/presentation/resources/values_manager.dart';
import 'package:abu_lafy/presentation/ui/common_widget/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';



class ItemTextHomeCw extends StatelessWidget {

  final VoidCallback onLike;
  final VoidCallback onDisLike;

  final String imageUrl;
  final String posterName;
  final String content;
  final String like;
  final String dislike;
  final String timeStamp;

  const ItemTextHomeCw(
      {super.key,
        required this.imageUrl, required this.posterName, required this.content, required this.like, required this.dislike, required this.timeStamp, required this.onLike, required this.onDisLike});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            left: 18.5.w, right: 18.5.w, top: 8.h),

        constraints: BoxConstraints(
          minHeight:  126.h,
        ),
        decoration: BoxDecoration(

            color: ColorManager.trout,
            borderRadius: BorderRadius.all(Radius.circular(5
                .r))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                getCircularCacheImage(imageUrl ?? '',44.h,44.w,44.r),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .start,
                  children: [
                    Text(posterName,
                        style: TextStyle(
                            color: ColorManager.white,
                            fontSize: 16.sp,
                            fontFamily: FontConstants
                                .fontFamily,
                            fontWeight:
                            FontWeightManager.semiBold)),
                    Row(
                      children: [
                        Icon(
                          Icons.invert_colors_on,
                          size: 10.r,
                          color: ColorManager.grey_whats,
                        ),
                        SizedBox(width: 4.w),
                        Text(timeStamp,
                            style: TextStyle(
                                color: ColorManager
                                    .grey_whats,
                                fontSize: 10.sp,
                                fontFamily:
                                FontConstants.fontFamily,
                                fontWeight:
                                FontWeightManager.regular)),
                      ],
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 8.w,
            ),
            Container(
              constraints: BoxConstraints(
                minHeight:  30.h,
              ),
              child: Text(content,

                  style: TextStyle(
                      color: ColorManager.white,
                      fontSize: 10.sp,
                      fontFamily: FontConstants.fontFamily,
                      fontWeight: FontWeightManager.regular)),
            ),
            SizedBox(
              height: 5.w,
            ),
             Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SizedBox(
                   width: 68.w,
                   height: 23.h,
                   child: ElevatedButton(
                     style: ElevatedButton.styleFrom(
                         backgroundColor: ColorManager.white,
                         padding: EdgeInsets.symmetric(
                             horizontal: 5.w, vertical: 0),
                         shape: RoundedRectangleBorder(
                             borderRadius:
                             BorderRadius.circular(20.r))),
                     onPressed: onLike,
                     child: Row(
                       mainAxisAlignment:
                       MainAxisAlignment.spaceEvenly,
                       crossAxisAlignment:
                       CrossAxisAlignment.center,
                       children: [
                         SvgPicture.asset(
                           ImageAssets.icLike,
                           height: 11.67.h,
                           width: 12.04.w,
                         ),
                         Text("Like",
                             style: TextStyle(
                                 color: ColorManager.black,
                                 fontSize: 8.sp,
                                 fontFamily:
                                 FontConstants.fontFamily,
                                 fontWeight:
                                 FontWeightManager.medium)),
                         Text(like,
                             style: TextStyle(
                                 color: ColorManager.black,
                                 fontSize: 8.sp,
                                 fontFamily:
                                 FontConstants.fontFamily,
                                 fontWeight:
                                 FontWeightManager.medium))
                       ],
                     ),
                   ),
                 ),
                 SizedBox(
                   width: 14.w,
                 ),
                 SizedBox(
                   width: 68.w,
                   height: 23.h,
                   child: ElevatedButton(
                     style: ElevatedButton.styleFrom(
                         backgroundColor: ColorManager.white,
                         padding: EdgeInsets.symmetric(
                             horizontal: 5.w, vertical: 0),
                         shape: RoundedRectangleBorder(
                             borderRadius:
                             BorderRadius.circular(20.r))),
                     onPressed: onDisLike,
                     child: Row(
                       mainAxisAlignment:
                       MainAxisAlignment.spaceEvenly,
                       crossAxisAlignment:
                       CrossAxisAlignment.center,
                       children: [
                         SvgPicture.asset(
                           ImageAssets.icDislike,
                           height: 11.67.h,
                           width: 12.04.w,
                         ),
                         Text("Dislike",
                             style: TextStyle(
                                 color: ColorManager.black,
                                 fontSize: 8.sp,
                                 fontFamily:
                                 FontConstants.fontFamily,
                                 fontWeight:
                                 FontWeightManager.medium)),
                         Text(dislike,
                             style: TextStyle(
                                 color: ColorManager.black,
                                 fontSize: 8.sp,
                                 fontFamily:
                                 FontConstants.fontFamily,
                                 fontWeight:
                                 FontWeightManager.medium))
                       ],
                     ),
                   ),
                 )
               ],
             ),

            SizedBox(
              height: 8.w,
            ),
          ],
        ));
  }
}
