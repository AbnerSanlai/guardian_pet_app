import '../../domain/entities/user_entity.dart';
import '../models/user_model.dart';

class UserEntityAdapter {
  UserEntity fromModel({required UserModel userModel}) => UserEntity(
        id: userModel.id,
        name: userModel.name,
        email: userModel.email,
        photoUrl: userModel.photoUrl,
      );
}
