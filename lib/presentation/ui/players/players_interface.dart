import 'package:abu_lafy/domain/model/players_model.dart';
import 'package:flutter/material.dart';

abstract class PlayersViewModelInputs {

  void players(BuildContext context);

  //two sinks for streams
  Sink get inputPlayersList;
}

abstract class PlayersViewModelOutputs {
  Stream<List<PlayersModel>> get outputPlayersList;

}