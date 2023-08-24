import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/const.dart';
import 'core/router.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';
import 'features/counter/counter_screen.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => counter(),
      child: MaterialApp(
        onGenerateRoute: onGenerateRoute,
        navigatorKey: navigatorKey,
        darkTheme: darkTheme(),
        theme: lightTheme(),
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        home: CounterScreen(),
      ),
    );
  }
}

class counter {}
