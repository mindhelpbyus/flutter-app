import 'package:flutter/material.dart';
import 'ovi_landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OVI - Mental Health App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF171115)),
        useMaterial3: true,
      ),
      home: const OviLandingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
