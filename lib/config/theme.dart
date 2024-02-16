import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData.light().copyWith(
      colorScheme: const ColorScheme.light().copyWith(
          primary: Colors.red,
          secondary: Colors.blue,
          background: Color.fromARGB(255, 21, 1, 26),
          surface: Colors.green,
          onBackground: Colors.blueGrey),
      scaffoldBackgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.blueAccent),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Colors.yellow,
          )),
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: Colors.blue),
        titleMedium: TextStyle(color: Color.fromARGB(255, 168, 92, 86)),
        titleSmall: TextStyle(color: Colors.green),
        bodyLarge: TextStyle(color: Colors.black26),
        bodyMedium: TextStyle(color: Colors.black54),
        bodySmall: TextStyle(color: Colors.black87),
      ));
}

ThemeData darkTheme() {
  return ThemeData.dark().copyWith(
      colorScheme: const ColorScheme.light().copyWith(
          primary: Color.fromARGB(255, 192, 133, 128),
          secondary: Color.fromARGB(255, 137, 183, 220),
          background: const Color.fromARGB(255, 50, 43, 43),
          surface: const Color.fromARGB(255, 6, 48, 7),
          onBackground: const Color.fromARGB(255, 23, 35, 41)),
      scaffoldBackgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Color.fromARGB(255, 216, 217, 219)),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Colors.yellow,
          )),
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: Color.fromARGB(255, 151, 178, 200)),
        titleMedium: TextStyle(color: Color.fromARGB(255, 101, 57, 54)),
        titleSmall: TextStyle(color: Color.fromARGB(255, 120, 211, 123)),
        bodyLarge: TextStyle(color: Color.fromARGB(66, 194, 121, 121)),
        bodyMedium: TextStyle(color: Color.fromARGB(137, 189, 81, 81)),
        bodySmall: TextStyle(color: Color.fromARGB(221, 75, 36, 36)),
      ));
}
