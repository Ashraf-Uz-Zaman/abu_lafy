
import 'package:abu_lafy/data/responses/base/base_response.dart';
import 'package:abu_lafy/data/responses/common/common_response.dart';
import 'package:abu_lafy/data/responses/home/home_response.dart';
import 'package:abu_lafy/data/responses/player/player_response.dart';
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


  @POST("/registration")
  Future<CommonResponse> registration(
      @Field("Name") String name,
      @Field("Password") String password,
      @Field("Phone") String phone
      );

  @POST("/forget_password")
  Future<CommonResponse> forgot(
      @Field("Phone") String phone,
      @Field("Password") String password,
      );

  @POST("/post")
  Future<HomeResponse> home(
      @Field("User_Id") int User_Id,
      @Field("Content") String Content,
      @Field("Is_Image") bool Is_Image
      );

  @POST("/player_list")
  Future<PlayersBaseResponse> players(
      @Field("user_id") int user_id,
      );
}
