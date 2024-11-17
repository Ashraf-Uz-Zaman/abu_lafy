import 'package:abu_lafy/data/responses/base/base_response.dart';
import 'package:abu_lafy/data/responses/user/user_details_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';


@JsonSerializable()
class LoginResponse extends BaseResponse{
  @JsonKey(name: "data")
  UserDetailsResponse? data;

  LoginResponse(this.data);

  //from json
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

}
