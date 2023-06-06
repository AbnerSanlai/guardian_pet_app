import 'package:dio/dio.dart';

import '../../../environment/environment_variables.dart';
import '../rest_exception.dart';
import '../rest_response.dart';
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
    } on DioError catch (error, stackTrace) {
      throw _generateDioException(
        error: error,
        stackTrace: stackTrace,
      );
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

  RestException _generateDioException({
    required DioError error,
    required StackTrace stackTrace,
  }) {
    final response = _mapResponse(
      response: error.response,
    );

    return RestException(
      message: error.response?.statusMessage,
      statusCode: error.response?.statusCode,
      error: error.error,
      stackTrace: stackTrace,
      additionalInfo: {
        'uri': '${error.requestOptions.baseUrl}${error.requestOptions.path}',
        'headers': error.requestOptions.headers,
        'method': error.requestOptions.method,
        'queryParameters': error.requestOptions.queryParameters,
        'errorType': error.type.toString(),
      },
      response: response,
    );
  }

  RestResponse<dynamic> _mapResponse({
    required Response? response,
  }) {
    return RestResponse<dynamic>(
      data: response?.data,
      statusCode: response?.statusCode,
      statusMessage: response?.statusMessage,
    );
  }
}
