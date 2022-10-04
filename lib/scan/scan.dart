import 'package:flutter/material.dart';

class scan extends StatelessWidget {
  const scan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scanning"),
      ),
        body: Container(
        child: Text("CAMERA"),
      ),
    );
  }
}
