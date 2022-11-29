import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:attendence_app/FrontScreen/profile.dart';
import 'package:attendence_app/model/classes.dart';
import 'package:flutter/material.dart';

class addClassForm extends StatefulWidget {
  const addClassForm({Key? key}) : super(key: key);

  @override
  State<addClassForm> createState() => _addClassFormState();
}

class _addClassFormState extends State<addClassForm> {
  // final _formKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  String ClassID = "";
  String ClassName = "";
  String TeacherEmail = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Class"),
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
      body: Form(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 150.0),
              child: TextFormField(
                autofocus: true,
                decoration: const InputDecoration(
                  label: Text("Enter ClassID"),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter ClassID";
                  }
                  else {
                    ClassID = value;
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
              child: TextFormField(
                autofocus: true,
                decoration: const InputDecoration(
                  label: Text("Enter Class Name"),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Class Name";
                  }
                  else {
                    ClassName = value;
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  // add value in database
                  // if (_formKey.currentState!.validate()) {
                  //   addClass();
                  // }
                  addClass();
                },
                child: const Text("Submit"),
              ),
            )
          ],
        )
      ),
    );
  }

  addClass() async { // testing not done
    // final classes = Classes(ClassID, ClassName, TeacherEmail); //teacher email needs to fetch from local storage
    final classes = Classes(ClassID, ClassName, "jsf001@unigoa.ac.in");
    String classData = jsonEncode(classes);
    var response = await http.post(
      Uri.parse("https://script.google.com/macros/s/AKfycbyZCHxey_JUEsN8d1WKwSI4u4yP91DXrqfPqEozALNvSWXkwUQEKbmyrvTWQ20-TsDNJA/exec?action=addClass"),
      body: classData,
    );
    print(response.body);
  }
}
