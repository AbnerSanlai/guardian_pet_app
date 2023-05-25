import 'package:flutter_modular/flutter_modular.dart';

import '../../routes/authentication_routes.dart';
import 'binds/authentication_domain_binds.dart';
import 'binds/authentication_external_binds.dart';
import 'binds/authentication_infra_binds.dart';
import 'binds/authentication_presenter_binds.dart';
import 'presenter/screens/authentication/authentication_screen.dart';
import 'presenter/screens/sing_up_screen/sing_up_screen.dart';

class AuthenticationModule extends Module {
  @override
  List<Bind<Object>> get binds {
    return [
      ...AuthenticationDomainBinds.binds,
      ...AuthenticationExternalBinds.binds,
      ...AuthenticationInfraBinds.binds,
      ...AuthenticationPresenterBinds.binds
    ];
  }

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute(
        AuthenticationRoutes.authenticationScreenRoute,
        transition: TransitionType.noTransition,
        child: (_, __) {
          return const AuthenticationScreen();
        },
      ),
      ChildRoute(
        AuthenticationRoutes.singUpScreenRoute,
        transition: TransitionType.noTransition,
        child: (_, __) {
          return const SingUpScreen();
        },
      ),
    ];
  }
}
