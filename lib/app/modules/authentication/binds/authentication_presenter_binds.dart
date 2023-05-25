import 'package:flutter_modular/flutter_modular.dart';

import '../presenter/screens/authentication/bloc/authentication_bloc.dart';

class AuthenticationPresenterBinds {
  static List<Bind<Object>> binds = [
    Bind.singleton<AuthenticationBloc>(
      (i) {
        return AuthenticationBloc(
          authenticationGoogleUsecase: i.get(),
        );
      },
      export: true,
    ),
  ];
}
