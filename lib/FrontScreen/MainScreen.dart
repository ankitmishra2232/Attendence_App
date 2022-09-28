import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget{
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

          body: Column(
            children: [
              Container(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 19.0,top: 30.0),
                    child: Text("Department of Computer Science and Technology",
                    style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                  ),
                ) ,
              ),
              Container(
                child: Text("GOA UNIVERSITY"),
              ),
              Container(
                child: Image.asset('assets/images/unigoa.jpg'),
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {  },
                child: Text("CLASSROOM"),
                ),
              )
            ],
          ),

    );
  }

}