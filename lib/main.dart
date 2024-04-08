import 'package:flutter/material.dart';

import 'home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The filme',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black45,
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
