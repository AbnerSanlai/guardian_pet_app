import '../../../../core/service/internal_storage/shared_preference/shared_preferences_storage_service.dart';
import '../../../../core/service/rest_client/dio/rest_client.dart';
import '../../infra/datasources/user_login_datasource.dart';
import '../../infra/models/user_model.dart';
import '../mappers/user_model_mapper.dart';

class UserLoginDatasourceImpl extends UserLoginDatasource {
  final RestClient _restClient;
  final UserModelMapper _userModelMapper;

  UserLoginDatasourceImpl({
    required UserModelMapper userModelMapper,
    required RestClient restClient,
  })  : _restClient = restClient,
        _userModelMapper = userModelMapper;

  @override
  Future<UserModel> call({
    required final String username,
    required final String password,
  }) async {
    final result = await _restClient.post(
      'petowner/login/',
      {
        'username': username,
        'password': password,
      },
    );

    if (result.statusCode == 200) {
      final userModel = _userModelMapper.fromMap(
        map: result.data,
      );

      String token = result.data['access_token'] ?? '';
      if (token.isNotEmpty) {
        final sharedPreferencesStorageService =
            SharedPreferencesStorageService();
        sharedPreferencesStorageService.setString(
          'token',
          result.date['access_token'],
        );
      }

      return userModel;
    }

    return const UserModel(
      invalidCredentials: true,
    );
  }
}
