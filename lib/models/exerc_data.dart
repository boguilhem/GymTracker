import 'package:flutter/foundation.dart';
import 'package:gymtracker/models/exerc.dart';
import 'dart:collection';

class ExercData extends ChangeNotifier {
  final List<Exerc> _exercs = [
    Exerc(name: "AGACHAMENTO", series: 3, repetitions: 8),
    Exerc(name: "PRANCHA ISOMÉTRICA", series: 3, repetitions: 8),
    Exerc(name: "PRANCHA ROTATIVA", series: 3, repetitions: 8),
    Exerc(
        name: "FLEXÃO DE BRAÇOS COM APOIO DO JOELHO",
        series: 3,
        repetitions: 8),
    Exerc(name: "CRUNCH", series: 3, repetitions: 8),
    Exerc(name: "JUMPING JACK", series: 3, repetitions: 8),
  ];

  UnmodifiableListView<Exerc> get exercs {
    return UnmodifiableListView(_exercs);
  }

  int get exercCount {
    return _exercs.length;
  }

  // void set setSeries(int serie_num) {
  //   series = serie_num;
  // }

  void addExerc(String? newExercTitle, int newExercSeries, int newExercReps) {
    final exerc = Exerc(
        name: newExercTitle!,
        series: newExercSeries,
        repetitions: newExercReps);
    _exercs.add(exerc);
    notifyListeners();
  }

  void modifyExerc(
      final String id, final String name, final int series, final int reps) {
    //Add a validation if you want, for example title & details must not be empty
    // if(valid){
    final indexOfOld = _exercs.map((e) => e.name).toList().indexOf(id);
    if (indexOfOld == -1) return;
    _exercs.removeAt(indexOfOld);
    _exercs.insert(
        indexOfOld,
        Exerc(
          name: name,
          series: series,
          repetitions: reps,
          // id: '$indexOfOld',
        ));
    notifyListeners();
    // }
  }

  // final exerc = _exercs.firstWhere((item) => item.name == newExercTitle!, orElse: () => null);
  // if (exerc != null) setState(() => _exercs. = newExercSeries);
  //   notifyListeners();
  // }
  //
  // final tile = _exercs.firstWhere((item) => item.name == newExercTitle!, orElse: () => null);
  // if (tile != null) setState(() => _exercs.series = newExercSeries);

  void updateExerc(Exerc exerc) {
    exerc.toggleDone();
    notifyListeners();
  }

  void deleteExerc(Exerc exerc) {
    _exercs.remove(exerc);
    notifyListeners();
  }
}
