import 'package:flutter_modular/flutter_modular.dart';

import '../../routes/authentication_routes.dart';
import 'binds/user_domain_binds.dart';
import 'binds/user_external_binds.dart';
import 'binds/user_infra_binds.dart';
import 'binds/user_presenter_binds.dart';
import 'presenter/screens/register_screen/register_screen.dart';
import 'presenter/screens/user_login_screen/user_login_screen.dart';

class UserModule extends Module {
  @override
  List<Bind<Object>> get binds {
    return [
      ...UserDomainBinds.binds,
      ...UserExternalBinds.binds,
      ...UserInfraBinds.binds,
      ...UserPresenterBinds.binds
    ];
  }

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute(
        AuthenticationRoutes.authenticationScreenRoute,
        transition: TransitionType.noTransition,
        child: (_, __) {
          return const UserLoginScreen();
        },
      ),
      ChildRoute(
        AuthenticationRoutes.singUpScreenRoute,
        transition: TransitionType.noTransition,
        child: (_, __) {
          return const RegisterScreen();
        },
      ),
    ];
  }
}
