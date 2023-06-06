import 'package:flutter_modular/flutter_modular.dart';

import '../external/datasource/user_login_datasource_impl.dart';
import '../external/datasource/user_register_datasource_impl.dart';
import '../external/mappers/user_model_mapper.dart';
import '../infra/datasources/user_login_datasource.dart';
import '../infra/datasources/user_register_datasource.dart';

class UserExternalBinds {
  static List<Bind<Object>> binds = [
    // datasource
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

    // Mappers
    Bind.factory<UserModelMapper>(
      (i) {
        return UserModelMapper();
      },
      export: true,
    ),
  ];
}
