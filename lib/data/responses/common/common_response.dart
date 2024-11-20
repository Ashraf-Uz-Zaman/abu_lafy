import 'package:abu_lafy/data/responses/base/base_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'common_response.g.dart';


@JsonSerializable()
class CommonResponse extends BaseResponse{

  CommonResponse();
  /// --- from json --- ///
  factory CommonResponse.fromJson(Map<String, dynamic> json) =>
      _$CommonResponseFromJson(json);

  /// --- to json --- ///
  Map<String, dynamic> toJson() => _$CommonResponseToJson(this);

}
