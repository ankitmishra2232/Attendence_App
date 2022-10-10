import 'package:flutter/material.dart';
import 'FrontScreen/mainScreen.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: "Attendance",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Attendance"),
        ),
        body: const MainScreen(),
      )
    );
  }
}
