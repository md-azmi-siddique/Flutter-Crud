import 'package:crud_operation/home_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp(),);
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepOrange)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green)
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red)
          )
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              fixedSize: const Size.fromWidth(double.maxFinite),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
              )
          ),
        )
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }

}