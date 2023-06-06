import '../models/user_model.dart';

abstract class UserLoginDatasource {
  Future<UserModel> call({
    required final String username,
    required final String password,
  });
}
