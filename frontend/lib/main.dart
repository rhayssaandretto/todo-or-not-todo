import 'app_imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'To-Do List',
      debugShowCheckedModeBanner: false,
      routerConfig: GoRouterSystem.router,
    );
  }
}
