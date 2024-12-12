import 'package:abu_lafy/data/responses/base/base_response.dart';
import 'package:abu_lafy/data/responses/player/player_response.dart';
import 'package:abu_lafy/data/responses/user/user_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'player_response.g.dart';


@JsonSerializable()
class PlayersBaseResponse extends BaseResponse{
  @JsonKey(name: "data")
  List<PlayersResponse>? data = [];

  PlayersBaseResponse(this.data);

  //from json
  factory PlayersBaseResponse.fromJson(Map<String, dynamic> json) =>
      _$PlayersBaseResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$PlayersBaseResponseToJson(this);

}


@JsonSerializable()
class PlayersResponse{
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "userType_id")
  int? userType_id;
  @JsonKey(name: "userType_label")
  String? userType_label;
  @JsonKey(name: "isActive")
  String? isActive;
  @JsonKey(name: "created_at")
  String? created_at;


  PlayersResponse(this.id,
      this.name,
      this.image,
      this.phone,
      this.userType_id,
      this.userType_label,
      this.isActive,
      this.created_at);

  //from json
  factory PlayersResponse.fromJson(Map<String, dynamic> json) =>
      _$PlayersResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$PlayersResponseToJson(this);

}
