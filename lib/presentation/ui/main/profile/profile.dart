import 'package:abu_lafy/presentation/resources/assets_manager.dart';
import 'package:abu_lafy/presentation/resources/color_manager.dart';
import 'package:abu_lafy/presentation/resources/font_manager.dart';
import 'package:abu_lafy/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  _profileViewState createState() => _profileViewState();
}

class _profileViewState extends State<ProfileView> {
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
    return Column(
      children: [
        SizedBox(
          height: 256.h,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                margin: EdgeInsets.only(left: 18.w, right: 18.w, top: 30.85.h),
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.all(Radius.circular(33.r),),),
              ),

              Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Center(child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0.r),
                    child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtmNgsxLRZieSP2bOqLNifcIYtDjLH6zxq6Q&s",
                      height: 94.69.h,
                      width: 94.69.w,
                      fit: BoxFit.cover,
                    ),
                  ),)),

              Positioned(
                top: 76.h,
                left: 120.w,

                child: Text("League",
                    style: TextStyle(
                        color: ColorManager.grey,
                        fontSize: 14.sp,
                        letterSpacing: 0,
                        fontFamily: FontConstants.fontFamily,
                        fontWeight:
                        FontWeightManager.light)),),

              Positioned(
                top: 89.85.h,
                left: 30.w,
                right: 30.w,

                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Champion",
                        style: TextStyle(
                            color: ColorManager.black,
                            fontSize: 25.sp,
                            letterSpacing: 0,
                            fontFamily: FontConstants.fontFamily,
                            fontWeight:
                            FontWeightManager.regular)),

                    Text("Lorem ipsum dolor sit amet consectetur. Nisi pulvinar vel viverra laoreet tortor. Cursus morbi cursus in nulla egestas. Morbi ipsum molestie arcu sit ullamcorper facilisis egestas. Aliquam risus dignissim luctus pulvinar blandit in sit.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ColorManager.black,
                            fontSize: 12.5.sp,
                            letterSpacing: 0,

                            fontFamily: FontConstants.fontFamily,
                            fontWeight:
                            FontWeightManager.regular)),
                  ],
                ),
              ),


            ],
          ),
        ),
        SizedBox(height: 15.h,),
        Container(
          margin: EdgeInsets.only(left: 18.w, right: 18.w),
          padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 25.h),
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.all(Radius.circular(33.r),),),
          child: Column(
            children: [
              Row(children: [
                Icon(Icons.call) ,
                SizedBox(width: 5.w,),
                Text("+966538320093",
                    style: TextStyle(
                        color: ColorManager.grey,
                        fontSize: 14.sp,
                        letterSpacing: 0,
                        fontFamily: FontConstants.fontFamily,
                        fontWeight:
                        FontWeightManager.light)),



              ],),

              Divider( color:  ColorManager.grey,thickness: .5.w,),

              Row(children: [
                Icon(Icons.calendar_month) ,
                SizedBox(width: 5.w,),
                Text("01 Jan 1991",
                    style: TextStyle(
                        color: ColorManager.grey,
                        fontSize: 14.sp,
                        letterSpacing: 0,
                        fontFamily: FontConstants.fontFamily,
                        fontWeight:
                        FontWeightManager.light)),



              ],),

              Divider( color:  ColorManager.grey,thickness: .5.w,),

              Row(children: [
                Icon(Icons.add_location_rounded) ,
                SizedBox(width: 5.w,),
                Text("Al - Wazarat, Riyadh 1100",
                    style: TextStyle(
                        color: ColorManager.grey,
                        fontSize: 14.sp,
                        letterSpacing: 0,
                        fontFamily: FontConstants.fontFamily,
                        fontWeight:
                        FontWeightManager.light)),



              ],),

              Divider( color:  ColorManager.grey,thickness: .5.w,),

              Row(children: [
                Icon(Icons.flag) ,
                SizedBox(width: 5.w,),
                Text("Bangladesh",
                    style: TextStyle(
                        color: ColorManager.grey,
                        fontSize: 14.sp,
                        letterSpacing: 0,
                        fontFamily: FontConstants.fontFamily,
                        fontWeight:
                        FontWeightManager.light)),



              ],),

              Divider( color:  ColorManager.grey,thickness: .5.w,),

              Row(children: [
                Icon(Icons.home) ,
                SizedBox(width: 5.w,),
                Text("+96653854609",
                    style: TextStyle(
                        color: ColorManager.grey,
                        fontSize: 14.sp,
                        letterSpacing: 0,
                        fontFamily: FontConstants.fontFamily,
                        fontWeight:
                        FontWeightManager.light)),



              ],)



            ],
          ),
        ),
      ],
    );

  }
}
