import 'package:flutter_modular/flutter_modular.dart';

import '../presenter/screens/register_screen/bloc/register_bloc.dart';
import '../presenter/screens/user_login_screen/bloc/user_login_bloc.dart';

class UserPresenterBinds {
  static List<Bind<Object>> binds = [
    Bind.singleton<UserLoginBloc>(
      (i) {
        return UserLoginBloc(
          userLoginUsecase: i.get(),
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
