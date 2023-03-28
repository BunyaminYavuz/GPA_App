import 'package:calculate_dynamic_average/model/lecture.dart';
import 'package:flutter/material.dart';

class DataHelper {
  static List<Lecture> allAddedLectures = [];
  static addLecture(Lecture lecture) {
    allAddedLectures.add(lecture);
  }

  static double averageCalculate() {
    double totalGrades = 0.0;
    double totalCredits = 0;
    allAddedLectures.forEach((element) {
      totalGrades += (element.letterValue * element.creditValue);
      totalCredits += element.creditValue;
    });

    return totalGrades / totalCredits;
  }

  static List<String> _allLectureLetters = [
    "AA",
    "BA",
    "BB",
    "CB",
    "CC",
    "DC",
    "DD",
    "FD",
    "FF"
  ];

  static double _convertLetterToGrade(String letters) {
    switch (letters) {
      case "AA":
        return 4;
      case "BA":
        return 3.5;
      case "BB":
        return 3;
      case "CB":
        return 2.5;
      case "CC":
        return 2;
      case "DC":
        return 1.5;
      case "DD":
        return 1;
      case "FD":
        return 0.5;
      case "FF":
        return 0;

      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> allLectureLetters() {
    return _allLectureLetters
        .map(
          (e) => DropdownMenuItem(
            child: Text(e),
            value: _convertLetterToGrade(e),
          ),
        )
        .toList();
  }

  static List<int> _allCredits() {
    return List.generate(10, (index) => index + 1);
  }

  static List<DropdownMenuItem<double>> allLectureCredits() {
    return _allCredits()
        .map(
          (e) => DropdownMenuItem(
            child: Text(e.toString()),
            value: e.toDouble(),
          ),
        )
        .toList();
  }
}
