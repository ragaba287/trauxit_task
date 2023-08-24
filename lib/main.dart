import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/router.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';
import 'cubit/home/home_cubit.dart';
import 'cubit/home/home_states.dart';
import 'features/home/home_screen.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => HomeCubit()),
      ],
      child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              onGenerateRoute: onGenerateRoute,
              navigatorKey: navigatorKey,
              darkTheme: darkTheme(),
              theme: lightTheme(),
              debugShowCheckedModeBanner: false,
              themeMode: ThemeMode.light,
              home: const HomeScreen(),
            );
          }),
    );
  }
}
