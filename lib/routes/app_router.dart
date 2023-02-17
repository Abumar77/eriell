import 'package:auto_route/auto_route.dart';
import 'package:eriell/screens/authorization/presentation/view/authentication_screen.dart';
import 'package:eriell/screens/mainscreen/presentation/view/main_screen.dart';

import '../screens/splashscreen/presentation/view/splash_screen.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: [
  MaterialRoute(
    page: SplashPage,
    fullscreenDialog: true,
    initial: true,
    path: SplashPage.routeName,
  ),
  MaterialRoute(
    page: AuthenticationScreen,
    fullscreenDialog: true,
    path: AuthenticationScreen.routeName,
  ),
  MaterialRoute(
    page: MainScreen,
    fullscreenDialog: true,
    path: MainScreen.routeName,
  ),
])
class $AppRouter {}
