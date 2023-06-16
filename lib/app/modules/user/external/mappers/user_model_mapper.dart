import '../../infra/models/user_model.dart';

class UserModelMapper {
  UserModel fromMap({
    required Map<String, dynamic> map,
  }) {
    return UserModel(
      id: map['id'],
      userName: map['username'],
      fistName: map['first_name'],
      lastName: map['last_name'],
      email: map['email'],
      celPhone: map['celphone'],
      phone: map['celphone2'],
      invalidCredentials: map['invalid_credentials'] ?? false,
    );
  }

  Map<String, dynamic> registerJson({
    required UserModel userModel,
  }) {
    return {
      'username': userModel.userName,
      'first_name': userModel.fistName,
      'email': userModel.email,
      'password': userModel.password,
    };
  }
}
