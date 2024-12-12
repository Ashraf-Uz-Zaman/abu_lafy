// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayersBaseResponse _$PlayersBaseResponseFromJson(Map<String, dynamic> json) =>
    PlayersBaseResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => PlayersResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$PlayersBaseResponseToJson(
        PlayersBaseResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

PlayersResponse _$PlayersResponseFromJson(Map<String, dynamic> json) =>
    PlayersResponse(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['image'] as String?,
      json['phone'] as String?,
      (json['userType_id'] as num?)?.toInt(),
      json['userType_label'] as String?,
      json['isActive'] as String?,
      json['created_at'] as String?,
    );

Map<String, dynamic> _$PlayersResponseToJson(PlayersResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'phone': instance.phone,
      'userType_id': instance.userType_id,
      'userType_label': instance.userType_label,
      'isActive': instance.isActive,
      'created_at': instance.created_at,
    };
