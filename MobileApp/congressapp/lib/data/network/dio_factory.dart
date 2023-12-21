import 'dart:async';
import 'package:congressapp/app/locator/di.dart';
import 'package:congressapp/app/utils/app_prefs.dart';
import 'package:congressapp/data/network/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String applicationJson = "application/json";
const String contentType = "Content-Type";
const String accept = "Accept";
const String authorization = "Authorization";
const String xRequestedWith = "X-Requested-With";
const String xmlHttpRequest = "XMLHttpRequest";

class DioFactory {
  Dio dio = Dio();
  Future<Dio> getDio() async {
    Duration? timeOut = const Duration(minutes: 1); // one minute

    final accessToken = await instance<AppPreference>().getAccessToken();

    Map<String, dynamic> headers = {
      contentType: applicationJson,
      accept: applicationJson,
      authorization: "Bearer $accessToken",
      xRequestedWith: xmlHttpRequest,
    };

    dio.options = BaseOptions(
      baseUrl: Endpoints.developmentURL,
      connectTimeout: timeOut,
      receiveTimeout: timeOut,
      headers: headers,
    );

    if (!kReleaseMode) {
      //pretty logger would availble only on debug mode
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ));
    }
    return dio;
  }

  Future<void> close() async {
    dio.close();
  }
}
