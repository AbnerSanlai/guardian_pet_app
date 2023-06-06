import '../models/user_model.dart';

abstract class UserRegisterDatasource {
  Future<UserModel> call({
    required final UserModel userModel,
  });
}
