import 'package:json_annotation/json_annotation.dart';
part 'user_response.g.dart';


@JsonSerializable()
class UserResponse{
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "password")
  String? password;
  @JsonKey(name: "emergencyContract")
  String? emergencyContract;
  @JsonKey(name: "dob")
  String? dob;
  @JsonKey(name: "about")
  String? about;
  @JsonKey(name: "address")
  String? address;
  @JsonKey(name: "latitude")
  String? latitude;
  @JsonKey(name: "longitude")
  String? longitude;
  @JsonKey(name: "country")
  String? country;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "userTypeId")
  int? userTypeId;
  @JsonKey(name: "userTypeLabel")
  String? userTypeLabel;
  @JsonKey(name: "leagueLabel")
  String? leagueLabel;
  @JsonKey(name: "leagueImage")
  String? leagueImage;
  @JsonKey(name: "leagueDesc")
  String? leagueDesc;
  @JsonKey(name: "createdAt")
  String? createdAt;
  @JsonKey(name: "updatedAt")
  String? updatedAt;
  @JsonKey(name: "isActive")
  String? isActive;


  UserResponse(
      this.id,
      this.name,
      this.phone,
      this.password,
      this.emergencyContract,
      this.dob,
      this.about,
      this.address,
      this.latitude,
      this.longitude,
      this.country,
      this.image,
      this.userTypeId,
      this.userTypeLabel,
      this.leagueLabel,
      this.leagueImage,
      this.leagueDesc,
      this.createdAt,
      this.updatedAt,
      this.isActive);


  //from json
  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}