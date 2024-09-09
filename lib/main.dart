
import 'package:flutter/material.dart';
import 'package:flutter_crud/screen/create_screen.dart';
import 'package:flutter_crud/screen/create_screen_new.dart';
import 'package:flutter_crud/screen/read_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const ReadScreen(),
    );
  }
}


