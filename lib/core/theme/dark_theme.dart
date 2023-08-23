import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darkTheme() => ThemeData(
      scaffoldBackgroundColor: const Color(0xff040001),
      fontFamily: 'Poppins',
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xff15A4D9),
        onPrimary: Colors.green,
        secondary: Colors.teal,
        onSecondary: Colors.amber,
        error: Colors.red,
        onError: Colors.black,
        background: Colors.yellow,
        onBackground: Colors.green,
        surface: Colors.blue,
        onSurface: Color(0x10188653),
      ),
      drawerTheme: const DrawerThemeData(backgroundColor: Color(0xff0F1015)),
      appBarTheme: const AppBarTheme(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        iconTheme: IconThemeData(color: Color(0xff7E8387)),
        titleTextStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 18,
          color: Color(0xff040001),
          fontWeight: FontWeight.w700,
          letterSpacing: 2,
        ),
      ),
      bottomAppBarTheme: const BottomAppBarTheme(
        color: Color(0xff202224),
        elevation: 12,
        shadowColor: Color(0x800F1015),
      ),
      dividerTheme: const DividerThemeData(
        color: Color(0xff292C31),
        thickness: 1,
        indent: 10,
        endIndent: 10,
        space: 0,
      ),
      textTheme: const TextTheme(
        labelLarge: TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
        titleSmall: TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.w600,
          height: 1.5833333333333333,
        ),
        titleMedium: TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.w700,
          height: 1.3571428571428572,
          overflow: TextOverflow.ellipsis,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.w600,
          height: 1.3,
        ),
        bodySmall: TextStyle(
          fontSize: 20,
          color: Color(0xff0F1015),
          fontWeight: FontWeight.w600,
          height: 1.3,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.w600,
          height: 1.3,
        ),
      ),
      cardTheme: const CardTheme(
        color: Color(0xff202224),
        surfaceTintColor: Colors.white,
      ),
    );
