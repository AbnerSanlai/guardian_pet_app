import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../../error_logging/error_logging_service.dart';
import '../rest_exception.dart';
import '../rest_response.dart';
import '../rest_service.dart';

class DioRestService implements RestService {
  final Dio _dio;
  final String _hcmApiUrlBase;
  final String _platformUrlBase;
  final ErrorLoggingService _errorLoggingService;

  DioRestService({
    required Dio dio,
    required String hcmApiUrlBase,
    required String platformUrlBase,
    required ErrorLoggingService errorLoggingService,
  })  : _dio = dio,
        _hcmApiUrlBase = hcmApiUrlBase,
        _platformUrlBase = platformUrlBase,
        _errorLoggingService = errorLoggingService,
        super();

  String get baseUrl {
    return _dio.options.baseUrl;
  }

  @override
  RestService legacyManagementPanelService() {
    _dio.options.baseUrl = _hcmApiUrlBase;
    return this;
  }

  @override
  RestService authorizationService() {
    _dio.options.baseUrl = '$_platformUrlBase/platform/authorization';
    return this;
  }

  @override
  RestService personalizationService() {
    _dio.options.baseUrl = '$_platformUrlBase/platform/personalization';
    return this;
  }

  @override
  RestService appEmployeeNotification() {
    _dio.options.baseUrl = '$_platformUrlBase/mobile/app_employee_notification';
    return this;
  }

  @override
  RestService happinessIndexService() {
    _dio.options.baseUrl = '$_platformUrlBase/hcm/happiness_index';
    return this;
  }

  @override
  Future<RestResponse<String>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    Response response;

    try {
      response = await _dio.get<String>(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
    } on DioError catch (error, stackTrace) {
      throw _generateDioException(
        error: error,
        stackTrace: stackTrace,
      );
    }

    return _mapResponse(
      response: response,
    );
  }

  @override
  Future<RestResponse<String>> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    Response response;

    try {
      response = await _dio.delete<String>(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
    } on DioError catch (error, stackTrace) {
      throw _generateDioException(
        error: error,
        stackTrace: stackTrace,
      );
    }

    return _mapResponse(
      response: response,
    );
  }

  @override
  Future<RestResponse<String>> patch(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    Response response;

    try {
      response = await _dio.patch<String>(
        path,
        data: body,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
    } on DioError catch (error, stackTrace) {
      throw _generateDioException(
        error: error,
        stackTrace: stackTrace,
      );
    }

    return _mapResponse(
      response: response,
    );
  }

  @override
  Future<RestResponse<String>> post(
    String path, {
    body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    Response response;

    try {
      response = await _dio.post<String>(
        path,
        data: body,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
    } on DioError catch (error, stackTrace) {
      throw _generateDioException(
        error: error,
        stackTrace: stackTrace,
      );
    }

    return _mapResponse(
      response: response,
    );
  }

  @override
  Future<RestResponse<String>> put(
    String path, {
    body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    Response response;

    try {
      response = await _dio.put<String>(
        path,
        data: body,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
    } on DioError catch (error, stackTrace) {
      throw _generateDioException(
        error: error,
        stackTrace: stackTrace,
      );
    }

    return _mapResponse(
      response: response,
    );
  }

  @override
  Future<RestResponse<List<int>>> downloadFile(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    Response response;

    try {
      response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          responseType: ResponseType.bytes,
        ),
      );
    } on DioError catch (error, stackTrace) {
      throw _generateFileDioException(
        error: error,
        stackTrace: stackTrace,
      );
    }

    return _mapFileResponse(
      response: response,
    );
  }

  RestResponse<String> _mapResponse({
    required Response? response,
  }) {
    return RestResponse<String>(
      data: response?.data,
      statusCode: response?.statusCode,
      statusMessage: response?.statusMessage,
    );
  }

  RestResponse<List<int>> _mapFileResponse({
    required Response? response,
  }) {
    return RestResponse<List<int>>(
      data: response == null ? null : (response.data as Uint8List).toList(),
      statusCode: response?.statusCode,
      statusMessage: response?.statusMessage,
    );
  }

  RestException _generateDioException({
    required DioError error,
    required StackTrace stackTrace,
  }) {
    _sendAdditionalDataToErrorService(
      error: error,
    );

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

  RestException _generateFileDioException({
    required DioError error,
    required StackTrace stackTrace,
  }) {
    _sendAdditionalDataToErrorService(
      error: error,
    );

    final fileResponse = _mapFileResponse(
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
      response: fileResponse,
    );
  }

  void _sendAdditionalDataToErrorService({
    required DioError error,
  }) {
    _errorLoggingService.appendLogMessage(
      message: 'Method: ${error.requestOptions.method}',
    );

    _errorLoggingService.appendLogMessage(
      message: 'URI: ${error.requestOptions.uri.path}',
    );

    _errorLoggingService.appendLogMessage(
      message: 'Status Code: ${error.response?.statusCode}',
    );

    _errorLoggingService.appendLogMessage(
      message: 'Error Message: ${error.response?.statusMessage}',
    );

    _errorLoggingService.appendLogMessage(
      message: 'Error Type: ${error.type.name}',
    );
  }
}