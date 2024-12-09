import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_boilerplate/core/common/interceptors.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class ApiConfig {
  factory ApiConfig(Dio dio, {String? baseUrl}) {
    dio.options.baseUrl = baseUrl ?? '';
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final SecurityContext scontext = SecurityContext();
        HttpClient client = HttpClient(context: scontext)
          ..badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
        return client;
      },
    );

    final refreshTokenInterceptor =
        TokenInterceptor(dio, Get.find(), Get.find());
    final errorInterceptor = ErrorInterceptor();
    final loggerInterceptor = PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      request: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: true,
      maxWidth: 90,
    );

    dio.options.responseType = ResponseType.json;
    dio.interceptors.addAll([
      refreshTokenInterceptor,
      errorInterceptor,
      if (kDebugMode) loggerInterceptor,
    ]);

    return ApiConfig(dio, baseUrl: baseUrl);
  }
}
