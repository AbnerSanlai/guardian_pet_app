import 'package:flutter_modular/flutter_modular.dart';

import 'modules/authentication/authentication_module.dart';
import 'modules/authentication/binds/authentication_domain_binds.dart';
import 'modules/authentication/binds/authentication_external_binds.dart';
import 'modules/authentication/binds/authentication_infra_binds.dart';
import 'modules/authentication/binds/authentication_presenter_binds.dart';
import 'modules/home/home_module.dart';
import 'routes/authentication_routes.dart';
import 'routes/home_routes.dart';

class AppModule extends Module {
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
  List<Module> get imports {
    return [
      AuthenticationModule(),
    ];
  }

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      AuthenticationRoutes.authenticationModuleRoute,
      module: AuthenticationModule(),
      transition: TransitionType.noTransition,
    ),
    ModuleRoute(
      HomeRoutes.homeModuleRoute,
      module: HomeModule(),
      transition: TransitionType.noTransition,
    ),
  ];
}
