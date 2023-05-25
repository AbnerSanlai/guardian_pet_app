import 'package:equatable/equatable.dart';

/// This class represents a HTTP client response.
class RestResponse<T> extends Equatable {
  /// Contains the data returned by the HTTP client.
  /// The data will always be returned as a String.
  final T? data;

  /// Contains the status code returned by the HTTP client.
  final int? statusCode;

  /// Contains the status message returned by the HTTP client.
  final String? statusMessage;

  /// Creates a new instance of the HTTP client response.
  const RestResponse({
    this.data,
    this.statusCode,
    this.statusMessage,
  });

  @override
  List<Object?> get props {
    return [
      data,
      statusCode,
      statusMessage,
    ];
  }
}
