import 'package:flutter/material.dart';

import 'core/const.dart';
import 'core/router.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';
import 'features/dash.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: onGenerateRoute,
      navigatorKey: navigatorKey,
      darkTheme: darkTheme(),
      theme: lightTheme(),
      debugShowCheckedModeBanner: false,
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
      home: const DashScreen(),
    );
  }
}
