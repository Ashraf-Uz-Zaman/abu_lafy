import 'package:abu_lafy/data/responses/login/login_response.dart';
import 'package:abu_lafy/domain/request/request.dart';



abstract class RemoteDataSource {
  Future<LoginResponse> login(LoginRequest loginRequest);

}
