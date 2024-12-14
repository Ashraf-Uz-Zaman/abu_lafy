
import 'package:abu_lafy/application/app_preferences.dart';
import 'package:abu_lafy/application/dependency_injection.dart';
import 'package:abu_lafy/domain/model/user_model.dart';
import 'package:abu_lafy/presentation/resources/color_manager.dart';
import 'package:abu_lafy/presentation/resources/font_manager.dart';
import 'package:abu_lafy/presentation/resources/strings_manager.dart';
import 'package:abu_lafy/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _addressController =
      TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _emergencyController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  late UserModel userModel;
  getData() async{
    userModel = await _appPreferences.getUser();
    _nameController.text = userModel.name!;
    _dobController.text = userModel.dob!;
    _aboutController.text = userModel.address!;
    _countryController.text = userModel.country!;
    _emergencyController.text = userModel.emergencyContract!;
    _addressController.text = userModel.address!;
  }
  _bind() {

  }


  @override
  void initState() {
    _bind();
    getData();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back,color: Colors.white,),
          ),

          title:  Text(AppStrings.editProfile,
              style: TextStyle(
                  color: ColorManager.white,
                  fontSize: 20.sp,
                  fontFamily: FontConstants.fontFamily,
                  fontWeight: FontWeightManager.regular)),

        ),
        body: _getContentWidget());
  }

   _getContentWidget() {
    return  _getScrollWidget();

  }

  Widget _getScrollWidget(){
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: 750.h,
          child: Padding(padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 34.h),
            child:  Column(
              spacing: 8.h,

            children: [

              _getTextFrom(AppStrings.name,_nameController,1,1),

              _getTextFrom(AppStrings.dob,_dobController,1,1),

              _getTextFrom(AppStrings.address,_addressController,1,1),

              _getTextFrom(AppStrings.country,_countryController,1,1),

              _getTextFrom(AppStrings.emergencyContract,_emergencyController,1,1),

              _getTextFrom(AppStrings.about,_aboutController,5,5),
              SizedBox(height: 35.h,),
              ElevatedButton(

                style:  ElevatedButton.styleFrom(
                    minimumSize: Size(AppSize.w380, 45.h),
                    backgroundColor: ColorManager.seaBuckthorn,
                    shape: RoundedRectangleBorder(
                      side:BorderSide.none,
                      borderRadius: BorderRadius.circular(8.r),)),

                onPressed: () {


                },

                child:  Text(AppStrings.submit, style: TextStyle(fontSize :FontSize.s16,fontFamily:  FontConstants.fontFamily, fontWeight: FontWeightManager.regular,color:  ColorManager.white),
                ),
              ),


            ],
          ),)
        ));
  }

  _getTextFrom(String value,TextEditingController controller,int minLine,int maxLine){
    return TextFormField(
        keyboardType: TextInputType.text,
        controller: controller,
        minLines: minLine ,
        maxLines: maxLine ,
        autocorrect: false,
        autofocus: false,
        inputFormatters: [
          LengthLimitingTextInputFormatter(320),
        ],


        style: TextStyle(color: ColorManager.white,fontSize: FontSize.s14, fontFamily: FontConstants.fontFamily,fontWeight: FontWeightManager.regular),

        decoration: InputDecoration(
          labelText: value,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle:  TextStyle(color: ColorManager.white,fontSize: FontSize.s14, fontFamily: FontConstants.fontFamily,fontWeight: FontWeightManager.regular),
          // Background Color
          hintText: value,


          errorText: '',

          border: _getOutlineInputBorder(),
          // enabled border
          enabledBorder: _getOutlineInputBorder(),
          // focused border
          focusedBorder: _getOutlineInputBorder(),
          // error border
          errorBorder: _getOutlineInputBorder(),
          // focused error border
          focusedErrorBorder: _getOutlineInputBorder(),
          // focused error border
          disabledBorder:_getOutlineInputBorder(),
        ),
        );

  }

  _getOutlineInputBorder(){
    return  OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide:   BorderSide(
          width: 1,
          color: ColorManager.white,
          style: BorderStyle.solid

      ),
    );
  }

}
