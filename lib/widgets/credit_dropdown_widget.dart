import 'package:calculate_dynamic_average/constants/app_constants.dart';
import 'package:calculate_dynamic_average/helper/data_helper.dart';
import 'package:flutter/material.dart';

class CreditDropdownWidget extends StatefulWidget {
  final Function onSelectedCredit;
  const CreditDropdownWidget({required this.onSelectedCredit, super.key});

  @override
  State<CreditDropdownWidget> createState() => _CreditDropdownWidgetState();
}

class _CreditDropdownWidgetState extends State<CreditDropdownWidget> {
  double selectedCreditValue = 1;
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
        value: selectedCreditValue,
        onChanged: ((value) {
          setState(() {
            selectedCreditValue = value!;
            widget.onSelectedCredit(value);
          });
        }),
        underline: Container(),
        items: DataHelper.allLectureCredits(),
      ),
    );
  }
}
