import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';

class DioInstance {
  Dio getDioInstance() {
    Dio dio = Dio();

    if (kDebugMode) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) {
          return true;
        };
        return client;
      };
    }

    dio.options.sendTimeout = const Duration(seconds: 30000);
    dio.options.connectTimeout = const Duration(seconds: 30000);

    return dio;
  }
}
