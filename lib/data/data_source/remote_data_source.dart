
import 'package:abu_lafy/data/responses/home/home_response.dart';
import 'package:abu_lafy/data/responses/login/login_response.dart';
import 'package:abu_lafy/data/responses/common/common_response.dart';
import 'package:abu_lafy/data/responses/player/player_response.dart';
import 'package:abu_lafy/domain/request/request.dart';



abstract class RemoteDataSource {
  Future<LoginResponse> login(LoginRequest request);
  Future<CommonResponse> registration(RegistrationRequest request);
  Future<CommonResponse> forgot(ForgotRequest request);
  Future<HomeResponse> home(HomeRequest request);
  Future<PlayersBaseResponse> players(PlayersRequest request);
}
