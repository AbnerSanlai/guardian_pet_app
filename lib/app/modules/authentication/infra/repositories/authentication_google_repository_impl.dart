import '../../../../core/types/either.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/failure/authentication_failure.dart';
import '../../domain/repositories/authentication_google_repository.dart';
import '../../domain/types/authentication_types.dart';
import '../adapter/user_entity_adapter.dart';
import '../datasources/authentication_google_datasource.dart';

class AuthenticationGoogleRepositoryImpl
    implements AuthenticationGoogleRepository {
  final AuthenticationGoogleDatasource _datasource;
  final UserEntityAdapter _userEntityAdapter;

  AuthenticationGoogleRepositoryImpl({
    required AuthenticationGoogleDatasource datasource,
    required UserEntityAdapter userEntityAdapter,
  })  : _datasource = datasource,
        _userEntityAdapter = userEntityAdapter;

  @override
  AuthenticationGoogleUsecaseCallback call() async {
    try {
      final userModel = await _datasource.call();

      UserEntity userEntity = _userEntityAdapter.fromModel(
        userModel: userModel,
      );

      return right(
        userEntity,
      );
    } catch (error) {
      return left(
        AuthenticationGoogleFailure(
          message: error.toString(),
        ),
      );
    }
  }
}
