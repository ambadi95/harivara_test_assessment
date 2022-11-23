import 'package:flutter/material.dart';

import 'features/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Assessment',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MainScreen(),
    );
  }
}

