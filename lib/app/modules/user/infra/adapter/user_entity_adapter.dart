import '../../domain/entities/user_entity.dart';
import '../models/user_model.dart';

class UserEntityAdapter {
  UserEntity fromModel({
    required UserModel userModel,
  }) =>
      UserEntity(
        id: userModel.id,
        fistName: userModel.fistName,
        lastName: userModel.lastName,
        userName: userModel.userName,
        celPhone: userModel.celPhone,
        phone: userModel.phone,
        email: userModel.email,
      );
}
