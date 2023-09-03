import 'package:flutter/material.dart';
import 'package:gymtracker/widgets/exerc_tile.dart';
import 'package:provider/provider.dart';
import 'package:gymtracker/models/exerc_data.dart';
import 'package:gymtracker/screens/edit_exerc_screen.dart';

class ExercsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ExercData>(builder: (context, exercData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final exerc = exercData.exercs[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExercTile(
                exercTitle: exerc.name,
                isChecked: exerc.isDone,
                checkboxCallback: (checkboxState) {
                  exercData.updateExerc(exerc);
                },
                longPressCallback: () {
                  exercData.deleteExerc(exerc);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => EditExercScreen(
                  //         exerName: exerc.name,
                  //         exerSeries: exerc.series,
                  //         exerReps: exerc.repetitions),
                  //   ),
                  // );
                },
                tapCallback: () {
                  // exercData.deleteExerc(exerc);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditExercScreen(
                          exerName: exerc.name,
                          exerSeries: exerc.series,
                          exerReps: exerc.repetitions),
                    ),
                  );
                },
              ),
              Container(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  'Series: ${exerc.series}'
                  ', Repetições: ${exerc.repetitions}',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    decoration:
                        exerc.isDone ? TextDecoration.lineThrough : null,
                  ),
                ),
              ),

              // Text(
              //   "Repetições"
              //   // '${Provider.of<ExercData>(context).exercCount} Exercícios',
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 24.0,
              //   ),
              // ),
            ],
          );
        },
        itemCount: exercData.exercCount,
      );
    });
  }
}
