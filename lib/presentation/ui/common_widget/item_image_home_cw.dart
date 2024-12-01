import 'package:abu_lafy/presentation/resources/assets_manager.dart';
import 'package:abu_lafy/presentation/resources/color_manager.dart';
import 'package:abu_lafy/presentation/resources/font_manager.dart';
import 'package:abu_lafy/presentation/resources/strings_manager.dart';
import 'package:abu_lafy/presentation/resources/values_manager.dart';
import 'package:abu_lafy/presentation/ui/common_widget/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ItemItemHomeCw extends StatelessWidget {

  final String imageUrl;
  final String posterName;
  final String content;
  final String like;
  final String dislike;

  const ItemItemHomeCw(
      {super.key,
        required this.imageUrl, required this.posterName, required this.content, required this.like, required this.dislike});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        height: 245.h,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0.r),
              child: Image.network(
                "https://cdn.britannica.com/69/228369-050-0B18A1F6/Asian-Cup-Final-2019-Hasan-Al-Haydos-Qatar-Japan-Takumi-Minamino.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 15.h,
              left: 11.5.w,
              right: 11.5.w,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.0.r),
                    child: Image.network(
                      "https://buffer.com/library/content/images/size/w1200/2023/10/free-images.jpg",
                      height: 44.h,
                      width: 44.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Namur",
                          style: TextStyle(
                              color: ColorManager.white,
                              fontSize: 16.sp,
                              fontFamily:
                              FontConstants.fontFamily,
                              fontWeight:
                              FontWeightManager.semiBold)),
                      Row(
                        children: [
                          Icon(
                            Icons.invert_colors_on,
                            size: 10.r,
                            color: ColorManager.white,
                          ),
                          SizedBox(width: 4.w),
                          Text("2 Hours ago",
                              style: TextStyle(
                                  color: ColorManager.white,
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
            ),
            Positioned(
                left: 15.w,
                right: 15.w,
                bottom: 5.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor numbas sator...",
                        style: TextStyle(
                            color: ColorManager.white,
                            fontSize: 10.sp,
                            fontFamily: FontConstants.fontFamily,
                            fontWeight:
                            FontWeightManager.regular)),
                    SizedBox(
                      height: 5.w,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 68.w,
                          height: 23.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                ColorManager.white,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.w, vertical: 0),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(
                                        20.r))),
                            onPressed: () {},
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
                                        fontFamily: FontConstants
                                            .fontFamily,
                                        fontWeight:
                                        FontWeightManager
                                            .medium)),
                                Text("01",
                                    style: TextStyle(
                                        color: ColorManager.black,
                                        fontSize: 8.sp,
                                        fontFamily: FontConstants
                                            .fontFamily,
                                        fontWeight:
                                        FontWeightManager
                                            .medium))
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
                                backgroundColor:
                                ColorManager.white,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.w, vertical: 0),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(
                                        20.r))),
                            onPressed: () {},
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
                                        fontFamily: FontConstants
                                            .fontFamily,
                                        fontWeight:
                                        FontWeightManager
                                            .medium)),
                                Text("01",
                                    style: TextStyle(
                                        color: ColorManager.black,
                                        fontSize: 8.sp,
                                        fontFamily: FontConstants
                                            .fontFamily,
                                        fontWeight:
                                        FontWeightManager
                                            .medium))
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ))
          ],
        ));
  }
}
