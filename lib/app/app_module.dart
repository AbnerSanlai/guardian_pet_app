import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/service/rest_client/dio/rest_client.dart';
import 'modules/home/home_module.dart';
import 'modules/user/domain/repositories/user_login_repository.dart';
import 'modules/user/domain/repositories/user_register_repository.dart';
import 'modules/user/domain/usecase/user_login_usecase.dart';
import 'modules/user/domain/usecase/user_register_usecase.dart';
import 'modules/user/external/datasource/user_login_datasource_impl.dart';
import 'modules/user/external/datasource/user_register_datasource_impl.dart';
import 'modules/user/infra/datasources/user_login_datasource.dart';
import 'modules/user/infra/datasources/user_register_datasource.dart';
import 'modules/user/infra/repositories/user_login_repository_impl.dart';
import 'modules/user/infra/repositories/user_register_repository_impl.dart';
import 'modules/user/user_module.dart';
import 'routes/authentication_routes.dart';
import 'routes/home_routes.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds {
    return [
      Bind.factory<UserRegisterUsecase>((i) {
        return UserRegisterUsecaseImpl(
          userRegisterRepository: i.get(),
        );
      }),
      Bind.factory<UserLoginUsecase>((i) {
        return UserLoginUsecaseImpl(
          userRepository: i.get(),
        );
      }),
      Bind.factory<UserLoginRepository>(
        (i) {
          return UserLoginRepositoryImpl(
            datasource: i.get(),
            userEntityAdapter: i.get(),
          );
        },
      ),
      Bind.factory<UserRegisterRepository>(
        (i) {
          return UserRegisterRepositoryImpl(
            datasource: i.get(),
          );
        },
      ),
      Bind.factory<UserLoginDatasource>(
        (i) {
          return UserLoginDatasourceImpl(
            userModelMapper: i.get(),
            restClient: i.get(),
          );
        },
      ),
      Bind.factory<UserRegisterDatasource>(
        (i) {
          return UserRegisterDatasourceImpl(
            userModelMapper: i.get(),
            restClient: i.get(),
          );
        },
      ),
      Bind.lazySingleton(
        (i) => RestClient(
          dio: Dio(),
        ),
      ),
    ];
  }

  @override
  final List<Module> imports = [
    UserModule(),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      AuthenticationRoutes.authenticationModuleRoute,
      module: UserModule(),
      transition: TransitionType.noTransition,
    ),
    ModuleRoute(
      HomeRoutes.homeModuleRoute,
      module: HomeModule(),
      transition: TransitionType.noTransition,
    ),
  ];
}
