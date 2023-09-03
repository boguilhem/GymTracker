import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gymtracker/screens/exercs_screen.dart';
import 'screens/add_exerc_screen.dart';
import 'models/exerc_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ExercData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: ExercsScreen.id,
        routes: {
          ExercsScreen.id: (context) => ExercsScreen(),
          AddExercScreen.id: (context) => AddExercScreen(),
        },
      ),
    );
  }
}
