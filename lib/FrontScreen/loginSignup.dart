import 'dart:convert';
import 'dart:ffi';
import 'package:attendence_app/FrontScreen/Signup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import '../model/model.dart';
import 'dart:async';

import 'mainScreen.dart';
class loginsignup extends StatefulWidget {
  const loginsignup({Key? key}) : super(key: key);

  @override
  State<loginsignup> createState() => _loginsignupState();
}

class _loginsignupState extends State<loginsignup> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool out=true;

  List<User1> users = [];

  fetchNotes() async{
    // var notes = <User1>[];
    final response = await http.get(Uri.parse('https://script.google.com/macros/s/AKfycbxUX_3HZZzXKIcMNWRr4S_BgJyEghj8sACssjLkErfrxcVKTiNHF-nrd-KrscA5WqtzvQ/exec?action=getTeacher'));
    // print(response.statusCode);
    // print(response.body);
    var notesJson = jsonDecode(response.body);
    print(notesJson);
    for(var u in notesJson){
      User1 user =User1(u["teacherEmail"],u["password"]);
      users.add(user);
    }
    // print(users.length);
    return users;
  }
  // checkEmailPassword(a,b,c){
  //   for(var i =0;i<a.length;i++) {
  //     if(a[i].teacherEmail==b && a[i].password==c){
  //       print(out);
  //       // return out;
  //     }
  //   else{
  //     out = false;
  //     print(out);
  //     }
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    fetchNotes();
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
              // obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: 'Password'
              ),
            ),
            SizedBox(height: 40,),
            GestureDetector(
              onTap: (){
                print(passwordController.text);
                for(var i=0;i<users.length;i++){
                  if(users[i].teacherEmail==emailController.text &&  users[i].password==passwordController.text){
                    print("yes");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()),
                    );
                  }
                  else if(users[i].teacherEmail==emailController.text &&  users[i].password!=passwordController.text){
                    print("no");
                    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please insert correct Password")));
                    // break;
                  }
                  else if(users[i].teacherEmail!=emailController.text ){
                    print("no");
                    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please register youself First")));
                    // break;
                  }
                  print(users[i].teacherEmail);
                  print(users[i].password);
                }
                // print(users[0].password);
                // checkEmailPassword(users,emailController,passwordController);
                //if validated

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
  final String? teacherEmail;
  final String? password;
  User1(this.teacherEmail, this.password);
}