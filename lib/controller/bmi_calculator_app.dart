import 'package:bmi_calculator/views/home_page.dart';
import 'package:flutter/material.dart';

class BmiCalculatorApp extends StatelessWidget {
  const BmiCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMI Calculator",
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const HomePage(title: 'Home Page'),
    );
  }
}
