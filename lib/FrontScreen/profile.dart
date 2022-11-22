import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 150.0),
          child: Container(
            color: Colors.red,
            width: 200.0,
            height: 200.0,
            child: Card(
              color: Colors.lightBlue,
              child: Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Teacher Name",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Teacher Email",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Subjects Taught",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("LogOut"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
