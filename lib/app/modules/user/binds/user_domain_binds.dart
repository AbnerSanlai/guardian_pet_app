import 'package:flutter_modular/flutter_modular.dart';

import '../domain/usecase/user_register_usecase.dart';

class UserDomainBinds {
  static List<Bind<Object>> binds = [
    // Usecases
    Bind.factory<UserRegisterUsecase>((i) {
      return UserRegisterUsecaseImpl(
        userRegisterRepository: i.get(),
      );
    })
    // Bind.factory<UserLoginUsecase>((i) {
    //   return UserLoginUsecaseImpl(
    //     userRepository: i.get(),
    //   );
    // })
  ];
}
