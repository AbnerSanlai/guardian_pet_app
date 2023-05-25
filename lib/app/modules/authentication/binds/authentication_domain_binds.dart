import 'package:flutter_modular/flutter_modular.dart';

import '../domain/usecase/authentication_google_usecase.dart';

class AuthenticationDomainBinds {
  static List<Bind<Object>> binds = [
    // Usecases
    Bind.factory<AuthenticationGoogleUsecase>((i) {
      return AuthenticationGoogleUsecaseImpl(
        userRepository: i.get(),
      );
    })
  ];
}
