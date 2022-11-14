import 'package:flutter/material.dart';

class addLecForm extends StatefulWidget {
  const addLecForm({Key? key}) : super(key: key);

  @override
  State<addLecForm> createState() => _addLecFormState();
}

class _addLecFormState extends State<addLecForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Lecture Timings"),
      ),
      body: Form(
        child: Column(
          children: <Widget> [
            TextFormField(
              // drop down displaying Mon - Sat
            ),
            TextFormField(
              // text field to input start time
            ),
            TextFormField(
              // text field to input end time
            ),
            ElevatedButton(
              onPressed: () {
                // data will saved in excell sheet
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
