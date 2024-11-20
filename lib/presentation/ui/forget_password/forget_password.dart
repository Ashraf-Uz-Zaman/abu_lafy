import 'package:abu_lafy/presentation/resources/assets_manager.dart';
import 'package:abu_lafy/presentation/resources/color_manager.dart';
import 'package:abu_lafy/presentation/resources/font_manager.dart';
import 'package:abu_lafy/presentation/resources/routes_manager.dart';
import 'package:abu_lafy/presentation/resources/strings_manager.dart';
import 'package:abu_lafy/presentation/ui/common_widget/curve_textformfield_cw.dart';
import 'package:abu_lafy/presentation/ui/common_widget/otp_cw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';



class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {

  final TextEditingController _phoneController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _passwordConfirmController =
  //     TextEditingController();
  bool isOtp = false;
  final List<TextEditingController> _controllers = List.generate(6, (_) => TextEditingController());

  _bind() {

  }

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {

    for (var controller in _controllers) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return _getContentWidget();

    return  Scaffold(
        backgroundColor: ColorManager.primary,
        body: SafeArea(
          child: isOtp ?
            OtpCW(controllers: _controllers, ctx: context,widgets: widget,
            ) : Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Positioned(
                  top: 125.h,
                  left: 26.w,
                  child: Text(AppStrings.titleForgetPassword,
                      style: Theme.of(context).textTheme.displayLarge)
              ),
              Positioned(
                  top: 268.h,
                  left: 24.w,
                  right: 24.w,
                  child: CurveTextFormFieldCW(
                      controller: _phoneController,
                      inputType: TextInputType.phone,
                      hints: AppStrings.mobileNumber,
                      prefixIcon: ImageAssets.icPhone)),

              Positioned(
                top: 356.h,
                left: 27.w,
                child: Text(
                  AppStrings.weWillSent,
                  style: TextStyle(
                      color: ColorManager.white,
                      fontSize: 12.sp,
                      fontFamily: FontConstants.fontFamily,
                      fontWeight: FontWeightManager.light),
                ),
              ),


              Positioned(
                  top: 428.h,
                  left: 24.w,
                  right: 28.w,

                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppStrings.sentCode,
                            style: TextStyle(
                                color: ColorManager.white,
                                fontSize: 25.sp,
                                fontFamily: FontConstants.fontFamily,
                                fontWeight: FontWeightManager.bold)),
                        SizedBox(
                            width: 60.w,
                            height: 60.h,
                            child:
                            IconButton(onPressed: (){
                              isOtp = true;
                              setState(() {

                              });
                            },
                              style: IconButton.styleFrom(backgroundColor: ColorManager.orange_1),
                              icon: SvgPicture.asset(ImageAssets.icArrowRight,height: 26.h,width: 26.w,),
                            )

                        ),
                      ])),


            ],
          ),
        ));
  }

}
