import '../../infra/models/user_model.dart';
import '../types/user_types.dart';

abstract class UserRegisterRepository {
  UserRegisterUsecaseCallback call({
    required UserModel userModel,
  });
}
