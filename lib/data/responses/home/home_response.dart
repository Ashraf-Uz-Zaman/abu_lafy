import 'package:abu_lafy/data/responses/base/base_response.dart';
import 'package:abu_lafy/data/responses/user/user_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'home_response.g.dart';


@JsonSerializable()
class HomeResponse extends BaseResponse{
  @JsonKey(name: "data")
  List<PostResponse>? data = [];

  HomeResponse(this.data);

  //from json
  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);

}


@JsonSerializable()
class PostResponse{
  @JsonKey(name: "Id")
  int? Id;
  @JsonKey(name: "Poster_Name")
  String? Poster_Name;
  @JsonKey(name: "Poster_Image")
  String? Poster_Image;
  @JsonKey(name: "Content")
  String? Content;
  @JsonKey(name: "Like")
  String? Like;
  @JsonKey(name: "Dislike")
  String? Dislike;
  @JsonKey(name: "Post_Time_Stamp")
  String? Post_Time_Stamp;


  PostResponse(this.Id,this.Poster_Name,this.Poster_Image,this.Content,this.Like,this.Dislike,this.Post_Time_Stamp);

  //from json
  factory PostResponse.fromJson(Map<String, dynamic> json) =>
      _$PostResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$PostResponseToJson(this);

}
