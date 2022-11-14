import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class scan extends StatefulWidget {
  const scan({Key? key}) : super(key: key);

  @override
  State<scan> createState() => _scanState();
}

class _scanState extends State<scan> {
  String _data ="";
  late String information;
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
            TextFormField(
              keyboardType: TextInputType.phone,
              controller: _inputdata,
              decoration: const InputDecoration(
                icon: const Icon(Icons.location_on),
                hintText: 'Enter Unique code',
                labelText: 'Unique ID',
              ),
            ),
            Text(_inputdata.text),
            Text(_data),
            Container(
                // padding: EdgeInsets.only(left: 120.0, top: 40.0),
                child: ElevatedButton(
                  onPressed: () {
                      // formKey.currentState!.save();
                      print(_data);
                      print(_inputdata.text);
                      if (_data == "-1"){
                        information = _inputdata.text;
                      }
                      else{
                        information = _data;
                      }

                      print("information  "+ information);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(information)));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, //button's fill color
                    onPrimary: Colors.black, //specify the color of the button's text and icons as well as the overlay colors used to indicate the hover, focus, and pressed states
                    // onSurface: Colors.black, //specify the button's disabled text, icon, and fill color
                    shadowColor: Colors.red, //specify the button's elevation color
                    elevation: 4.0, //buttons Material shadow
                    textStyle: TextStyle(fontFamily: 'roboto',fontWeight: FontWeight.w800,fontSize: 25), //specify the button's text TextStyle
                  ),
                  child: Text('Submit'),
                )
            )
          ],
      ),
    );
  }
}

