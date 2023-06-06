import 'package:flutter_modular/flutter_modular.dart';

import '../domain/repositories/user_login_repository.dart';
import '../domain/repositories/user_register_repository.dart';
import '../infra/adapter/user_entity_adapter.dart';
import '../infra/repositories/user_login_repository_impl.dart';
import '../infra/repositories/user_register_repository_impl.dart';

class UserInfraBinds {
  static List<Bind<Object>> binds = [
    // Repositories
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

    // Adapters
    Bind.factory<UserEntityAdapter>(
      (i) {
        return UserEntityAdapter();
      },
      export: true,
    ),
  ];
}
