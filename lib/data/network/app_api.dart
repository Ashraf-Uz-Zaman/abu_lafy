
import 'package:abu_lafy/data/responses/base/base_response.dart';
import 'package:abu_lafy/data/responses/common/common_response.dart';
import 'package:abu_lafy/domain/request/request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:abu_lafy/application/constant.dart';
import 'package:abu_lafy/data/responses/login/login_response.dart';
part 'app_api.g.dart';


@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/login")
  Future<LoginResponse> login(
      @Field("Phone") String phone,
      @Field("Password") String password,
      @Field("Fcm_token") String fcmToken,
      @Field("Device_Type") String Device_Type
      );


  @POST("/common")
  Future<CommonResponse> registration(
      @Field("Name") String name,
      @Field("Password") String password,
      @Field("Phone") String phone
      );

  @POST("/forgot")
  Future<CommonResponse> forgot(
      @Field("Phone") String phone,
      @Field("Password") String password,
      );
}
