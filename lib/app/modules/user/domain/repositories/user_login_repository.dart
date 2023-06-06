import '../types/user_types.dart';

abstract class UserLoginRepository {
  UserLoginUsecaseCallback call({
    required String password,
    required String username,
  });
}
