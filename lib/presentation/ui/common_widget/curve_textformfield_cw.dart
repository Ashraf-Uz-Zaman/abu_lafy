import 'package:abu_lafy/presentation/resources/color_manager.dart';
import 'package:abu_lafy/presentation/resources/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


class CurveTextFormFieldCW extends StatelessWidget {

  final TextEditingController controller;
  final TextInputType inputType;
  final String hints;
  final String? prefixIcon;
  final String? suffixIcon;
  final bool? obscureText;
  final GestureTapCallback? onTap;


  const CurveTextFormFieldCW({Key? key, required this.controller,required this.inputType, required this.hints, this.prefixIcon, this.suffixIcon, this.obscureText, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
        keyboardType: TextInputType.phone,
        minLines: 1,
        maxLines: 1,
        obscureText: obscureText == null ? false : obscureText!,
        enableSuggestions: obscureText == null ? true : false,
        autocorrect: false,
        autofocus: false,
        style: TextStyle(color: ColorManager.black,fontSize: 12.sp, fontFamily: FontConstants.fontFamily,fontWeight: FontWeightManager.light),
        controller: controller,
        decoration: InputDecoration(
          hintText: hints,
          hintStyle: TextStyle(color: ColorManager.hints_grey,fontSize: 12.sp, fontFamily: FontConstants.fontFamily,fontWeight: FontWeightManager.light),

          prefixIcon: prefixIcon != null ? Padding(
            padding: EdgeInsets.symmetric(vertical: 22.5.h,horizontal: 20.w),
            child: SvgPicture.asset(prefixIcon!,height: 24.h,width: 24.w,),):null,
          prefixIconConstraints: prefixIcon != null ? BoxConstraints(
            minWidth: 24.w,
            minHeight: 24.h,

          ) : null,


          suffixIcon: suffixIcon != null ?
              GestureDetector(
                onTap: onTap,
                child: Padding(
                    padding: EdgeInsets.only(left:10.w,right: 20.w,top: 22.5.h,bottom: 22.5.h),
                    child:SvgPicture.asset(suffixIcon!,height: 24.h,width: 24.w)),
              )
              : null,
          suffixIconConstraints: suffixIcon != null ? BoxConstraints(
            minWidth: 24.w,
            minHeight: 24.h,

          ) : null,


          // Background Color
          fillColor: Colors.white,
          filled: true,

          // Border
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide:  BorderSide(
              width: 1.5.w,
              color: ColorManager.orange_1,

            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
        )
    );

  }
}