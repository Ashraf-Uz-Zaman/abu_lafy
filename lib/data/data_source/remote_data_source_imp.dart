import 'package:abu_lafy/data/data_source/remote_data_source.dart';
import 'package:abu_lafy/data/network/app_api.dart';
import 'package:abu_lafy/data/responses/base/base_response.dart';
import 'package:abu_lafy/data/responses/home/home_response.dart';
import 'package:abu_lafy/data/responses/login/login_response.dart';
import 'package:abu_lafy/data/responses/common/common_response.dart';
import 'package:abu_lafy/data/responses/player/player_response.dart';
import 'package:abu_lafy/domain/request/request.dart';
import 'package:flutter/src/widgets/focus_traversal.dart';





class RemoteDataSourceImplementer implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImplementer(this._appServiceClient);

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    return await _appServiceClient.login(request.phone,
        request.password, request.fcmToken ,request.deviceType);
  }

  @override
  Future<CommonResponse> registration(RegistrationRequest request) async{
    return await _appServiceClient.registration(request.name, request.password, request.phone);
  }


  @override
  Future<CommonResponse> forgot(ForgotRequest request) async{
    return await _appServiceClient.forgot(request.phone, request.password );
  }

  @override
  Future<HomeResponse> home(HomeRequest request) async{
    return await _appServiceClient.home(request.user_id, request.content,request.is_image );
  }

  @override
  Future<PlayersBaseResponse> players(PlayersRequest request) async{
    return await _appServiceClient.players(request.user_id );
  }

}
