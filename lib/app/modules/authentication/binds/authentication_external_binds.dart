import 'package:flutter_modular/flutter_modular.dart';

import '../external/datasource/authentication_google_datasource_impl.dart';
import '../external/mappers/user_model_mapper.dart';
import '../infra/datasources/authentication_google_datasource.dart';

class AuthenticationExternalBinds {
  static List<Bind<Object>> binds = [
    // datasource
    Bind.factory<AuthenticationGoogleDatasource>(
      (i) {
        return AuthenticationGoogleDatasourceImpl(
          userModelMapper: i.get(),
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
