import '../../../../core/types/either.dart';
import '../../domain/failure/user_failure.dart';
import '../../domain/repositories/user_register_repository.dart';
import '../../domain/types/user_types.dart';
import '../datasources/user_register_datasource.dart';
import '../models/user_model.dart';

class UserRegisterRepositoryImpl implements UserRegisterRepository {
  final UserRegisterDatasource _datasource;

  UserRegisterRepositoryImpl({
    required UserRegisterDatasource datasource,
  }) : _datasource = datasource;

  @override
  UserRegisterUsecaseCallback call({
    required UserModel userModel,
  }) async {
    try {
      final userModelResult = await _datasource.call(
        userModel: userModel,
      );

      if (userModelResult.email == null) {
        return left(
          const UserRegisterFailure(
            message: 'Usuário não encontrado',
          ),
        );
      }
      return right(
        true,
      );
    } catch (error) {
      return left(
        UserRegisterFailure(
          message: error.toString(),
        ),
      );
    }
  }
}
