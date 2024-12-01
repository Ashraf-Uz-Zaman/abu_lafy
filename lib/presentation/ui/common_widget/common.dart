import 'package:abu_lafy/presentation/resources/color_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget getCircularCacheImage( String imageUrl, double height, double width ){
  return CachedNetworkImage(
    height: height,
    width: width,
    imageUrl: imageUrl,
    imageBuilder: (context, imageProvider) =>
        CircleAvatar(
          radius: 50.r,
          backgroundColor: Colors.green,
          child:  Padding(padding:  EdgeInsets.all(1.5.r)
              ,child: CircleAvatar(
            radius: 50.r,
            backgroundImage: imageProvider,

          ),)

        ),
    placeholder: (context, url) => CircleAvatar(
      radius: 50.r,
      backgroundColor: Colors.grey,
    ),
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}




