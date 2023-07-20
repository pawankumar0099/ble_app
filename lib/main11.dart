// import 'package:flutter/material.dart';
// import 'package:flutter_blue/flutter_blue.dart';
// import 'dart:async' show StreamSubscription;

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Bluetooth Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       // home: BluetoothHomePage(),
//       home: DataTransferPage(
//         device: BluetoothDevice(),
//       ),
//     );
//   }
// }

// class BluetoothHomePage extends StatefulWidget {
//   @override
//   _BluetoothHomePageState createState() => _BluetoothHomePageState();
// }

// class _BluetoothHomePageState extends State<BluetoothHomePage> {
//   BluetoothState _bluetoothState = BluetoothState.unknown;
//   List<ScanResult> _devicesList = [];

//   @override
//   void initState() {
//     super.initState();
//     FlutterBlue.instance.state.listen((state) {
//       setState(() {
//         _bluetoothState = state;
//       });
//     });
//   }

//   void _startDiscovery() {
//     FlutterBlue.instance.startScan(timeout: Duration(seconds: 4));

//     FlutterBlue.instance.scanResults.listen((results) {
//       setState(() {
//         _devicesList = results;
//       });
//     });
//   }

//   void _connectToDevice(BluetoothDevice device) async {
//     // Perform connection logic here
//     // await device.connect();
//     // Navigate to the DataTransferPage
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => DataTransferPage(device: device),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Bluetooth Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Bluetooth Status:',
//               style: TextStyle(fontSize: 24),
//             ),
//             Text(
//               _bluetoothState.toString(),
//               style: TextStyle(fontSize: 20),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               child: Text(
//                 'Scan for Devices',
//                 style: TextStyle(fontSize: 18),
//               ),
//               onPressed: _startDiscovery,
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Available Devices:',
//               style: TextStyle(fontSize: 24),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _devicesList.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   final device = _devicesList[index].device;
//                   return ListTile(
//                     title: Text(device.name),
//                     subtitle: Text(device.id.toString()),
//                     trailing: ElevatedButton(
//                       child: Text(
//                         'Connect',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                       onPressed: () {
//                         _connectToDevice(device);
//                       },
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DataTransferPage extends StatefulWidget {
//   final BluetoothDevice device;

//   DataTransferPage({required this.device});

//   @override
//   _DataTransferPageState createState() => _DataTransferPageState();
// }

// class _DataTransferPageState extends State<DataTransferPage> {
//   List<String> _messageList = [];
//   TextEditingController _textEditingController = TextEditingController();

//   BluetoothCharacteristic? _characteristic;
//   BluetoothCharacteristic? characteristic_1;
//   bool _isConnected = false;
//   StreamSubscription<List<int>>? _streamSubscription;
//   @override
//   void initState() {
//     super.initState();
//     _connectToDevice();
//   }

//   void _connectToDevice() async {
//     List<BluetoothService> services = await widget.device.discoverServices();
//     services.forEach((service) {
//       service.characteristics.forEach((characteristic) {
//         if (characteristic.properties.write ||
//             characteristic.properties.writeWithoutResponse) {
//           _characteristic = characteristic;
//         }
//         if (characteristic.properties.notify) {
//           characteristic_1 = characteristic;
//         }
//       });
//     });
//     setState(() {
//       _isConnected = true;
//     });
//   }

//   void _sendMessage() async {
//     if (_textEditingController.text.isNotEmpty && _characteristic != null) {
//       await _characteristic!.write(_textEditingController.text.codeUnits);
//       setState(() {
//         _messageList.add('Sent: ${_textEditingController.text}');
//         _textEditingController.clear();
//       });
//     }
//   }

//   void _startListeningToNotifications() async {
//     if (characteristic_1 != null) {
//       await characteristic_1!.setNotifyValue(true);
//       _streamSubscription = characteristic_1!.value.listen((value) {
//         final message = String.fromCharCodes(value);
//         setState(() {
//           _messageList.add('Received: $message');
//         });
//       });
//     }
//   }

//   void _receiveMessage() {
//     // Perform logic to receive data from the device
//     // You can update the _messageList with received data
//     _startListeningToNotifications();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Data Transfer'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: _messageList.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ListTile(
//                   title: Text(_messageList[index]),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _textEditingController,
//                     decoration: InputDecoration(
//                       hintText: 'Enter message',
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 8.0),
//                 ElevatedButton(
//                   onPressed: _sendMessage,
//                   child: Text('Send Data'),
//                 ),
//                 SizedBox(width: 8.0),
//                 ElevatedButton(
//                   onPressed: _receiveMessage,
//                   child: Text('Receive Data'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
