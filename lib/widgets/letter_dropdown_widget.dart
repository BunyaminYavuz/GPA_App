import 'package:calculate_dynamic_average/constants/app_constants.dart';
import 'package:calculate_dynamic_average/helper/data_helper.dart';
import 'package:flutter/material.dart';

class LetterDropdownWidget extends StatefulWidget {
  final Function onLetterSelected;
  const LetterDropdownWidget({required this.onLetterSelected, super.key});

  @override
  State<LetterDropdownWidget> createState() => _LetterDropdownWidgetState();
}

class _LetterDropdownWidgetState extends State<LetterDropdownWidget> {
  double selectedLetterValue = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Constants.dropDownPadding,
      decoration: BoxDecoration(
        color: Constants.mainColor.shade100.withOpacity(0.3),
        borderRadius: Constants.borderRadius,
      ),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: Constants.mainColor.shade200,
        value: selectedLetterValue,
        onChanged: ((value) {
          setState(() {
            selectedLetterValue = value!;
            widget.onLetterSelected(selectedLetterValue);
          });
        }),
        underline: Container(),
        items: DataHelper.allLectureLetters(),
      ),
    );
  }
}
