import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const FlutterStarterApp());
}

class FlutterStarterApp extends StatefulWidget {
  const FlutterStarterApp({super.key});

  @override
  State<FlutterStarterApp> createState() => _FlutterStarterAppState();
}

class _FlutterStarterAppState extends State<FlutterStarterApp> {
  final ValueNotifier<ThemeMode> _themeNotifier =
      ValueNotifier<ThemeMode>(ThemeMode.system);

  @override
  void dispose() {
    _themeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _themeNotifier,
      builder: (context, currentThemeMode, child) {
        return MaterialApp(
          title: 'Flutter Starter',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: currentThemeMode,
          home: SplashScreen(themeNotifier: _themeNotifier),
        );
      },
    );
  }
}
