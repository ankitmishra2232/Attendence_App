import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget{
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

          body: Column(
            children: [
              Container(
                child: Text("Department of Computer Science and Technology") ,
              ),
              Container(
                child: Text("GOA UNIVERSITY"),
              ),
              Container(
                child: Image.asset('assets/images/unigoa.jpg'),
              )
            ],
          ),

    );
  }

}