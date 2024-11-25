import 'package:abu_lafy/application/dependency_injection.dart';
import 'package:abu_lafy/presentation/resources/strings_manager.dart';
import 'package:abu_lafy/presentation/ui/confirm/confirm.dart';
import 'package:abu_lafy/presentation/ui/forget_password/forget_password.dart';
import 'package:abu_lafy/presentation/ui/login/login.dart';
import 'package:abu_lafy/presentation/ui/main/main.dart';
import 'package:abu_lafy/presentation/ui/onboard/onboard.dart';
import 'package:abu_lafy/presentation/ui/common_widget/otp/otp.dart';
import 'package:abu_lafy/presentation/ui/registration/registration.dart';
import 'package:abu_lafy/presentation/ui/splash/splash.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


class Routes {
   static const String splashRoute = "/";
   static const String onBoardingRoute = "/onBoarding";
   static const String loginRoute = "/login";
   static const String otpRoute = "/otp";
   static const String registerRoute = "/register";
   static const String forgotPasswordRoute = "/forgotPassword";
   static const String confirmRoute = "/confirm";
   static const String mainRoute = "/main";
   static const String eventDetailsRoute = "/main/event_details";
   // static const String storDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRoute:
        initRegistrationModule();
        return MaterialPageRoute(builder: (_) => const RegistrationView());

      case Routes.forgotPasswordRoute:
        initForgetPasswordModule();
        return MaterialPageRoute(builder: (_) => const ForgetPasswordView());

      case Routes.confirmRoute:

        return MaterialPageRoute(builder: (_) => const ConfirmView());
      case Routes.mainRoute:

        return MaterialPageRoute(builder: (_) => const MainView());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.noRouteFound).tr(),
          ),
          body: Center(child: const Text(AppStrings.noRouteFound).tr()),
        ));
  }
}