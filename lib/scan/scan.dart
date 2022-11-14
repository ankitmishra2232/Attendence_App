import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class scan extends StatefulWidget {
  const scan({Key? key}) : super(key: key);

  @override
  State<scan> createState() => _scanState();
}

class _scanState extends State<scan> {
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
                  print("information  "+ information);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("information  "+ information)));
                },
                child: Text("Submit ")),
            ElevatedButton(
                onPressed: null,
                child: Text("View")),
            ElevatedButton(
                onPressed: null,
                child: Text("Save and Upload"))


          ],
      ),
    );
  }


}

