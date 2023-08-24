import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/router.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';
import 'cubit/posts/posts_cubit.dart';
import 'cubit/posts/posts_states.dart';
import 'features/dash.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => PostsCubit()),
      ],
      child: BlocConsumer<PostsCubit, PostsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            onGenerateRoute: onGenerateRoute,
            navigatorKey: navigatorKey,
            darkTheme: darkTheme(),
            theme: lightTheme(),
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            home: const DashScreen(),
          );
        },
      ),
    );
  }
}
