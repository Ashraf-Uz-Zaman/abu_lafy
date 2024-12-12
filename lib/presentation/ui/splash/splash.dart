import 'dart:async';

import 'package:abu_lafy/application/app_preferences.dart';
import 'package:abu_lafy/application/dependency_injection.dart';
import 'package:abu_lafy/presentation/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:abu_lafy/presentation/resources/routes_manager.dart';



class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  Timer? _timer;
  bool _isLoggedIn = false;

  void _initData() async{
    _isLoggedIn =  await _appPreferences.getIsUserLoggedIn();
  }

  _startDelay(){
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }
  _goNext() {
    _isLoggedIn ?   Navigator.pushReplacementNamed(context, Routes.mainRoute) : Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);

  }

  @override
  void initState() {
    super.initState();
    _initData();
    _startDelay();

  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(child: Image(image: AssetImage(ImageAssets.splashLogo),),
      ),
    );
  }
}
