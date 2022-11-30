import 'package:attendence_app/FrontScreen/loginSignup.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  Profile(this.user, {Key? key}) : super(key: key);
  User1? user;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

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
                  builder: (context) => Profile(widget.user),
                )
              );
            },
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: Container(
            color: Colors.red,
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Card(
              color: Colors.lightBlue,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      color: Colors.white,
                      child: const Icon(Icons.face, size: 100.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      widget.user!.teacherName!,
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      widget.user!.teacherEmail!,
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const LoginSignUp(),
                            )
                        );
                      },
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