import '../../../../core/failures/failure.dart';

abstract class UserFailure extends Failure {
  const UserFailure({
    String? message,
    StackTrace? stackTrace,
  }) : super(
          message: message,
          stackTrace: stackTrace,
        );
}

class UserLoginFailure extends UserFailure {
  const UserLoginFailure({
    String? message,
    StackTrace? stackTrace,
  }) : super(
          message: message,
          stackTrace: stackTrace,
        );
}

class UserRegisterFailure extends UserFailure {
  const UserRegisterFailure({
    String? message,
    StackTrace? stackTrace,
  }) : super(
          message: message,
          stackTrace: stackTrace,
        );
}
