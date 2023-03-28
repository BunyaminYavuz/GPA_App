import 'package:flutter/material.dart';
import 'package:calculate_dynamic_average/constants/app_constants.dart';
import 'package:calculate_dynamic_average/helper/data_helper.dart';

class LecturesList extends StatelessWidget {
  final Function onLectureDeleted;
  const LecturesList({required this.onLectureDeleted, super.key});

  @override
  Widget build(BuildContext context) {
    var allLectures = DataHelper.allAddedLectures;
    return allLectures.length > 0
        ? ListView.builder(
            itemCount: allLectures.length,
            itemBuilder: ((context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {
                  onLectureDeleted(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(allLectures[index].name),
                      leading: CircleAvatar(
                        backgroundColor: Constants.mainColor,
                        child: Text(
                          (allLectures[index].letterValue *
                                  allLectures[index].creditValue)
                              .toStringAsFixed(1),
                        ),
                      ),
                      subtitle: Text(
                          "${allLectures[index].creditValue} credit, ${allLectures[index].letterValue} grade value, "),
                    ),
                  ),
                ),
              );
            }))
        : Container(
            child: Center(
                child: Text(
              "Please Add Lecture",
              style: Constants.titleStyle,
            )),
          );
  }
}