import 'package:abu_lafy/application/dependency_injection.dart';
import 'package:abu_lafy/domain/model/user_model.dart';
import 'package:abu_lafy/presentation/resources/assets_manager.dart';
import 'package:abu_lafy/presentation/resources/color_manager.dart';
import 'package:abu_lafy/presentation/resources/font_manager.dart';
import 'package:abu_lafy/presentation/resources/routes_manager.dart';
import 'package:abu_lafy/presentation/ui/common_widget/common.dart';
import 'package:abu_lafy/presentation/ui/main/event/event.dart';
import 'package:abu_lafy/presentation/ui/main/home/home.dart';
import 'package:abu_lafy/presentation/ui/main/main_viewmodel.dart';
import 'package:abu_lafy/presentation/ui/main/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
   createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final MainViewModel _viewModel = instance<MainViewModel>();

  //late final HomeView _homeView;
  late final EventView _eventView;
  late final ProfileView _profileView;
  late List<Widget> pages = [];

  @override
  void initState() {
    _viewModel.start();
   // _homeView = const HomeView();
    _eventView = const EventView();
    _profileView = ProfileView(viewModel: _viewModel);
    pages = [
      const Center(
        child: Text("Home"),
      ),
      const Center(
        child: Text("Message"),
      ),
      _eventView,
      const Center(
        child: Text("Notification"),
      ),
      _profileView
    ];
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppbar(),
      body: pages[_currentIndex],
      drawer: _getDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorManager.ebony,
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
              activeIcon: SvgPicture.asset(
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

  _getAppbar() {
    return AppBar(
      // leading: const Image(image: AssetImage(ImageAssets.appbarLogo)),
      iconTheme: const IconThemeData(color: Colors.white),

      actions: [
        StreamBuilder<UserModel>(
            stream: _viewModel.outputUserModel,
            initialData: UserModel(),
            builder: (context, snapShotUserModel) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(snapShotUserModel.data?.name ?? '',
                      style: TextStyle(
                          color: ColorManager.white,
                          fontSize: 20.sp,
                          fontFamily: FontConstants.fontFamily,
                          fontWeight: FontWeightManager.regular)),
                  Padding(
                    padding: EdgeInsets.only(left: 15.w, right: 20.w),
                    child: getCircularCacheImage(
                        snapShotUserModel.data?.image ?? '', 50.h, 50.w, 50.r),
                  ),
                ],
              );
            }),
      ],
    );
  }

  _getDrawer() {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          DrawerHeader(
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: ColorManager.ebony,

            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius:  45.r,
                  backgroundColor: ColorManager.grey,
                  child: const Image(image:  AssetImage(ImageAssets.appbarLogo)),
                ),

                SizedBox(height: 5.h,),


                Text(
                  'Abu Lafy Soccer',
                  style: TextStyle(fontSize: 18.sp, color: Colors.white,),
                ),
              ],
            ), //UserAccountDrawerHeader
          ), //Draw



          ListTile(
            leading:  Icon(Icons.verified_user_sharp,color: ColorManager.ebony,),
            title:  Text('Players ',style: TextStyle(
                color: ColorManager.ebony,
                fontSize: 18.sp,
                letterSpacing: 0,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.semiBold)),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed(Routes.playersRoute);

            },
          ),

          ListTile(
            leading:  Icon(Icons.edit,color: ColorManager.ebony,),
            title:  Text('Edit Profile ',style: TextStyle(
    color: ColorManager.ebony,
    fontSize: 18.sp,
    letterSpacing: 0,
    fontFamily: FontConstants.fontFamily,
    fontWeight: FontWeightManager.semiBold)),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed(Routes.editRoute);
            },
          ),
          ListTile(
            leading:  Icon(Icons.logout,color: ColorManager.ebony,),
            title: Text('LogOut',
                style: TextStyle(
                    color: ColorManager.ebony,
                    fontSize: 18.sp,
                    letterSpacing: 0,
                    fontFamily: FontConstants.fontFamily,
                    fontWeight: FontWeightManager.semiBold)),
            onTap: () {
              Navigator.pop(context);

              _viewModel.appPreferences.removeUser();
              _viewModel.appPreferences.setIsUserLoggedIn(false);
              Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
            },
          ),
        ],
      ),
    );
  }
}
