import 'dart:convert';
import '../main.dart';
import'../model/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'loginSignup.dart';


class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final formKey = GlobalKey<FormState>();
  TextEditingController _teacheremail = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _password = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register please...."),
      ),
      body: Container(
        padding: EdgeInsets.only(left:20,right: 10,top:20),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  validator: (email) {
                    if (isEmailValid(email)) return null;
                    else
                      return 'Enter a valid email address';
                  },
                  keyboardType: TextInputType.emailAddress,
                  controller: _teacheremail,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.email),
                    hintText: 'Enter Your E-Mail',
                    labelText: 'E-mail',
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _name,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Enter your name',
                    labelText: 'Name',
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: _password,
                  obscureText: true,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.password),
                    labelText: 'Password',
                  ),

                ),
                TextFormField(
                  controller: _phone,
                  decoration: const InputDecoration(
                      icon: const Icon(Icons.phone_android),
                      hintText: 'Enter your mobile number',
                      labelText: 'Phone',
                ),
                ),
                Container(
                  padding: EdgeInsets.only(left:100,top: 30),
                  child: ElevatedButton(
                    onPressed: (){

                      postData();
                      // print(_password.text);
                    //  if submitted succesfully back to login screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp()),
                      );
                    },
                  child: Text("Submit") ,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  postData() async{
    final user= User(_name.text, _teacheremail.text, _phone.text, _password.text);
    String userdata=jsonEncode(user);
    var response = await http.post(Uri.parse("https://script.google.com/macros/s/AKfycbwtXcJRcp4Wtesto0VfB4s4QdhzLmjrzFXAsLFl5Cg7gP8yXaImcPebYuFc763doLb_BA/exec?action=addTeacher"),
        body: userdata
    );
    print(response.body);

  }
}
bool isEmailValid(String? email) {
  RegExp regex = new RegExp(r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  return regex.hasMatch(email!);
}