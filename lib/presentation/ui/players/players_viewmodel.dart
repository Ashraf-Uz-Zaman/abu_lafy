import 'dart:async';

import 'package:abu_lafy/domain/model/players_model.dart';
import 'package:abu_lafy/domain/usecase/players_usecase.dart';
import 'package:abu_lafy/presentation/base/baseviewmodel.dart';
import 'package:abu_lafy/presentation/common/state_renderer/state_renderer.dart';
import 'package:abu_lafy/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:abu_lafy/presentation/ui/players/players_interface.dart';
import 'package:flutter/src/widgets/framework.dart';




class PlayersViewModel extends BaseViewModel implements PlayersViewModelInputs, PlayersViewModelOutputs {

  final StreamController _playersModel = StreamController<List<PlayersModel>>.broadcast();
  final PlayersUseCase _useCase;

  /// --- Start Constructor --- ///
  PlayersViewModel(this._useCase);
  /// --- End Constructor --- ///
  @override
  void start() {
    // TODO: implement start
  }

  @override
  // TODO: implement inputPlayersList
  Sink get inputPlayersList => throw UnimplementedError();

  @override
  // TODO: implement outputPlayersList
  Stream<List<PlayersModel>> get outputPlayersList => _playersModel.stream
      .map((value) => value);

  @override
  void players(BuildContext context) async{
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));

    (await _useCase.execute(
    PlayersUseCaseInput(1))).fold(
    (failure) => {
    // left -> failure
    // inputState.add(ErrorState(
    //     StateRendererType.POPUP_ERROR_STATE, failure.message))
    print("UnSucess Fucking "),
    inputState.add(ContentState()),
    }, (data) {
    // right -> success (data)
    // inputState.add(ContentState());
    inputState.add(ContentState());
    _playersModel.add(data);
    print("Sucess Fucking ");

    });
  }

}