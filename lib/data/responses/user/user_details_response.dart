import 'package:json_annotation/json_annotation.dart';
part 'user_details_response.g.dart';


@JsonSerializable()
class UserDetailsResponse{

  @JsonKey(name: "Name")
  String? name;
  @JsonKey(name: "Phone")
  String? phone;
  @JsonKey(name: "Emergency_Contract")
  String? emergencyContract;
  @JsonKey(name: "Date_Of_Birth")
  String? dob;
  @JsonKey(name: "Address")
  String? address;
  @JsonKey(name: "Latitude")
  double? latitude;
  @JsonKey(name: "Longitude")
  double? longitude;
  @JsonKey(name: "Country")
  String? country;
  @JsonKey(name: "UserType")
  int? userType;
  @JsonKey(name: "Profile_Picture_URL")
  String? profilePictureURL;
  @JsonKey(name: "Is_Active")
  String? isActive;


  UserDetailsResponse(
      this.name,
      this.phone,
      this.emergencyContract,
      this.dob,
      this.address,
      this.latitude,
      this.longitude,
      this.country,
      this.userType,
      this.profilePictureURL,
      this.isActive);


  //from json
  factory UserDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$UserDetailsResponseToJson(this);
}