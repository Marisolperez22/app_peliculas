import 'package:flutter/material.dart';

class AppTheme {
  final bool isDarkmode;
  AppTheme({this.isDarkmode = false});

  ThemeData getTheme() => ThemeData(
        appBarTheme:
            const AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
        useMaterial3: true,
        colorSchemeSeed: const Color.fromRGBO(92, 134, 174, 1),
        brightness: isDarkmode ? Brightness.dark : Brightness.light,
      );

  AppTheme copyWith({
    bool? isDarkmode,
  }) =>
      AppTheme(
        isDarkmode: isDarkmode ?? this.isDarkmode,
      );
}
