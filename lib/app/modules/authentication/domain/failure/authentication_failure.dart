import '../../../../core/failures/failure.dart';

abstract class AuthenticationFailure extends Failure {
  const AuthenticationFailure({
    String? message,
    StackTrace? stackTrace,
  }) : super(
          message: message,
          stackTrace: stackTrace,
        );
}

class AuthenticationGoogleFailure extends AuthenticationFailure {
  const AuthenticationGoogleFailure({
    String? message,
    StackTrace? stackTrace,
  }) : super(
          message: message,
          stackTrace: stackTrace,
        );
}
