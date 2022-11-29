import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:intl/intl.dart';
import 'View.dart';
import 'package:attendence_app/model/model.dart';

class scan extends StatefulWidget {
  const scan({Key? key}) : super(key: key);

  @override
  State<scan> createState() => _scanState();
}

class _scanState extends State<scan> {
  List <String> uniqueID=[];
  String date1="";
  String time1="";
  String attendence0="";
  String _data ="";
  String information ="";
  bool _displayNewTextField = false;
  TextEditingController _inputdata = TextEditingController();
  _scan() async{
    return await FlutterBarcodeScanner.scanBarcode("#000000", "Cancel", true, ScanMode.BARCODE)
        .then((value) => setState(()=>_data = value));
  }

  @override
  Widget build(BuildContext context) {
    final date= DateTime.now();  //current date and time
    String date0= DateFormat.yMMMMd('en_US').format(date);
    final time = DateTime.now();
    final time0 = DateFormat.Hm().format(time);
    attendence0 = uniqueID.toString();
    date1=date0.toString();
    time1=time0.toString();
    return Scaffold(

      appBar: AppBar(
        title: Text("Scanning"),
      ),
        body: Column(
          children: [
            ElevatedButton(
                onPressed:()=> _scan(),
                child: Text("Scan")
            ),
            Text(_data),
            Visibility(
              visible: _displayNewTextField,
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: _inputdata,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.location_on),
                    hintText: 'Enter Unique code',
                    labelText: 'Unique ID',
                  ),
                ),
            ),
            ElevatedButton(
                onPressed:  () async {
                  setState(() {
                    _displayNewTextField = true;
                  });
                  _data="";
                },
                child: Text("Add mannually")
            ),
            Text(_inputdata.text),
            ElevatedButton(
                onPressed: (){
                  if (_data=="-1" || _data == ""){
                      information = _inputdata.text;
                  }
                  else{
                      information = _data;
                  }
                  // print("information  "+ information);
                  if(information != ""){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("information  "+ information)));
                    uniqueID.add(information);
                    information = "";
                    _inputdata.text ="";
                    _data="";
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Insert Data")));
                  }

                },
                child: Text("Submit ")),
            ElevatedButton(
                onPressed: () {
                  if(!uniqueID.isEmpty){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          cards(uniqueID:uniqueID)),
                    );
                  }

                },
                child: Text("View")),
            ElevatedButton(
                onPressed: (){
                  // print(uniqueID.toString());
                  print(" hii"+attendence0);
                  postAttendence();
                },
                child: Text("Save and Upload"))


          ],
      ),
    );
  }
  postAttendence() async{
    final attendence= Att("abc@gmail.com",date1,time1,attendence0);
    String attendenceinfo=jsonEncode(attendence);
    var response = await http.post(Uri.parse("https://script.google.com/macros/s/AKfycbxtK7kAkxeOT4xLQEVP41mZf33WkJqZZ9brNaQ_VfedlXvZX93K30IZe4iCf4DKNJoxwg/exec?action=addAttandance"),
      body: attendenceinfo,
    );
    print(response.body);
    print(attendenceinfo);

  }

}

