
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
  );
}
