import 'package:design_sample/globals/theme.dart';
import 'package:design_sample/pages/auth/login.dart';
import 'package:design_sample/pages/sample_page.dart';
import 'package:flutter/material.dart';

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
      theme: lightMode,
      home: const SamplePage(),
    );
  }
}
