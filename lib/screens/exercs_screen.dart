import 'package:flutter/material.dart';
import 'package:gymtracker/widgets/exercs_list.dart';
import 'package:gymtracker/screens/add_exerc_screen.dart';
import 'package:provider/provider.dart';
import 'package:gymtracker/models/exerc_data.dart';
import 'package:gymtracker/screens/edit_exerc_screen.dart';

class ExercsScreen extends StatelessWidget {
  static const String id = 'exercs_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          Navigator.pushNamed(context, AddExercScreen.id);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => EditExercScreen(data: 'Hello World'),
          //   ),
          // );
          // showModalBottomSheet(
          //   context: context,
          //   isScrollControlled: true,
          //   builder: (context) => SingleChildScrollView(
          //     child: Container(
          //       padding: EdgeInsets.only(
          //           bottom: MediaQuery.of(context).viewInsets.bottom),
          //       child: AddExercScreen(),
          //     ),
          //   ),
          // );
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Gym Tracker',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${Provider.of<ExercData>(context).exercCount} Exercícios',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: ExercsList(),
            ),
          ),
        ],
      ),
    );
  }
}
