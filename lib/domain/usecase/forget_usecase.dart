

import 'package:abu_lafy/data/network/failure.dart';
import 'package:abu_lafy/domain/model/base_model.dart';
import 'package:abu_lafy/domain/repository/repository.dart';
import 'package:abu_lafy/domain/request/request.dart';
import 'package:abu_lafy/domain/usecase/base_usercase.dart';
import 'package:dartz/dartz.dart';

class ForgetUseCase implements BaseUseCase<ForgotUseCaseInput, BaseModel> {
  final Repository _repository;

  ForgetUseCase(this._repository);

  @override
  Future<Either<Failure, BaseModel>> execute(
      ForgotUseCaseInput input) async {
    return await _repository.forgot(ForgotRequest(phone: input.phone,password: input.password));
  }
}

class ForgotUseCaseInput {
  String phone;
  String password;

  ForgotUseCaseInput(this.phone, this.password);
}
