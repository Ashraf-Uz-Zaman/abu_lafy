import 'package:abu_lafy/data/data_source/remote_data_source.dart';
import 'package:abu_lafy/data/network/app_api.dart';
import 'package:abu_lafy/data/responses/login/login_response.dart';
import 'package:abu_lafy/domain/request/request.dart';





class RemoteDataSourceImplementer implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImplementer(this._appServiceClient);

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    return await _appServiceClient.login(request.phone,
        request.password, request.fcmToken ?? "");
  }


}
