import 'package:calculate_dynamic_average/constants/app_constants.dart';
import 'package:calculate_dynamic_average/widgets/average_calculation_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculate Dynamic Average App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Constants.mainColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const AverageCalculationPage(),
    );
  }
}
