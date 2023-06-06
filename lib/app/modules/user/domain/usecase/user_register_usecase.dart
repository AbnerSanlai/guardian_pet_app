import '../../infra/models/user_model.dart';
import '../repositories/user_register_repository.dart';
import '../types/user_types.dart';

abstract class UserRegisterUsecase {
  UserRegisterUsecaseCallback call({
    required UserModel userModel,
  });
}

class UserRegisterUsecaseImpl implements UserRegisterUsecase {
  final UserRegisterRepository _userRegisterRepository;

  UserRegisterUsecaseImpl({
    required UserRegisterRepository userRegisterRepository,
  }) : _userRegisterRepository = userRegisterRepository;

  @override
  UserRegisterUsecaseCallback call({
    required UserModel userModel,
  }) {
    return _userRegisterRepository.call(
      userModel: userModel,
    );
  }
}
