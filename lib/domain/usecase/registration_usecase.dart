

import 'package:abu_lafy/data/network/failure.dart';
import 'package:abu_lafy/domain/model/base_model.dart';
import 'package:abu_lafy/domain/repository/repository.dart';
import 'package:abu_lafy/domain/request/request.dart';
import 'package:abu_lafy/domain/usecase/base_usercase.dart';
import 'package:dartz/dartz.dart';

class RegistrationUseCase implements BaseUseCase<RegistrationUseCaseInput, BaseModel> {
  final Repository _repository;

  RegistrationUseCase(this._repository);

  @override
  Future<Either<Failure, BaseModel>> execute(
      RegistrationUseCaseInput input) async {
    return await _repository.registration(RegistrationRequest(name: input.name, password: input.password, phone: input.phone));
  }
}

class RegistrationUseCaseInput {
  String name;
  String password;
  String phone;
  RegistrationUseCaseInput(this.name, this.password, this.phone);
}
