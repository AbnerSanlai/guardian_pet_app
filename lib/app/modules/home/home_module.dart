import 'package:flutter_modular/flutter_modular.dart';

import '../../routes/home_routes.dart';
import 'presenter/home_screen.dart';

class HomeModule extends Module {
  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute(
        HomeRoutes.homeScreenRoute,
        transition: TransitionType.noTransition,
        child: (_, __) {
          return const HomeScreen();
        },
      ),
    ];
  }
}
