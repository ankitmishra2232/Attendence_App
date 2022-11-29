import 'package:attendence_app/FrontScreen/addClassForm.dart';
import 'package:attendence_app/FrontScreen/profile.dart';
import 'package:flutter/material.dart';
import './class.dart';
import 'dart:convert';
import 'package:attendence_app/model/classes.dart';
import 'package:http/http.dart'as http;

class Classroom extends StatefulWidget {
  const Classroom({Key? key}) : super(key: key);

  @override
  State<Classroom> createState() => _ClassroomState();
}

class _ClassroomState extends State<Classroom> {

  @override
  Widget build(BuildContext context) {
    // classList = getClasses();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jarret Fernandez"), //Name of Teacher
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
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: FutureBuilder(
            future: getClasses(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(
                  child: Text(
                    "Loading...",
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  )
                );
              }
              else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      onPressed: () {},
                      child: Padding (
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 150.0,
                          child: Card(
                            color: Colors.amber,
                            shadowColor: Colors.white,
                            elevation: 25.0,
                            child: Column(
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.only(top: 40.0),
                                  child: Text (
                                    "CSC-105",
                                    style: TextStyle(
                                      fontSize: 30.0,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0, left: 70.0),
                                  child: Row(
                                    children: const <Widget> [
                                      Text (
                                        "Android Programming",
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                );
              }
            }
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => const addClassForm(),
          ));
          // display a form to take inputs of new class
        }
      ),
    );
  }

  getClasses() async {
    // fetch all classes taught by the logged in teacher
    var classList = <Classes>[];
    Classes classes;
    final response = await http.get(Uri.parse("https://script.google.com/macros/s/AKfycbyZCHxey_JUEsN8d1WKwSI4u4yP91DXrqfPqEozALNvSWXkwUQEKbmyrvTWQ20-TsDNJA/exec?action=getClasses"));
    print(response.statusCode);
    print(response.body);
    var notesJson = jsonDecode(response.body);
    print(notesJson);
    for(var x in notesJson) {
      classes = Classes(x["ClassID"], x["ClassName"], x["TeacherEmail"]);
      print(jsonEncode(classes));
      print(classes);
      classList.add(classes);
    }
    print(classList.length);
    return classList;
  }
}