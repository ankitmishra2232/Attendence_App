import 'package:flutter/material.dart';

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
  TextEditingController _classID = TextEditingController();
  TextEditingController _password = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  controller: _classID,
                  decoration: const InputDecoration(
                      icon: const Icon(Icons.class_),
                      hintText: 'Enter your name',
                      labelText: 'Name',
                ),
                ),
                Container(
                  padding: EdgeInsets.only(left:100,top: 30),
                  child: ElevatedButton(
                    onPressed: (){
                    //  if submitted succesfully back to login screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => loginsignup()),
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
}
bool isEmailValid(String? email) {
  RegExp regex = new RegExp(r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  return regex.hasMatch(email!);
}