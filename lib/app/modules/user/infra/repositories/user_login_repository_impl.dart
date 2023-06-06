import '../../../../core/types/either.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/failure/user_failure.dart';
import '../../domain/repositories/user_login_repository.dart';
import '../../domain/types/user_types.dart';
import '../adapter/user_entity_adapter.dart';
import '../datasources/user_login_datasource.dart';

class UserLoginRepositoryImpl implements UserLoginRepository {
  final UserLoginDatasource _datasource;
  final UserEntityAdapter _userEntityAdapter;

  UserLoginRepositoryImpl({
    required UserLoginDatasource datasource,
    required UserEntityAdapter userEntityAdapter,
  })  : _datasource = datasource,
        _userEntityAdapter = userEntityAdapter;

  @override
  UserLoginUsecaseCallback call({
    required String password,
    required String username,
  }) async {
    try {
      final userModel = await _datasource.call(
        password: password,
        username: username,
      );

      UserEntity userEntity = _userEntityAdapter.fromModel(
        userModel: userModel,
      );

      // if (userModel.invalidCredentials!) {
      //   return left(
      //     const UserLoginFailure(
      //       message: 'Login ou senha incorretos',
      //     ),
      //   );
      // }

      // if (userEntity.id == null) {
      //   return left(
      //     const UserLoginFailure(
      //       message: 'Usuário não encontrado',
      //     ),
      //   );
      // }
      return right(
        userEntity,
      );
    } catch (error, stackTrace) {
      return left(
        UserLoginFailure(
          message: error.toString(),
          stackTrace: stackTrace,
        ),
      );
    }
  }
}
