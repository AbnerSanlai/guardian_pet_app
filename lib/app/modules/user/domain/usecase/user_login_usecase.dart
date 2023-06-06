import '../repositories/user_login_repository.dart';
import '../types/user_types.dart';

abstract class UserLoginUsecase {
  UserLoginUsecaseCallback call({
    required String password,
    required String username,
  });
}

class UserLoginUsecaseImpl implements UserLoginUsecase {
  final UserLoginRepository _userRepository;

  UserLoginUsecaseImpl({
    required UserLoginRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  UserLoginUsecaseCallback call({
    required String password,
    required String username,
  }) {
    return _userRepository.call(
      password: password,
      username: username,
    );
  }
}
