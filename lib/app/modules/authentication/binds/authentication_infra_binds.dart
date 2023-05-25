import 'package:flutter_modular/flutter_modular.dart';

import '../domain/repositories/authentication_google_repository.dart';
import '../infra/adapter/user_entity_adapter.dart';
import '../infra/repositories/authentication_google_repository_impl.dart';

class AuthenticationInfraBinds {
  static List<Bind<Object>> binds = [
    // Repositories
    Bind.factory<AuthenticationGoogleRepository>(
      (i) {
        return AuthenticationGoogleRepositoryImpl(
          datasource: i.get(),
          userEntityAdapter: i.get(),
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
