import 'dart:convert';
import 'package:attendence_app/FrontScreen/Signup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart';

class loginsignup extends StatefulWidget {
  const loginsignup({Key? key}) : super(key: key);

  @override
  State<loginsignup> createState() => _loginsignupState();
}

class _loginsignupState extends State<loginsignup> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  void login(String email , password) async {

    try{

      Response response = await post(
          Uri.parse('https://script.google.com/macros/s/AKfycbz2lhhkczv6DiZBwx39Or7T_xC-0pETH2QiWvZzmLr2nJ6Njzdeg7ICTaQ_VHrLXOqcKw/exec?action=getTeacher'),   //use you API
          body: {
            'email' : email,
            'password' : password
          }
      );

      if(response.statusCode == 200){

        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('Login successfully');

      }else {
        print('failed');
      }
    }catch(e){
      print(e.toString());
    }
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
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: 'Password'
              ),
            ),
            SizedBox(height: 40,),
            GestureDetector(
              onTap: (){
                login(emailController.text.toString(), passwordController.text.toString());
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
                    MaterialPageRoute(builder: (context) =>
                        Signup()),
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
