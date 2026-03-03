import 'package:flutter/material.dart';
import 'package:flutter_car_installment_app/views/splash_screen_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CI Calculator',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const SplashScreenUi(),
    );
  }
}
