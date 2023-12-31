import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gymtracker/components/reusable_card.dart';
import 'package:gymtracker/constants.dart';
import 'package:gymtracker/components/round_icon_button.dart';
import 'package:provider/provider.dart';
import 'package:gymtracker/models/exerc_data.dart';

class AddExercScreen extends StatefulWidget {
  static const String id = 'add_exerc_screen';

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<AddExercScreen> {
  int newExercSeries = 3;
  int newExercReps = 8;

  @override
  Widget build(BuildContext context) {
    String? newExercTitle;
    int ExercSeries = newExercSeries;
    int ExercReps = newExercReps;

    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Exercício'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextField(
            autofocus: true,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 24.0),
            decoration: InputDecoration(
              labelText: 'Nome do exercício',
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
                          // series.toString(),
                          newExercSeries.toString(),
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
                                    // newExercSeries = series;
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
                                  // newExercSeries = series;
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
                                    // newExercReps = repetitions;
                                    print(newExercReps);
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
                                    // newExercReps = repetitions;
                                    print(newExercReps);
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
              'Adicionar',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Provider.of<ExercData>(context, listen: false)
                  .addExerc(newExercTitle, ExercSeries, ExercReps);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
