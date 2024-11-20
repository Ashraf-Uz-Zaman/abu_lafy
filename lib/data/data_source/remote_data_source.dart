
import 'package:abu_lafy/data/responses/login/login_response.dart';
import 'package:abu_lafy/data/responses/common/common_response.dart';
import 'package:abu_lafy/domain/request/request.dart';



abstract class RemoteDataSource {
  Future<LoginResponse> login(LoginRequest request);
  Future<CommonResponse> registration(RegistrationRequest request);
  Future<CommonResponse> forgot(ForgotRequest request);
}
