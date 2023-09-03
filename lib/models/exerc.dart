class Exerc {
  final String name;
  final int series;
  final int repetitions;
  bool isDone;

  Exerc(
      {required this.name,
      required this.series,
      required this.repetitions,
      this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
