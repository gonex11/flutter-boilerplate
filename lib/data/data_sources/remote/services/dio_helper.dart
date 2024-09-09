import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  final Dio dio;

  DioHelper({required this.dio}) {
    _setupHttpClientAdapter();
    _setupInterceptors();
  }

  void _setupHttpClientAdapter() {
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final SecurityContext scontext = SecurityContext();
        HttpClient client = HttpClient(context: scontext);
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      },
    );
  }

  void _setupInterceptors() {
    dio.options.responseType = ResponseType.json;
    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          request: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
    }
  }
}
