// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetailsResponse _$UserDetailsResponseFromJson(Map<String, dynamic> json) =>
    UserDetailsResponse(
      json['Name'] as String?,
      json['Phone'] as String?,
      json['Emergency_Contract'] as String?,
      json['Date_Of_Birth'] as String?,
      json['Address'] as String?,
      (json['Latitude'] as num?)?.toDouble(),
      (json['Longitude'] as num?)?.toDouble(),
      json['Country'] as String?,
      (json['UserType'] as num?)?.toInt(),
      json['Profile_Picture_URL'] as String?,
      json['Is_Active'] as String?,
    );

Map<String, dynamic> _$UserDetailsResponseToJson(
        UserDetailsResponse instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Phone': instance.phone,
      'Emergency_Contract': instance.emergencyContract,
      'Date_Of_Birth': instance.dob,
      'Address': instance.address,
      'Latitude': instance.latitude,
      'Longitude': instance.longitude,
      'Country': instance.country,
      'UserType': instance.userType,
      'Profile_Picture_URL': instance.profilePictureURL,
      'Is_Active': instance.isActive,
    };
