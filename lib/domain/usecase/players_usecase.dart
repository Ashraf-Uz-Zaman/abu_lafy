

import 'package:abu_lafy/data/network/failure.dart';
import 'package:abu_lafy/domain/model/base_model.dart';
import 'package:abu_lafy/domain/model/players_model.dart';
import 'package:abu_lafy/domain/repository/repository.dart';
import 'package:abu_lafy/domain/request/request.dart';
import 'package:abu_lafy/domain/usecase/base_usercase.dart';
import 'package:dartz/dartz.dart';

class PlayersUseCase implements BaseUseCase<PlayersUseCaseInput, List<PlayersModel>> {
  final Repository _repository;

  PlayersUseCase(this._repository);

  @override
  Future<Either<Failure, List<PlayersModel>>> execute(
      PlayersUseCaseInput input) async {
    return await _repository.players(PlayersRequest(user_id: input.user_id));
  }
}

class PlayersUseCaseInput {
  int user_id;

  PlayersUseCaseInput(this.user_id);
}
