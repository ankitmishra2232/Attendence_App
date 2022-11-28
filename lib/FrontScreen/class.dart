import 'package:attendence_app/FrontScreen/profile.dart';
import 'package:flutter/material.dart';
import '../scan/scan.dart';
import './addLecForm.dart';

class ClassData extends StatefulWidget {
  const ClassData({Key? key}) : super(key: key);

  @override
  State<ClassData> createState() => _ClassDataState();
}

class _ClassDataState extends State<ClassData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Android Programming"), // Name Of Subject
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.face),
            tooltip: "Profile",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Profile(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 200.0),
          child: Column(
            children: <Widget>[
              Card(
                child: Column(
                  children: const <Widget>[
                    Text("Android Programming", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),),
                    Text("CSC-105", style: TextStyle(fontSize: 30.0)),
                    Text("Day and Time", style: TextStyle(fontSize: 30.0)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AddLecForm()
                      )
                    );
                  },
                  child: const Text("Add"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const scan()
                        )
                    );
                  },
                  child: const Text("Scan"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}