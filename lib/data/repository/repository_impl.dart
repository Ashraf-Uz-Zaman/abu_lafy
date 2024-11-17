import 'package:abu_lafy/data/data_source/remote_data_source.dart';
import 'package:abu_lafy/data/mapper/mapper.dart';
import 'package:abu_lafy/data/network/error_handler.dart';
import 'package:abu_lafy/data/network/failure.dart';
import 'package:abu_lafy/data/network/network_info.dart';
import 'package:abu_lafy/domain/model/user_model.dart';
import 'package:abu_lafy/domain/repository/repository.dart';
import 'package:abu_lafy/domain/request/request.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl extends Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(
      this._remoteDataSource,
      this._networkInfo
      );

  @override
  Future<Either<Failure, UserDetailsModel>> login(LoginRequest request) async {
    if (await _networkInfo.isConnected) {
    try {
      final response = await _remoteDataSource.login(request);
      if (response.status == ApiInternalStatus.SUCCESS) {
        return Right(response.data.toDomain());
      } else {
        return Left(Failure( response.status ?? 0,response.message ?? ResponseMessage.DEFAULT));
      }
    } catch (error) {
      return (Left(ErrorHandler.handle(error).failure));
    }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }


}
