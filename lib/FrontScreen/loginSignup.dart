import 'dart:convert';
import 'package:attendence_app/FrontScreen/Signup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import '../model/model.dart';
import 'dart:async';
class loginsignup extends StatefulWidget {
  const loginsignup({Key? key}) : super(key: key);

  @override
  State<loginsignup> createState() => _loginsignupState();
}

class _loginsignupState extends State<loginsignup> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  List<User1> users = [];

  fetchNotes() async{
    // var notes = <User1>[];
    final response = await http.get(Uri.parse('https://script.google.com/macros/s/AKfycbw_Jw0bUK-EArzcTfruTiqSj-fqvZiZe2JqM_TGKFkaPkM8A4gFJVxjQVLdQC0eWqGDzA/exec?action=getTeacher'));
    print(response.statusCode);

    var notesJson = jsonDecode(response.body);
    print(notesJson);
    for(var u in notesJson){
      User1 user =User1(u["teacheremail"],u["password"]);
      users.add(user);
    }
    print(users.length);
    return users;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: 'Email'
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: 'Password'
              ),
            ),
            SizedBox(height: 40,),
            GestureDetector(
              onTap: (){
                fetchNotes();
                //if validated
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => MainScreen()),
                // );
              },
              child: Container(
                height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text('Login'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ElevatedButton(
                  onPressed:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signup()),
                    );
                  },
                  child: const Text("Signup... Create New Account"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class User1{
  final String teacheremail;
  final String password;
  User1(this.teacheremail, this.password);
}