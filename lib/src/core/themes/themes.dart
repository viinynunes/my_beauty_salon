import 'package:flutter/material.dart';

part 'color_schemes.g.dart';

ThemeData get lightTheme => ThemeData(
      useMaterial3: true,
      colorScheme: _lightColorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor: _lightColorScheme.background,
        foregroundColor: _lightColorScheme.onPrimaryContainer,
        titleTextStyle: TextStyle(
          fontSize: 18,
          color: _lightColorScheme.onSecondaryContainer,
        ),
        centerTitle: true,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _lightColorScheme.primary,
        foregroundColor: _lightColorScheme.onPrimary,
      ),
    );

ThemeData get darkTheme => ThemeData(
      useMaterial3: true,
      colorScheme: _darkColorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor: _darkColorScheme.primaryContainer,
        titleTextStyle: TextStyle(
          fontSize: 18,
          color: _darkColorScheme.onSecondaryContainer,
        ),
        centerTitle: true,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _darkColorScheme.primary,
        foregroundColor: _darkColorScheme.onPrimary,
      ),
    );
