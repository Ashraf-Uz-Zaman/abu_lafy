// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) => HomeResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => PostResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$HomeResponseToJson(HomeResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

PostResponse _$PostResponseFromJson(Map<String, dynamic> json) => PostResponse(
      (json['Id'] as num?)?.toInt(),
      json['Poster_Name'] as String?,
      json['Poster_Image'] as String?,
      json['Content'] as String?,
      json['Like'] as String?,
      json['Dislike'] as String?,
      json['Post_Time_Stamp'] as String?,
    );

Map<String, dynamic> _$PostResponseToJson(PostResponse instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'Poster_Name': instance.Poster_Name,
      'Poster_Image': instance.Poster_Image,
      'Content': instance.Content,
      'Like': instance.Like,
      'Dislike': instance.Dislike,
      'Post_Time_Stamp': instance.Post_Time_Stamp,
    };
