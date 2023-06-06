import '../../../../core/service/rest_client/dio/rest_client.dart';
import '../../infra/datasources/user_register_datasource.dart';
import '../../infra/models/user_model.dart';
import '../mappers/user_model_mapper.dart';

class UserRegisterDatasourceImpl extends UserRegisterDatasource {
  final RestClient _restClient;
  final UserModelMapper _userModelMapper;

  UserRegisterDatasourceImpl({
    required UserModelMapper userModelMapper,
    required RestClient restClient,
  })  : _restClient = restClient,
        _userModelMapper = userModelMapper;

  @override
  Future<UserModel> call({
    required final UserModel userModel,
  }) async {
    final result = await _restClient.post('petowner/add/', {
      'password': userModel.password,
      'username': userModel.userName,
      'email': userModel.email,
      'first_name': userModel.fistName,
    });

    final userModelResult = _userModelMapper.fromMap(
      map: result,
    );

    return userModelResult;
  }
}
