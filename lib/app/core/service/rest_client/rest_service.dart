import 'rest_response.dart';

/// This interface describes all the methods that are needed to every HTTP client into the application.
abstract class RestService {
  /// Configure the rest service to use the management panel base url.
  RestService legacyManagementPanelService();

  /// Configure the rest service to use the platform base url with the authorization service.
  RestService authorizationService();

  /// Configure the rest service to use the platform base url with the app employee notification service.
  RestService appEmployeeNotification();

  /// Configure the rest service to use the platform base url with the happiness index service.
  RestService happinessIndexService();

  /// Configure the rest service to use the platform base url with the happiness index service.
  RestService personalizationService();

  /// Describes how the GET method should be implemented.
  Future<RestResponse<String>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  /// Describes how the POST method should be implemented.
  Future<RestResponse<String>> post(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  /// Describes how the PUT method should be implemented.
  Future<RestResponse<String>> put(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  /// Describes how the DELETE method should be implemented.
  Future<RestResponse<String>> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  /// Describes how the PATCH method should be implemented.
  Future<RestResponse<String>> patch(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<RestResponse<List<int>>> downloadFile(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });
}