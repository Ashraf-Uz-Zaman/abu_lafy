import 'package:abu_lafy/data/network/error_handler.dart';

class Failure {
  int status; //200 or 400
  String message; //error or success

  Failure(this.status, this.message);
}

class DefaultFailure extends Failure {
  DefaultFailure() : super(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
}