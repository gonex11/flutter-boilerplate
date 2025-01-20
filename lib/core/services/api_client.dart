import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_boilerplate/core/common/interceptors.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class ApiClient {
  static Dio getDio(String baseUrl) {
    final Dio dio = Dio();

    dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
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

    dio.interceptors.addAll([
      refreshTokenInterceptor,
      errorInterceptor,
      if (kDebugMode) loggerInterceptor,
    ]);

    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final SecurityContext scontext = SecurityContext();
        HttpClient client = HttpClient(context: scontext)
          ..badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
        return client;
      },
    );

    return dio;
  }
}
