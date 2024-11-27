import 'package:abu_lafy/presentation/resources/assets_manager.dart';
import 'package:abu_lafy/presentation/resources/color_manager.dart';
import 'package:abu_lafy/presentation/resources/font_manager.dart';
import 'package:abu_lafy/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class EventView extends StatefulWidget {
  const EventView({super.key});

  @override
  _EventViewState createState() => _EventViewState();
}

class _EventViewState extends State<EventView> {
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
    return Stack(
      children: [
        Positioned(
            left: 19.w,
            right: 19.w,
            top: 10.w,
            child: Container(
                padding: EdgeInsets.only(left: 24.w, right: 24.w,),
              alignment: Alignment.center,
                height: 70.h,
                decoration: BoxDecoration(
                    color: ColorManager.grey,
                    borderRadius: BorderRadius.all(Radius.zero),),
                child:  InkWell(
                  onTap: (){},
                  child:      SizedBox(
                      height: 34.h,
                      width: double.infinity,
                      child: Text(
                        "Create a Post",
                        style: TextStyle(
                            color: ColorManager.grey_whats,
                            fontSize: 25.sp,
                            fontFamily: FontConstants.fontFamily,
                            fontWeight: FontWeightManager.semiBold),
                      )),
                ),)),
        Positioned(
            top: 105.h,
            right: 24.w,
            left: 24.w,
            child: Stack(
              children: [
                 ClipRRect(
                   borderRadius: BorderRadius.circular(5.0.r),
                   child: Image.network(
                     opacity: const AlwaysStoppedAnimation(.7),
                     width: double.infinity,
                     height: 126.h,
                     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyvetnLOz5AF4JPJGxqw0EJpwpBHl9swwqww&s",
                     fit: BoxFit.cover,
                   ),
                 ),

                Positioned( left: 18.w,
                    top: 41.h,
                    bottom: 41.h,
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
                                    fontFamily: FontConstants.fontFamily,
                                    fontWeight:
                                    FontWeightManager.semiBold)),
                            Row(
                              children: [
                                Icon(
                                  Icons.timelapse,
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
              ],
            ))
      ],
    );
  }
}
