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
      title: 'What TODO today? ¯\\_(ツ)_/¯',
      theme: ThemeData(
        textTheme: GoogleFonts.schoolbellTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: GoRouterSystem.router,
    );
  }
}
