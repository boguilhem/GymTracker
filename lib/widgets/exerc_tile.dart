import 'package:flutter/material.dart';

class ExercTile extends StatelessWidget {
  final bool isChecked;
  final String exercTitle;
  final Function checkboxCallback;
  final Function longPressCallback;
  final Function tapCallback;

  ExercTile(
      {required this.isChecked,
      required this.exercTitle,
      required this.checkboxCallback,
      required this.tapCallback,
      required this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: tapCallback as void Function()?,
      onLongPress: longPressCallback as void Function()?,
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback as void Function(bool?)?,
        // onChanged: (bool val) {
        //   checkboxCallback();
        // },
      ),
      title: Text(
        exercTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
    );
  }
}
