import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'View.dart';

class scan extends StatefulWidget {
  const scan({Key? key}) : super(key: key);

  @override
  State<scan> createState() => _scanState();
}

class _scanState extends State<scan> {
  List <String> uniqueID=[];
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
                onPressed: null,
                child: Text("Save and Upload"))


          ],
      ),
    );
  }


}

