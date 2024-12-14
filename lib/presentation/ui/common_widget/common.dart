import 'package:abu_lafy/presentation/resources/color_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget getCircularCacheImage( String imageUrl, double height, double width,double? radius ){
  return CachedNetworkImage(
    height: height,
    width: width,
    imageUrl: imageUrl,
    imageBuilder: (context, imageProvider) =>
        CircleAvatar(
          backgroundColor: Colors.green,
          child:  Padding(padding:  EdgeInsets.all(1.5.r)
              ,child: CircleAvatar(
            radius: radius ?? 50.r,
            backgroundImage: imageProvider,
              backgroundColor: ColorManager.seaBuckthorn,
          ),)

        ),
    placeholder: (context, url) => CircleAvatar(
      radius: radius ?? 50.r,
      backgroundColor: Colors.grey,
    ),
    errorWidget: (context, url, error) =>CircleAvatar(
      radius: radius ?? 50.r,
      backgroundColor: Colors.grey,
      child: const Icon(Icons.person_2_rounded,color: Colors.white,),
    ) ,
  );
}

getSuccessToast(){
  return Fluttertoast.showToast(
      msg: "Success",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0
  );
}

getFailToast(String error){
  return Fluttertoast.showToast(
      msg: error,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}




