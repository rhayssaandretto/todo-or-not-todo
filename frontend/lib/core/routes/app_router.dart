import '../../app_imports.dart';

class GoRouterSystem {
  const GoRouterSystem._();

  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');
  static final GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'shell');
  static final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  static BuildContext? get ctx =>
      router.routerDelegate.navigatorKey.currentContext;

  static const String initialRoutePath = HomePage.name;

  static GoRouter router = GoRouter(
    initialLocation: initialRoutePath,
    debugLogDiagnostics: kDebugMode,
    navigatorKey: rootNavigatorKey,
    routes: [
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: HomePage.name,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
