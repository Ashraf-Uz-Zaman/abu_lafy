
import 'package:abu_lafy/data/network/failure.dart';
import 'package:abu_lafy/domain/model/user_model.dart';
import 'package:abu_lafy/domain/repository/repository.dart';
import 'package:abu_lafy/domain/request/request.dart';
import 'package:abu_lafy/domain/usecase/base_usercase.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, UserDetailsModel> {
  final Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, UserDetailsModel>> execute(
      LoginUseCaseInput input) async {
   // DeviceInfo deviceInfo = await getDeviceDetails();
    return await _repository.login(LoginRequest(phone:input.phone,password: input.password));
  }
}

class LoginUseCaseInput {
  String phone;
  String password;
  String fcm_token;
  LoginUseCaseInput(this.phone, this.password, this.fcm_token);
}
