import 'package:dio/dio.dart';

import '../../../environment/environment_variables.dart';
import 'rest_client_erro.dart';

class RestClient {
  final Dio _dio;

  RestClient({
    required Dio dio,
  }) : _dio = dio;

  Future<dynamic> get(String url, {Map<String, dynamic>? headers}) async {
    try {
      String urll = EnvironmentVariables.appPetUrlBase + url;
      final response = await _dio.get(
        urll,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioError catch (error) {
      throw DioErrorWrapper(error as String);
    }
  }

  Future<dynamic> post(
    String url,
    dynamic data, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      Response response;

      response = await _dio.post(
        EnvironmentVariables.appPetUrlBase + url,
        data: data,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
      return response;
    } on DioError catch (error) {
      return error.response;
    }
  }

  Future<dynamic> put(
    String url,
    dynamic data, {
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.put(
        EnvironmentVariables.appPetUrlBase + url,
        data: data,
        options: Options(
          headers: headers,
        ),
      );
      return response.data;
    } on DioError catch (error) {
      throw DioErrorWrapper(error as String);
    }
  }

  Future<dynamic> delete(
    String url, {
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.delete(
        EnvironmentVariables.appPetUrlBase + url,
        options: Options(
          headers: headers,
        ),
      );
      return response.data;
    } on DioError catch (error) {
      throw DioErrorWrapper(error as String);
    }
  }
}
