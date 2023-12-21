import 'package:congressapp/app/utils/error_handler.dart';

class Failure {
  final int code;
  final String msg;

  Failure(this.code, this.msg);
}

class DefaultFailure extends Failure {
  DefaultFailure()
      : super(ResponseCode.defaultError, ResponseMessage.defaultError);
}
