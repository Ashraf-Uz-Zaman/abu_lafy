import 'package:abu_lafy/application/app_preferences.dart';
import 'package:abu_lafy/application/dependency_injection.dart';
import 'package:abu_lafy/presentation/resources/assets_manager.dart';
import 'package:abu_lafy/presentation/resources/color_manager.dart';
import 'package:abu_lafy/presentation/resources/font_manager.dart';
import 'package:abu_lafy/presentation/resources/routes_manager.dart';
import 'package:abu_lafy/presentation/resources/styles_manager.dart';
import 'package:abu_lafy/presentation/ui/common_widget/common.dart';
import 'package:abu_lafy/presentation/ui/main/main_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ProfileView extends StatefulWidget {
  final MainViewModel viewModel;
  const ProfileView({super.key, required this.viewModel});

  @override
  _profileViewState createState() => _profileViewState();
}

class _profileViewState extends State<ProfileView> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
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
          height: 236.h,
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
                  child:
                  Center(child: getCircularCacheImage( widget.viewModel.userModel.leagueImage ?? '',94.69.h,96.69.w,94.69.r)),

                  ),

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
                    Text(widget.viewModel.userModel.leagueLabel ?? '',
                        style: TextStyle(
                            color: ColorManager.black,
                            fontSize: 25.sp,
                            letterSpacing: 0,
                            fontFamily: FontConstants.fontFamily,
                            fontWeight:
                            FontWeightManager.regular)),

                    Text(widget.viewModel.userModel.leagueDesc ?? '',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ColorManager.black,
                            fontSize: 13.sp,
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
            borderRadius: BorderRadius.all(Radius.circular(20.r),),),
          child: Column(
            children: [
              Row(children: [
                Icon(Icons.call,size: 20.r) ,
                SizedBox(width: 5.w,),
                Text(widget.viewModel.userModel.phone ?? '',
                    style: TextStyle(
                        color: ColorManager.grey,
                        fontSize: 14.sp,
                        letterSpacing: 0,
                        fontFamily: FontConstants.fontFamily,
                        fontWeight:
                        FontWeightManager.light)),



              ],),

              Divider( color:  ColorManager.grey,thickness: .5.w,),

              Row(
                children: [
                Icon(Icons.calendar_month,size: 20.r,) ,
                SizedBox(width: 5.w,),
                Text(widget.viewModel.userModel.dob ?? '',
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
                Icon(Icons.add_location_rounded,size: 20.r) ,
                SizedBox(width: 5.w,),
                Text(widget.viewModel.userModel.address ?? '',
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
                Icon(Icons.flag,size: 20.r) ,
                SizedBox(width: 5.w,),
                Text(widget.viewModel.userModel.country ?? '',
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
                Icon(Icons.home,size: 20.r) ,
                SizedBox(width: 5.w,),
                Text(widget.viewModel.userModel.emergencyContract ?? '',
                    style: TextStyle(
                        color: ColorManager.grey,
                        fontSize: 14.sp,
                        letterSpacing: 0,
                        fontFamily: FontConstants.fontFamily,
                        fontWeight:
                        FontWeightManager.light)),



              ],),

              Divider( color:  ColorManager.grey,thickness: .5.w,),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Icon(Icons.contact_page,size: 20.r,) ,
                SizedBox(width: 5.w,),
               Flexible(child:  Text(widget.viewModel.userModel.about ?? '',

                   maxLines: 6,
                   style: TextStyle(
                       color: ColorManager.grey,
                       fontSize: 14.sp,
                       letterSpacing: 0,
                       fontFamily: FontConstants.fontFamily,
                       fontWeight:
                       FontWeightManager.light))),



              ],),




            ],
          ),
        ),

        SizedBox(height: 15.h,),

        Center(
          child: ElevatedButton(

            style:  getElevationButtonStyle( bgColor: ColorManager.orange_1),

            onPressed: () {
              _appPreferences.removeUser();
              _appPreferences.setIsUserLoggedIn(false);
              Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);


            },

            child:  Text("Logout", style: getElevationButtonTextStyle(),
            ),
          ),

        )

      ],
    );

  }
}
