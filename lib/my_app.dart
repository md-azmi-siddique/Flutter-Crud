import 'package:crud_operation/home_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: _lightTheme(),
      darkTheme: _darkTheme(),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }

  ThemeData _lightTheme() {
    return ThemeData(
        brightness: Brightness.light,
        inputDecorationTheme: const InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrange)),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
            focusedErrorBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.red))),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              fixedSize: const Size.fromWidth(double.maxFinite),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
        ));
  }

  ThemeData _darkTheme() {
    return ThemeData(
        brightness: Brightness.dark,
        inputDecorationTheme: const InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrange)),
            focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
            focusedErrorBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.red))),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              fixedSize: const Size.fromWidth(double.maxFinite),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
        ));
  }
}
