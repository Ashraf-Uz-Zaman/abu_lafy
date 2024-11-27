import 'package:abu_lafy/presentation/resources/assets_manager.dart';
import 'package:abu_lafy/presentation/resources/color_manager.dart';
import 'package:abu_lafy/presentation/resources/font_manager.dart';
import 'package:abu_lafy/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
                padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 24.h),
                height: 120.h,
                decoration: BoxDecoration(
                    color: ColorManager.grey,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24.r),
                        bottomRight: Radius.circular(24.r),
                        topLeft: Radius.zero,
                        topRight: Radius.zero)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: (){
                        showMaterialModalBottomSheet(
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return SafeArea(child: Padding(padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 7.5.w), child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(onPressed: (){
                                      Navigator.of(context).pop();

                                    }, icon: Icon(Icons.close )),

                                    ElevatedButton(

                                      style:  ElevatedButton.styleFrom(
                                          textStyle: getRegularStyle(fontSize: FontSize.s20, color: ColorManager.white),
                                          backgroundColor: ColorManager.orange_1,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5.r))),

                                      onPressed: () {

                                      },

                                      child:  Text("POST", style: TextStyle(color: ColorManager.white,fontSize: 15.sp, fontFamily: FontConstants.fontFamily,fontWeight: FontWeightManager.semiBold)),
                                    ),

                                  ],
                                ),
                                SizedBox(height: 2.5.w,),
                                Divider(color: ColorManager.grey,),
                                SizedBox(height: 7.5.w,),
                              TextFormField(

                                minLines: 6,
                                maxLines: null,
                                  keyboardType: TextInputType.multiline,
                                style: TextStyle(color: ColorManager.black,fontSize: FontSize.s20, fontFamily: FontConstants.fontFamily,fontWeight: FontWeightManager.regular),
                                decoration: InputDecoration(
                                  hintText: "Whats on your mind ?",
                                  hintStyle: TextStyle(color: ColorManager.grey,fontSize: FontSize.s20, fontFamily: FontConstants.fontFamily,fontWeight: FontWeightManager.regular),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder:InputBorder.none,
                                  errorBorder: InputBorder.none
                                ),


                                )
                              ],
                            ),));
                        },
                        );
                      },
                      child:      SizedBox(
                          height: 34.h,
                          width: double.infinity,
                          child: Text(
                            "What's on your mind?",
                            style: TextStyle(
                                color: ColorManager.grey_whats,
                                fontSize: 15.sp,
                                fontFamily: FontConstants.fontFamily,
                                fontWeight: FontWeightManager.regular),
                          )),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    SizedBox(
                      width: 106.61.w,
                      height: 34.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorManager.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.83.w, vertical: 0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r))),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              ImageAssets.icCamera,
                              height: 12.h,
                              width: 13.w,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text("Photo",
                                style: TextStyle(
                                    color: ColorManager.black,
                                    fontSize: 12.sp,
                                    fontFamily: FontConstants.fontFamily,
                                    fontWeight: FontWeightManager.medium))
                          ],
                        ),
                      ),
                    )
                  ],
                ))),
        Positioned(
            top: 145.h,
            right: 24.w,
            left: 24.w,
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.only(
                        left: 18.5.w, right: 18.5.w, top: 8.h),
                    height: 126.h,
                    decoration: BoxDecoration(
                        color: ColorManager.grey,
                        borderRadius: BorderRadius.all(Radius.circular(5.r))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
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
                                      Icons.invert_colors_on,
                                      size: 10.r,
                                      color: ColorManager.grey_whats,
                                    ),
                                    SizedBox(width: 4.w),
                                    Text("2 Hours ago",
                                        style: TextStyle(
                                            color: ColorManager.grey_whats,
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
                        Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor numbas sator...",
                            style: TextStyle(
                                color: ColorManager.white,
                                fontSize: 10.sp,
                                fontFamily: FontConstants.fontFamily,
                                fontWeight: FontWeightManager.regular)),
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
                                    backgroundColor: ColorManager.white,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.w, vertical: 0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(20.r))),
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
                                            fontFamily:
                                            FontConstants.fontFamily,
                                            fontWeight:
                                            FontWeightManager.medium)),
                                    Text("01",
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
                                            fontFamily:
                                            FontConstants.fontFamily,
                                            fontWeight:
                                            FontWeightManager.medium)),
                                    Text("01",
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
                        )
                      ],
                    )),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
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
                    ))
              ],
            ))
      ],
    );
  }
}
