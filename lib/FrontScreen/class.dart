import 'package:flutter/material.dart';

class ClassData extends StatelessWidget {
  const ClassData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Android Programming"), // Name Of Subject
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.face),
            tooltip: "Profile",
            onPressed: () {},
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 200.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 5.0, right: 20.0),
                child: Container(
                  width: 5000.0,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: const Center(
                    child: Text(
                      "Android Programming", // Name Of Subject
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 5.0, right: 20.0),
                child: Container(
                  width: 5000.0,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: const Center(
                    child: Text(
                      "CSC - 105", // Subject Code
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 5.0, right: 20.0),
                child: Container(
                  width: 5000.0,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: const Center(
                    child: Text(
                      "Thursday", // Day
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 5.0, right: 20.0),
                child: Container(
                  width: 5000.0,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: const Center(
                    child: Text(
                      "09:30 - 13:30", // lecture timing
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Add"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
