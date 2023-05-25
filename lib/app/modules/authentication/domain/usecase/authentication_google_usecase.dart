import '../repositories/authentication_google_repository.dart';
import '../types/authentication_types.dart';

abstract class AuthenticationGoogleUsecase {
  AuthenticationGoogleUsecaseCallback call();
}

class AuthenticationGoogleUsecaseImpl implements AuthenticationGoogleUsecase {
  final AuthenticationGoogleRepository _userRepository;

  AuthenticationGoogleUsecaseImpl({
    required AuthenticationGoogleRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  AuthenticationGoogleUsecaseCallback call() {
    return _userRepository.call();
  }
}
