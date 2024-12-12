
import 'dart:async';

import 'package:abu_lafy/application/dependency_injection.dart';
import 'package:abu_lafy/domain/model/players_model.dart';
import 'package:abu_lafy/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:abu_lafy/presentation/resources/color_manager.dart';
import 'package:abu_lafy/presentation/resources/font_manager.dart';
import 'package:abu_lafy/presentation/ui/common_widget/common.dart';
import 'package:abu_lafy/presentation/ui/players/players_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayersView extends StatefulWidget {
  const PlayersView({super.key});

  @override
  createState() => _PlayersViewState();
}

class _PlayersViewState extends State<PlayersView> {

  final PlayersViewModel _viewModel = instance<PlayersViewModel>();

  _bind() {
    _viewModel.start();
    _startDelay();

  }
  Timer? _timer;


  _startDelay(){
    _timer = Timer( const Duration(seconds: 0),_goNext);
  }

  _goNext() {
    _viewModel.players(context);
  }

  @override
  void initState() {
    _bind();
    super.initState();

  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.primary,
        appBar: AppBar(
          backgroundColor: ColorManager.primary,
          surfaceTintColor: ColorManager.primary,
          leading: InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back,color: Colors.white,),
          ),

          title:  Text('Players List',
              style: TextStyle(
                  color: ColorManager.white,
                  fontSize: 20.sp,
                  fontFamily: FontConstants.fontFamily,
                  fontWeight: FontWeightManager.regular)),

        ),
        body:  StreamBuilder<FlowState>(
          stream: _viewModel.outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                    () {
                  // _viewModel.login(context);
                }) ??
                _getContentWidget();
          },
        ));
  }

  _getContentWidget() {
    return  _getListWidget();

  }

  _getListWidget(){

    return

      StreamBuilder<List<PlayersModel>>(
        stream: _viewModel.outputPlayersList,
        initialData: [],
        builder: (context, snapShot) {
      return

        ListView.builder(
      itemCount: snapShot.data?.length ?? 0,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: ColorManager.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Padding(padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 24.w)
            ,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                getCircularCacheImage(snapShot.data?[index].image ?? '', 40.h, 40.w, 40.r),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(snapShot.data?[index].name ?? '',style: TextStyle(
                        color: ColorManager.white,
                        fontSize: 16.sp,
                        fontFamily: FontConstants.fontFamily,
                        fontWeight: FontWeightManager.regular),),
                    Text(snapShot.data?[index].phone ?? '',style: TextStyle(
                        color: ColorManager.white,
                        fontSize: 14.sp,
                        fontFamily: FontConstants.fontFamily,
                        fontWeight: FontWeightManager.regular),)
                  ],
                ),
                Icon(Icons.verified_rounded,color: Colors.greenAccent)
              ],
            ),),
        );});
      },
    );
  }



}
