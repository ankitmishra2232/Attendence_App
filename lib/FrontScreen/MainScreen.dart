import 'package:flutter/material.dart';
import '../scan/scan.dart';

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
                color: Colors.red,
                child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text("GOA UNIVERSITY",
                      style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                    )),
              ),
              Container(
                child: Image.asset('assets/images/unigoa.jpg'),
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {  },
                child: Text("CLASSROOM"),
                ),
              ),
              Container(
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => scan(),
                    ));
                  },
                  child: Text("Scan Bar Code"),
                ),
              )
            ],
          ),

    );
  }

}