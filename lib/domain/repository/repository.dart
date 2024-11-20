

import 'package:abu_lafy/data/network/failure.dart';
import 'package:abu_lafy/domain/model/base_model.dart';
import 'package:abu_lafy/domain/model/user_model.dart';
import 'package:abu_lafy/domain/request/request.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, UserDetailsModel>> login(LoginRequest loginRequest);
  Future <Either<Failure, BaseModel>> registration(RegistrationRequest request);
  Future <Either<Failure, BaseModel>> forgot(ForgotRequest request);
}
