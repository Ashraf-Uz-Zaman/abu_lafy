import 'package:abu_lafy/presentation/resources/assets_manager.dart';
import 'package:abu_lafy/presentation/resources/color_manager.dart';
import 'package:abu_lafy/presentation/resources/font_manager.dart';
import 'package:abu_lafy/presentation/resources/strings_manager.dart';
import 'package:abu_lafy/presentation/resources/values_manager.dart';
import 'package:abu_lafy/presentation/ui/common_widget/common.dart';
import 'package:abu_lafy/presentation/ui/main/event/event.dart';
import 'package:abu_lafy/presentation/ui/main/home/home.dart';
import 'package:abu_lafy/presentation/ui/main/profile/profile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late final HomeView _homeView;
  late final EventView _eventView;
  late final ProfileView _profileView;
  late  List<Widget> pages = [];

  @override
  void initState() {
    _homeView = const HomeView();
    _eventView = const EventView();
    _profileView = const ProfileView();
    pages = [
      _homeView,

      const Center(
        child: Text("Message"),
      ),
      _eventView,
     const Center(
        child: Text("Notifiaction"),
      ),
      _profileView
    ];
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  var _title = AppStrings.home.tr();
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        surfaceTintColor: ColorManager.primary,
        leading: const Image(image: AssetImage(ImageAssets.appbarLogo)),
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(_title,
                  style: TextStyle(
                      color: ColorManager.white,
                      fontSize: 20.sp,
                      fontFamily: FontConstants.fontFamily,
                      fontWeight: FontWeightManager.regular)),
              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 20.w),
                child: getCircularCacheImage( "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyvetnLOz5AF4JPJGxqw0EJpwpBHl9swwqww&s",50.h,50.w),
              ),
            ],
          )
        ],
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorManager.primary,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImageAssets.icHome,
                height: 26.67.h,
                width: 26.67.w,
              ),
              activeIcon: _getActiveIcon(
                SvgPicture.asset(
                  ImageAssets.icActiveHome,
                  height: 26.67.h,
                  width: 26.67.w,
                ),
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImageAssets.icEvent,
                height: 26.67.h,
                width: 26.67.w,
              ),
              activeIcon: _getActiveIcon(
                SvgPicture.asset(
                  ImageAssets.icActiveEvent,
                  height: 26.67.h,
                  width: 26.67.w,

                ),
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImageAssets.icPlusCircle,
                height: 53.67.h,
                width: 53.67.w,
              ),
              activeIcon:
                SvgPicture.asset(
                  ImageAssets.icActivePlusCircle,
                  height: 53.67.h,
                  width: 53.67.w,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImageAssets.icPerformance,
                height: 26.67.h,
                width: 24.w,
              ),
              activeIcon: _getActiveIcon(
                SvgPicture.asset(
                  ImageAssets.icActivePerformance,
                  height: 26.67.h,
                  width: 24.w,
                ),
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImageAssets.icProfile,
                height: 29.33.h,
                width: 29.33.w,
              ),
              activeIcon: _getActiveIcon(
                SvgPicture.asset(
                  ImageAssets.icActiveProfile,
                  height: 29.33.h,
                  width: 29.33.w,
                ),
              ),
              label: ""),
        ],
      ),
    );
  }

  _getActiveIcon(icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icon,
        SizedBox(
          height: 6.67.h,
        ),
        SvgPicture.asset(
          ImageAssets.icDot,
          height: 8.h,
          width: 8.w,
        ),
      ],
    );
  }

  onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
