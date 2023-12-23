import '../../data/network/failure.dart';
import 'package:dio/dio.dart';

enum DataSource {
  success,
  noContent, //this is success with no content ()
  badRequest,
  forbidden,
  unauthorized,
  notFound,
  internalServerError,
  connectTimeOut,
  cancel,
  unprocessable,
  receiveTimeOut,
  sendTimeOut,
  cacheError,
  noInternetConnection,
  defaultError,
}

class ErrorHandler implements Exception {
  late Failure failure;
  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure = _handleError(error);
    } else {
      failure = DataSource.defaultError.getFailure();
    }
  }
}

Failure _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.connectTimeOut.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeOut.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.receiveTimeOut.getFailure();
    case DioExceptionType.badResponse:
      switch (error.response?.statusCode) {
        case ResponseCode.badRequest:
          if (error.response != null && error.response!.data != null) {
            return Failure(
                error.response!.statusCode!, error.response!.data['message']);
          }
          return DataSource.badRequest.getFailure();

        case ResponseCode.unauthorized:
          if (error.response != null && error.response!.data != null) {
            return Failure(
                error.response!.statusCode!, error.response!.data['message']);
          }
          return DataSource.unauthorized.getFailure();
        case ResponseCode.forbidden:
          return DataSource.forbidden.getFailure();
        case ResponseCode.notProcessable:
          if (error.response != null && error.response!.data != null) {
            Map<String, dynamic> errorData = error.response!.data["data"];
            List<String> keys = errorData.keys.toList();
            String errorMsg = "";
            for (var item in keys) {
              errorMsg = errorMsg + errorData[item][0];
            }
            return Failure(error.response!.statusCode!, errorMsg);
          }
          return DataSource.unprocessable.getFailure();
        case ResponseCode.internalServerError:
          if (error.response != null && error.response!.data != null) {
            return Failure(
                error.response!.statusCode!, error.response!.data['message']);
          } else {
            return DataSource.internalServerError.getFailure();
          }

        case ResponseCode.notFound:
          return DataSource.notFound.getFailure();
        default:
          return DataSource.defaultError.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.cancel.getFailure();
    case DioExceptionType.unknown:
      return DataSource.defaultError.getFailure();
    default:
      return DataSource.defaultError.getFailure();
  }
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.badRequest:
        return Failure(ResponseCode.badRequest, ResponseMessage.badRequest);
      case DataSource.forbidden:
        return Failure(ResponseCode.forbidden, ResponseMessage.forbidden);
      case DataSource.unauthorized:
        return Failure(ResponseCode.unauthorized, ResponseMessage.unauthorized);
      case DataSource.notFound:
        return Failure(ResponseCode.notFound, ResponseMessage.notFound);
      case DataSource.internalServerError:
        return Failure(ResponseCode.internalServerError,
            ResponseMessage.internalServerError);
      case DataSource.connectTimeOut:
        return Failure(
            ResponseCode.connectTimeOut, ResponseMessage.connectTimeOut);
      case DataSource.cancel:
        return Failure(ResponseCode.cancel, ResponseMessage.cancel);
      case DataSource.unprocessable:
        return Failure(
            ResponseCode.notProcessable, ResponseMessage.notProcessable);
      case DataSource.receiveTimeOut:
        return Failure(
            ResponseCode.receiveTimeOut, ResponseMessage.receiveTimeOut);
      case DataSource.sendTimeOut:
        return Failure(ResponseCode.sendTimeOut, ResponseMessage.sendTimeOut);
      case DataSource.cacheError:
        return Failure(ResponseCode.cacheError, ResponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return Failure(ResponseCode.noInternetConnection,
            ResponseMessage.noInternetConnection);
      case DataSource.defaultError:
        return Failure(ResponseCode.defaultError, ResponseMessage.defaultError);
      default:
        return Failure(ResponseCode.defaultError, ResponseMessage.defaultError);
    }
  }
}

class ResponseCode {
  //api status code
  static const int success = 200; //success with data
  static const int noContent = 201; //success with no content
  static const int badRequest = 400; // failure, api rejected the request
  static const int forbidden = 403; // failure, api rejected the request
  static const int unauthorized = 401; //failure user is not authorized
  static const int notFound =
      404; // failure, api url is not correct and not found
  static const int internalServerError =
      500; //failure, crash happened in server side
  static const int notProcessable = 422;

  //local status code
  static const int defaultError = -1;
  static const int connectTimeOut = -2;
  static const int cancel = -3;
  static const int receiveTimeOut = -4;
  static const int sendTimeOut = -5;
  static const int cacheError = -6;
  static const int noInternetConnection = -7;
}

class ResponseMessage {
  //api status code
  static const String success = "Success"; //success with data
  static const String noContent =
      "Success with no content"; //success with no content
  static const String badRequest =
      "Bad requtest, try again later"; // failure, api rejected the request
  static const String forbidden =
      "Forbidden request, try again later"; // failure, api rejected the request
  static const String unauthorized =
      "User is unauthorized, try again later"; //failure user is not authorized
  static const String notFound =
      "Url is not found, try again later"; // failure, api url is not correct and not found
  static const String internalServerError =
      "Something went wrong, try again later"; //failure, crash happened in server side
  static const String notProcessable = "Your request is not processing";

  //local status code
  static const String defaultError = "Something went wrong, try again later";
  static const String connectTimeOut = "Time out error, try again later";
  static const String cancel = "Request was cancelled, try again later";
  static const String receiveTimeOut = "Time out error, try again later";
  static const String sendTimeOut = "Time out error, try again later";
  static const String cacheError = "Cache error, try again later";
  static const String noInternetConnection =
      "Please check your internet connection";
}

class ApiInternalStatus {
  static const int success = 0;
  static const int failure = 1;
}
