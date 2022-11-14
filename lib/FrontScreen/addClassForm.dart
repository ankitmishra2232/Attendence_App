import 'package:flutter/material.dart';

class addClassForm extends StatefulWidget {
  const addClassForm({Key? key}) : super(key: key);

  @override
  State<addClassForm> createState() => _addClassFormState();
}

class _addClassFormState extends State<addClassForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Class"),
      ),
      body: Form(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 150.0),
              child: TextFormField(
                autofocus: true,
                decoration: const InputDecoration(
                  label: Text("Add Class Name"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  // add value in database
                },
                child: const Text("Submit"),
              ),
            )
          ],
        )
      ),
    );
  }
}
