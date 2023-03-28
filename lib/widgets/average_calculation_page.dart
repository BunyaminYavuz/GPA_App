import 'package:calculate_dynamic_average/constants/app_constants.dart';
import 'package:calculate_dynamic_average/helper/data_helper.dart';
import 'package:calculate_dynamic_average/model/lecture.dart';
import 'package:calculate_dynamic_average/widgets/credit_dropdown_widget.dart';
import 'package:calculate_dynamic_average/widgets/lectures_list.dart';
import 'package:calculate_dynamic_average/widgets/letter_dropdown_widget.dart';
import 'package:calculate_dynamic_average/widgets/show_average.dart';
import 'package:flutter/material.dart';

class AverageCalculationPage extends StatefulWidget {
  const AverageCalculationPage({super.key});

  @override
  State<AverageCalculationPage> createState() => _AverageCalculationPageState();
}

class _AverageCalculationPageState extends State<AverageCalculationPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double selectedLetterValue = 4;
  double selectedCreditValue = 1;
  String enteredLectureName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
            child: Text(
              Constants.titletext,
              style: Constants.titleStyle,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildForm(),
                ),
                Expanded(
                  flex: 1,
                  child: ShowAverage(
                      lecturesCount: DataHelper.allAddedLectures.length,
                      average: DataHelper.averageCalculate()),
                ),
              ],
            ),
            Expanded(
              child: LecturesList(
                onLectureDeleted: (index) {
                  DataHelper.allAddedLectures.removeAt(index);
                  setState(() {});
                },
              ),
            ),
          ],
        ));
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: Constants.horizontalPadding8,
            child: _buildTextFormField(),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Padding(
                padding: Constants.horizontalPadding8,
                child: LetterDropdownWidget(
                  onLetterSelected: (letter) {
                    selectedLetterValue = letter;
                  },
                ),
              )),
              Expanded(
                  child: Padding(
                padding: Constants.horizontalPadding8,
                child: CreditDropdownWidget(onSelectedCredit: (credit) {
                  selectedCreditValue = credit;
                }),
              )),
              IconButton(
                onPressed: _addLectureAndCalculateAverage,
                icon: Icon(Icons.arrow_forward_ios_sharp),
                color: Constants.mainColor,
                iconSize: 30,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }

  TextFormField _buildTextFormField() {
    return TextFormField(
      onSaved: (newValue) {
        enteredLectureName = newValue!;
      },
      validator: (value) {
        if (value!.length <= 0) {
          return "Enter the name of the lecture";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: "Enter the lecture here...",
        border: OutlineInputBorder(
          borderRadius: Constants.borderRadius,
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Constants.mainColor.shade100.withOpacity(0.3),
      ),
    );
  }



  void _addLectureAndCalculateAverage() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      var willAddedLecture = Lecture(
          name: enteredLectureName,
          letterValue: selectedLetterValue,
          creditValue: selectedCreditValue);
      DataHelper.addLecture(willAddedLecture);
      setState(() {});
    }
  }
}
