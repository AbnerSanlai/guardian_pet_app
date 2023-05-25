import '../models/user_model.dart';

abstract class AuthenticationGoogleDatasource {
  Future<UserModel> call();
}
