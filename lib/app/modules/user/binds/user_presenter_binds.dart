import 'package:flutter_modular/flutter_modular.dart';

import '../presenter/screens/authentication/bloc/authentication_bloc.dart';
import '../presenter/screens/register_screen/bloc/register_bloc.dart';

class UserPresenterBinds {
  static List<Bind<Object>> binds = [
    Bind.singleton<AuthenticationBloc>(
      (i) {
        return AuthenticationBloc(
          authenticationGoogleUsecase: i.get(),
        );
      },
      export: true,
    ),
    Bind.singleton<RegisterBloc>(
      (i) {
        return RegisterBloc(
          userRegisterUsecase: i.get(),
        );
      },
      export: true,
    ),
  ];
}
