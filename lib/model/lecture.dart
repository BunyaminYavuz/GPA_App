class Lecture {
  final String name;
  final double letterValue;
  final double creditValue;

  Lecture({required this.name,required this.letterValue,required this.creditValue});

  @override
  String toString() {
    return "$name $letterValue $creditValue";
  }
}
