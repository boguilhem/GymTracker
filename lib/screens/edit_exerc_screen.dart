import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gymtracker/components/reusable_card.dart';
import 'package:gymtracker/constants.dart';
import 'package:gymtracker/components/round_icon_button.dart';
import 'package:provider/provider.dart';
import 'package:gymtracker/models/exerc_data.dart';

class EditExercScreen extends StatefulWidget {
  static const String id = 'add_exerc_screen';
  final String exerName;
  final int exerSeries;
  final int exerReps;
  EditExercScreen(
      {Key? key,
      required this.exerName,
      required this.exerSeries,
      required this.exerReps})
      : super(key: key);

  @override
  _InputPageState createState() =>
      _InputPageState(name: exerName, series: exerSeries, reps: exerReps);
}

class _InputPageState extends State<EditExercScreen> {
  final String name;
  final int series;
  final int reps;
  _InputPageState(
      {Key? key, required this.name, required this.series, required this.reps});
  late String ExercTitle = name;
  late int newExercSeries = series;
  late int newExercReps = reps;

  @override
  Widget build(BuildContext context) {
    String? newExercTitle = ExercTitle;
    String oldExercTitle = ExercTitle;
    int ExercSeries = newExercSeries;
    int ExercReps = newExercReps;

    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Exercício'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextField(
            autofocus: true,
            controller: TextEditingController()..text = oldExercTitle,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 24.0),
            decoration: InputDecoration(
              labelText: "Nome do exercício",
              contentPadding:
                  EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
            ),
            onChanged: (newText) {
              newExercTitle = newText;
            },
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: Color(0xFF93CDE0),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Séries',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          newExercSeries.toString(),
                          // series.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    newExercSeries--;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  newExercSeries++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: Color(0xFF93CDE0),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Repetições',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          newExercReps.toString(),
                          // reps.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(
                                  () {
                                    newExercReps--;
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(
                                  () {
                                    newExercReps++;
                                  },
                                );
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.lightBlueAccent),
            ),
            child: Text(
              'Editar',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Provider.of<ExercData>(context, listen: false).modifyExerc(
                  oldExercTitle,
                  newExercTitle as String,
                  ExercSeries,
                  ExercReps);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
