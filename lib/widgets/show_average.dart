import 'package:calculate_dynamic_average/constants/app_constants.dart';
import 'package:flutter/material.dart';

class ShowAverage extends StatelessWidget {
  final int lecturesCount;
  final double average;
  const ShowAverage(
      {required this.lecturesCount, required this.average, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          lecturesCount > 0
              ? "$lecturesCount Lectures entered"
              : "Enter the lecture",
          style: Constants.showAverageBodyStyle,
        ),
        Text(
          average >= 0 ? "${average.toStringAsFixed(2)}" : "0.0",
          style: Constants.averageStyle,
        ),
        Text(
          "Average",
          style: Constants.showAverageBodyStyle,
        ),
      ],
    );
  }
}
