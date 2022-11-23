import 'dart:convert';
import 'package:attendence_app/FrontScreen/Signup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import '../model/model.dart';

class loginsignup extends StatefulWidget {
  const loginsignup({Key? key}) : super(key: key);

  @override
  State<loginsignup> createState() => _loginsignupState();
}

class _loginsignupState extends State<loginsignup> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  List<User1> users = [];

  Future fetchNotes() async{
    // var notes = <User1>[];
    var response = await http.get(Uri.parse('https://script.google.com/macros/s/AKfycbw_Jw0bUK-EArzcTfruTiqSj-fqvZiZe2JqM_TGKFkaPkM8A4gFJVxjQVLdQC0eWqGDzA/exec?action=getTeacher'));


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
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Text('Login'),),
              ),

            ),
            ElevatedButton(
                onPressed:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Signup()),
                  );
                }
              ,
                child: Text("Signup"),),
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