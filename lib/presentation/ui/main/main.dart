import 'package:abu_lafy/application/dependency_injection.dart';
import 'package:abu_lafy/domain/model/user_model.dart';
import 'package:abu_lafy/presentation/resources/assets_manager.dart';
import 'package:abu_lafy/presentation/resources/color_manager.dart';
import 'package:abu_lafy/presentation/resources/font_manager.dart';
import 'package:abu_lafy/presentation/resources/routes_manager.dart';
import 'package:abu_lafy/presentation/ui/common_widget/common.dart';
import 'package:abu_lafy/presentation/ui/main/event/event.dart';
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
  int _currentIndex = 0;

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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppbar(),
      body: pages[_currentIndex],
      drawer: _getDrawer(),
      bottomNavigationBar: Card(

        shape: const BeveledRectangleBorder(),
        color: ColorManager.ebony,
        elevation: 0,
        shadowColor: Colors.white,

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            InkWell(onTap: (){onTap(0);},

              splashColor: Colors.white12,
              customBorder:  const CircleBorder(),


              child: Padding(padding: EdgeInsets.all(15.r),
                child: _getIcon( ImageAssets.icHome,_currentIndex == 0),),
            ),
            InkWell(onTap: (){onTap(1);},
              splashColor: Colors.white12,
              customBorder:  const CircleBorder(),


              child: Padding(padding: EdgeInsets.all(15.r),
                child: _getIcon( ImageAssets.icEvent,_currentIndex == 1),),
            ),
            InkWell(onTap: (){onTap(2);},
              splashColor: Colors.white12,
              customBorder:  const CircleBorder(),


              child: Padding(padding: EdgeInsets.all(12.r),
                child:
                SvgPicture.asset(
                              ImageAssets.icPlusCircle,
                              height: 53.67.h,
                              width: 53.67.w,
                  colorFilter: ColorFilter.mode(_currentIndex == 2 ?ColorManager.seaBuckthorn: ColorManager.white, BlendMode.srcIn),
                            ),
                 ),),
            InkWell(onTap: (){onTap(3);},
              splashColor: Colors.white12,
              customBorder:  const CircleBorder(),


              child: Padding(padding: EdgeInsets.all(15.r),
                child: _getIcon( ImageAssets.icPerformance,_currentIndex == 3),),
            ),
            InkWell(onTap: (){onTap(4);},
              splashColor: Colors.white12,
              customBorder:  const CircleBorder(),


              child: Padding(padding: EdgeInsets.all(15.r),
                child: _getIcon( ImageAssets.icProfile,_currentIndex == 4),),
            ),

          ],
        ),
      )
    );
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


  _getIcon(String icon, bool active) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: active ? 7.h : 0,
      children: [
        SvgPicture.asset(
          icon,
          height: 26.67.h,
          width: 26.67.w,
          colorFilter: ColorFilter.mode(active ?ColorManager.seaBuckthorn: ColorManager.white, BlendMode.srcIn),
        ),

        active ? SvgPicture.asset(
          ImageAssets.icDot,
          height: 8.h,
          width: 8.w,
        ) : const SizedBox.shrink(),
      ],
    );
  }

  onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
