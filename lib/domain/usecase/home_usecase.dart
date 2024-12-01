import 'dart:io';

import 'package:abu_lafy/data/network/failure.dart';
import 'package:abu_lafy/domain/model/post_model.dart';
import 'package:abu_lafy/domain/model/user_model.dart';
import 'package:abu_lafy/domain/repository/repository.dart';
import 'package:abu_lafy/domain/request/request.dart';
import 'package:abu_lafy/domain/usecase/base_usercase.dart';
import 'package:dartz/dartz.dart';
import 'package:device_info_plus/device_info_plus.dart';

class HomeUseCase implements BaseUseCase<HomeUseCaseInput,  List<PostModel>> {
  final Repository _repository;

  HomeUseCase(this._repository);

  @override
  Future<Either<Failure, List<PostModel>>> execute(HomeUseCaseInput input) async {
    return await _repository.home(HomeRequest(user_id: input.user_id, content: input.content, is_image: input.Is_Image));
  }
}

class HomeUseCaseInput {
  int user_id;
  String content;
  bool Is_Image;
  HomeUseCaseInput(this.user_id, this.content, this.Is_Image);
}
