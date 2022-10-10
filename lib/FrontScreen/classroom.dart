import 'package:flutter/material.dart';
import './class.dart';

class Classroom extends StatelessWidget {
  const Classroom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jarret Fernandez"), //Name of Teacher
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const ClassData()
                      )
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 150.0,
                    child: Card (
                      color: Colors.amber,
                      shadowColor: Colors.white,
                      elevation: 25.0,
                      child: Column(
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(top: 50.0),
                            child: Text (
                              "Android Programming",
                              style: TextStyle(
                                fontSize: 30.0,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                            child: Row(
                              children: const <Widget> [
                                Text (
                                  "CSC-105",
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 105.0),
                                  child: Text (
                                    "09:30 - 13:30",
                                    style: TextStyle(fontSize: 20.0),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const ClassData()
                      )
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 150.0,
                    child: Card (
                      color: Colors.amber,
                      shadowColor: Colors.white,
                      elevation: 25.0,
                      child: Column(
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(top: 50.0),
                            child: Text (
                              "Android Programming",
                              style: TextStyle(
                                fontSize: 30.0,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                            child: Row(
                              children: const <Widget> [
                                Text (
                                  "CSC-105",
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 105.0),
                                  child: Text (
                                    "09:30 - 13:30",
                                    style: TextStyle(fontSize: 20.0),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        child: const Icon(Icons.add),
        onPressed: () {
          // display a form to take inputs of new class
        }
      ),
    );
  }
}
