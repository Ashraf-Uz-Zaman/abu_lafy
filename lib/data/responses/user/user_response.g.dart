// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['phone'] as String?,
      json['password'] as String?,
      json['emergencyContract'] as String?,
      json['dob'] as String?,
      json['about'] as String?,
      json['address'] as String?,
      json['latitude'] as String?,
      json['longitude'] as String?,
      json['country'] as String?,
      json['image'] as String?,
      (json['userTypeId'] as num?)?.toInt(),
      json['userTypeLabel'] as String?,
      json['leagueLabel'] as String?,
      json['leagueImage'] as String?,
      json['leagueDesc'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['isActive'] as String?,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'password': instance.password,
      'emergencyContract': instance.emergencyContract,
      'dob': instance.dob,
      'about': instance.about,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'country': instance.country,
      'image': instance.image,
      'userTypeId': instance.userTypeId,
      'userTypeLabel': instance.userTypeLabel,
      'leagueLabel': instance.leagueLabel,
      'leagueImage': instance.leagueImage,
      'leagueDesc': instance.leagueDesc,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'isActive': instance.isActive,
    };
