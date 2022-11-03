import 'package:flutter/material.dart';
import '../scan/scan.dart';
import './classroom.dart';

class MainScreen extends StatelessWidget{
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0,),
            child: Container(
              color: Colors.red,
              child: const Center (
                child: Padding (
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Text(
                    "GOA UNIVERSITY",
                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                  ),
                )
              ),
            ),
          ),
          Container(
            child: const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text("Department of Computer Science and Technology",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ) ,
          ),
          Image.asset('assets/images/unigoa.jpg'),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const Classroom()
                  )
              );
            },
            child: const Text("CLASSROOM"),
          ),
          ElevatedButton(
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => scan(),
              ));
            },
            child: const Text("Scan Bar Code"),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              color: Colors.red,
              child: Center (
                  child: Padding (
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Card(
                      color: Colors.red,
                      elevation: 10.0,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: const <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(left: 110.0),
                                  child: Text(
                                    "Teacher Details",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0
                                    ),
                                  ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 80.0),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "Name: Jarret Fernandez",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            "Age: 35",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            "Address: Margao Goa",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              ),
            ),
          ),
        ],
    );
  }
}