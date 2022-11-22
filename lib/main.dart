import 'package:attendence_app/FrontScreen/loginSignup.dart';
import 'package:attendence_app/FrontScreen/profile.dart';
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
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.face),
              tooltip: "Profile",
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const Profile()
                    )
                );
              },
            )
          ],
        ),
        // body: const MainScreen(),
        body: loginsignup(),  //loginsignup page
      )
    );
  }
}
