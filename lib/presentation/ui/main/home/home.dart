import 'package:abu_lafy/application/dependency_injection.dart';
import 'package:abu_lafy/domain/model/post_model.dart';
import 'package:abu_lafy/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:abu_lafy/presentation/resources/assets_manager.dart';
import 'package:abu_lafy/presentation/resources/color_manager.dart';
import 'package:abu_lafy/presentation/resources/font_manager.dart';
import 'package:abu_lafy/presentation/resources/strings_manager.dart';
import 'package:abu_lafy/presentation/resources/styles_manager.dart';
import 'package:abu_lafy/presentation/ui/common_widget/item_text_home_cw.dart';
import 'package:abu_lafy/presentation/ui/main/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final HomeViewModel _viewModel = instance<HomeViewModel>();
  final TextEditingController _contentController = TextEditingController();

  @override
  void initState() {
    _viewModel.start();
    _contentController.addListener(() => _viewModel.setContentText(_contentController.text));

    super.initState();
    _viewModel.home(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlowState>(
      stream: _viewModel.outputState,
      builder: (context, snapshot) {
        return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                () {
              // _viewModel.login(context);
            }) ??
            _getContentWidget();
      },
    );
  }


  Widget _getContentWidget() {
    return Stack(
      children: [
        Positioned(
            left: 19.w,
            right: 19.w,
            top: 10.w,
            child: Container(
                padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 24.h),
                height: 120.h,
                decoration: BoxDecoration(
                    color: ColorManager.grey,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24.r),
                        bottomRight: Radius.circular(24.r),
                        topLeft: Radius.zero,
                        topRight: Radius.zero)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        _getBottomSheet(context,_contentController,_viewModel);
                      },
                      child: SizedBox(
                          height: 34.h,
                          width: double.infinity,
                          child: Text(
                            AppStrings.whatOnYourMind,
                            style: TextStyle(
                                color: ColorManager.grey_whats,
                                fontSize: 15.sp,
                                fontFamily: FontConstants.fontFamily,
                                fontWeight: FontWeightManager.regular),
                          )),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    SizedBox(
                      width: 106.61.w,
                      height: 34.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorManager.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.83.w, vertical: 0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r))),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              ImageAssets.icCamera,
                              height: 12.h,
                              width: 13.w,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text("Photo",
                                style: TextStyle(
                                    color: ColorManager.black,
                                    fontSize: 12.sp,
                                    fontFamily: FontConstants.fontFamily,
                                    fontWeight: FontWeightManager.medium))
                          ],
                        ),
                      ),
                    )
                  ],
                ))),
        Positioned(
            top: 145.h,
            right: 0,
            left: 0,
            child: StreamBuilder<List<PostModel>>(
                stream: _viewModel.outputListPostModel,
                initialData: [],
                builder: (context, snapShot) {
                  return  ListView.builder(
                    shrinkWrap : true,
                      scrollDirection: Axis.vertical,
                      itemCount: snapShot.data?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(padding: EdgeInsets.only(
                            left: 24.w, right: 24.w, top: 5.h,bottom: 5.h),
                        child : ItemTextHomeCw(imageUrl: snapShot.data?[index].Poster_Image ?? '',
                            posterName: snapShot.data?[index].Poster_Name ?? '',
                            content: snapShot.data?[index].Content.toString() ?? '',
                            like: snapShot.data?[index].Like.toString() ?? '0',
                            dislike: snapShot.data?[index].Dislike.toString() ?? '0', timeStamp: snapShot.data?[index].Post_Time_Stamp.toString() ?? '0 Second ago', onLike: () {  }, onDisLike: () {  },));
                      });
                }))
      ],
    );
  }


}

 _getBottomSheet(BuildContext context, TextEditingController contentController,HomeViewModel viewModel){
  return  showMaterialModalBottomSheet(
    enableDrag: false,
    context: context,
    builder: (context) {
      return SafeArea(child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 15.w, vertical: 7.5.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceBetween,
              children: [
                IconButton(onPressed: () {
                  Navigator.of(context).pop();
                }, icon: const Icon(Icons.close)),

                ElevatedButton(

                  style: ElevatedButton.styleFrom(
                      textStyle: getRegularStyle(
                          fontSize: FontSize.s20,
                          color: ColorManager.white),
                      backgroundColor: ColorManager
                          .seaBuckthorn,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius
                              .circular(5.r))),

                  onPressed: () {
                    viewModel.home(context);
                    Navigator.of(context).pop();
                  },

                  child: Text("POST", style: TextStyle(
                      color: ColorManager.white,
                      fontSize: 15.sp,
                      fontFamily: FontConstants
                          .fontFamily,
                      fontWeight: FontWeightManager
                          .semiBold)),
                ),

              ],
            ),
            SizedBox(height: 2.5.w,),
            Divider(color: ColorManager.grey,),
            SizedBox(height: 7.5.w,),
            TextFormField(
              controller: contentController,
              minLines: 6,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              style: TextStyle(
                  color: ColorManager.black,
                  fontSize: FontSize.s20,
                  fontFamily: FontConstants.fontFamily,
                  fontWeight: FontWeightManager.regular),
              decoration: InputDecoration(
                  hintText: "Whats on your mind ?",
                  hintStyle: TextStyle(
                      color: ColorManager.grey,
                      fontSize: FontSize.s20,
                      fontFamily: FontConstants
                          .fontFamily,
                      fontWeight: FontWeightManager
                          .regular),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none
              ),


            )
          ],
        ),));
    },
  );
}

