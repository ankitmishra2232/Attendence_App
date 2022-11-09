import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class scan extends StatefulWidget {
  const scan({Key? key}) : super(key: key);

  @override
  State<scan> createState() => _scanState();
}

class _scanState extends State<scan> {
  String _data ="";

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
                child: Text("Scan")),
            Text(_data)
          ],
      ),
    );
  }
}


// class scan extends StatefulWidget {
//   const scan({Key? key}) : super(key: key);
//   String _data ="";
//
//   Future<String> _scan() async{
//     return await FlutterBarcodeScanner.scanBarcode("#000000", "Cancel", true, ScanMode.BARCODE);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Scanning"),
//       ),
//         body: Column(
//           children: [
//             ElevatedButton(
//                 onPressed: ()async =>setState(()=>_data = _scan()),
//                 child: Text("Scan")),
//             Text(_data)
//           ],
//       ),
//     );
//   }
//
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }
// }
