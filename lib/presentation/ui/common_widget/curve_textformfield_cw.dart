import 'package:abu_lafy/presentation/resources/color_manager.dart';
import 'package:abu_lafy/presentation/resources/font_manager.dart';
import 'package:abu_lafy/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';


class CurveTextFormFieldCW extends StatelessWidget {

  final TextEditingController controller;
  final TextInputType inputType;
  final String hints;
  final String? prefixIcon;
  final String? suffixIcon;
  final bool? obscureText;
  final GestureTapCallback? onTap;


  const CurveTextFormFieldCW({super.key, required this.controller,required this.inputType, required this.hints, this.prefixIcon, this.suffixIcon, this.obscureText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
        keyboardType: inputType,
        minLines: 1,
        maxLines: 1,
        obscureText: obscureText == null ? false : obscureText!,
        enableSuggestions: obscureText == null ? true : false,
        autocorrect: false,
        autofocus: false,
        style: TextStyle(color: ColorManager.black,fontSize: FontSize.s12, fontFamily: FontConstants.fontFamily,fontWeight: FontWeightManager.light),
        controller: controller,
        decoration: InputDecoration(
          hintText: hints,
          hintStyle: TextStyle(color: ColorManager.hints_grey,fontSize: FontSize.s12, fontFamily: FontConstants.fontFamily,fontWeight: FontWeightManager.light),

          prefixIcon: prefixIcon != null ? Padding(
            padding: EdgeInsets.symmetric(vertical: AppPadding.ph_22_5,horizontal: AppPadding.pw_22_5),
            child: SvgPicture.asset(prefixIcon!,height: AppSize.h24,width: AppSize.w24,),):null,
          prefixIconConstraints: prefixIcon != null ? BoxConstraints(
            minWidth: AppSize.w24,
            minHeight: AppSize.h24,

          ) : null,


          suffixIcon: suffixIcon != null ?
              GestureDetector(
                onTap: onTap,
                child: Padding(
                    padding: EdgeInsets.only(left:AppPadding.pw_10,right: AppPadding.pw_20,top: AppPadding.ph_22_5,bottom:AppPadding.ph_22_5),
                    child:SvgPicture.asset(suffixIcon!,height: AppSize.h24,width: AppSize.w24)),
              )
              : null,
          suffixIconConstraints: suffixIcon != null ? BoxConstraints(
            minWidth: AppSize.w24,
            minHeight: AppSize.h24,

          ) : null,


          // Background Color
          fillColor: Colors.white,
          filled: true,

          // Border
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.r20),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.r20),
            borderSide:  BorderSide(
              width: AppSize.w1_5,
              color: ColorManager.orange_1,

            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.r20),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.r20),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
        )
    );

  }
}