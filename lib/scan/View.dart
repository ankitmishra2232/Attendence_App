import 'package:flutter/material.dart';
import 'scan.dart';
class cards extends StatelessWidget {
  int count=0;
  List<String> uniqueID;
  List<String> list= [];
  cards(
  {required this.uniqueID}
);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    list.addAll(uniqueID);

    return Scaffold(
      appBar: AppBar(
        title: Text('Attendence'),
      ),
      body: ListView.builder(
        itemCount: 1,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Card(
                elevation: 50.0,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
                  child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            for (int i=0; i<list.length; i++)
                              Text(
                                    list[i],
                                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                ),
              ),
            );
          }),
    );
  }

//   void setState(Null Function() param0) {}
}