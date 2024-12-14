import 'package:abu_lafy/presentation/resources/color_manager.dart';
import 'package:abu_lafy/presentation/resources/font_manager.dart';
import 'package:abu_lafy/presentation/resources/styles_manager.dart';
import 'package:abu_lafy/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';


ThemeData getApplicationTheme() {
  return ThemeData(
      // main colors of the app
      primaryColor: ColorManager.ebony,
      primaryColorLight: ColorManager.primaryOpacity70,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.trout,
      // ripple color
      splashColor: ColorManager.primaryOpacity70,
      // will be used incase of disabled button for example
      hintColor: ColorManager.trout,
      colorScheme: ColorScheme.fromSwatch(accentColor: ColorManager.trout),
      scaffoldBackgroundColor: ColorManager.ebony,
      // card view theme
      cardTheme: CardTheme(
          color: ColorManager.white,
          shadowColor: ColorManager.trout,
          elevation: AppSize.s4),
      // App bar theme
      appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: AppSize.s4,
          shadowColor: ColorManager.ebony,
          backgroundColor: ColorManager.ebony,
          surfaceTintColor: ColorManager.ebony,
          titleTextStyle: getRegularStyle(
              color: ColorManager.white, fontSize: FontSize.s20)),
      // Button theme
      buttonTheme: ButtonThemeData(
          shape: const StadiumBorder(),
          disabledColor: ColorManager.grey1,
          buttonColor: ColorManager.ebony,
          splashColor: ColorManager.primaryOpacity70),

      // elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              minimumSize: Size(AppSize.eb_min_w,  AppSize.eb_min_h),
              textStyle: getElevationButtonTextStyle(),
              foregroundColor: ColorManager.white,
              backgroundColor: ColorManager.seaBuckthorn,

              shape: RoundedRectangleBorder(
                  side:BorderSide.none,
                  borderRadius: BorderRadius.circular(AppSize.eb_r)))),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor:ColorManager.white,
        disabledBackgroundColor: Colors.grey
      )
    ),
    // outlined button theme
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            textStyle: getRegularStyle(fontSize: FontSize.s12,color: ColorManager.ebony),
            backgroundColor: ColorManager.white,
            side: BorderSide(width: 2, color: ColorManager.ebony),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s4),))),


    /// Text theme
      textTheme: TextTheme(

        //displayLarge for Text
        displayLarge: getBoldStyle(color: ColorManager.white, fontSize: FontSize.s40),


        // displayMedium instead headline2
        displayMedium: getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16),
        // displaySmall instead headline3
        displaySmall: getBoldStyle(color: ColorManager.ebony, fontSize: FontSize.s16),

        // headlineMedium instead headline4
        headlineMedium: getRegularStyle(
            color: ColorManager.white, fontSize: FontSize.s15),
        // titleMedium instead subtitle1
        titleMedium: getMediumStyle(
            color: ColorManager.trout, fontSize: FontSize.s14),
        // titleSmall instead subtitle2
        titleSmall:
            getMediumStyle(color: ColorManager.ebony, fontSize: FontSize.s14),


        // bodyMedium instead bodyText2
        bodyMedium: getRegularStyle(fontSize: FontSize.s12, color: ColorManager.trout),
        // bodySmall instead caption
        bodySmall: getMediumStyle(color: ColorManager.trout),
        // bodyLarge instead bodyText1
        bodyLarge: getBoldStyle(fontSize: FontSize.s20, color: ColorManager.white),
      ),



      /// input decoration theme (text form field)
      inputDecorationTheme: InputDecorationTheme(
        contentPadding:  EdgeInsets.all(AppPadding.p8),
        // hint style
        hintStyle: getTextFormFieldHintsStyle(),

        // label style
        labelStyle: getMediumStyle(color: ColorManager.trout),
        // error style
        errorStyle: getErrorTextStyle(),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.r20),
          borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
  )),

        // enabled border
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.r20),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),

        // focused border
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.r20),
          borderSide:  BorderSide(
              width: AppSize.w1_5,
              color: ColorManager.seaBuckthorn,
              style: BorderStyle.solid

          ),
        ),

        // error border
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.r20),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            )),
        // focused error border
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.r20),
          borderSide:  BorderSide(
              width: AppSize.w1_5,
              color: ColorManager.seaBuckthorn,
              style: BorderStyle.solid

          ),
        ),
        // focused error border
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.r20),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
      ),


  );


}
