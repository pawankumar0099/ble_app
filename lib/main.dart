import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'dart:async' show StreamSubscription;
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  BluetoothDevice? device;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  List<ScanResult> _devicesList = [];
  ScanResult? selectedDevice;
  List<ScanResult> filteredDevices = [];

  AnimationController? _animationController;
  Animation<Color?>? _colorAnimation;

  bool _switchValue = true;
  String connected_device = "";
  BluetoothDevice? device_1;
  BluetoothCharacteristic? _characteristic;
  BluetoothCharacteristic? characteristic_1;
  StreamSubscription<List<int>>? _streamSubscription;
  String received_message = "";

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
    _colorAnimation = ColorTween(
      begin: Colors.grey,
      end: Colors.blue,
    ).animate(_animationController!);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (device_1 != null) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        _startListeningToNotificationsAfterDelay();
      });
    }
  }

  void _startListeningToNotificationsAfterDelay() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _startListeningToNotifications();
  }

  void showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text('Received Message')),
          content: Text(received_message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the popup
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _makeConnection() async {
    List<BluetoothService> services = await device_1!.discoverServices();
    services.forEach((service) {
      service.characteristics.forEach((characteristic) {
        if (characteristic.properties.write ||
            characteristic.properties.writeWithoutResponse) {
          _characteristic = characteristic;
        }
      });
    });
  }

  void _receiveMessage() async {
    List<BluetoothService> services = await device_1!.discoverServices();
    services.forEach((service) {
      service.characteristics.forEach((characteristic) {
        if (characteristic.properties.notify) {
          characteristic_1 = characteristic;
        }
      });
    });
  }

  void _sendMessage(String command) async {
    if (_characteristic != null) {
      await _characteristic!.write(command.codeUnits);
    }
  }

  void _startListeningToNotifications() async {
    if (characteristic_1 != null) {
      await characteristic_1!.setNotifyValue(true);
      _streamSubscription = characteristic_1!.value.listen((value) {
        final message = String.fromCharCodes(value);
        setState(() {
          received_message = message;
          print(message);
        });
        if (message != "") {
          showPopup(context);
        }
      });
    }
  }

  void _connectToDevice(BluetoothDevice device) async {
    // Perform connection logic here
    device_1 = device;
    await device.connect();

    if (device != null) {
      setState(() {
        connected_device = device!.name ?? "unknown";
      });
      _makeConnection();
      _receiveMessage();
      _startListeningToNotificationsAfterDelay();
    }
  }

  void _startDiscovery() {
    FlutterBluePlus.instance.startScan(timeout: const Duration(seconds: 2));

    FlutterBluePlus.instance.scanResults.listen((results) {
      setState(() {
        _devicesList = results;
      });

      setState(() {
        filteredDevices = _devicesList
            .where((result) => result.device.name.isNotEmpty)
            .toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bluetooth Example',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(241, 244, 248, 1),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 22, top: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(radius: 28),
                    SizedBox(height: 14),
                    Text(
                      'Greetings Of The Day',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 26,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Pawan 👋',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(76, 58, 239, 1),
                        fontSize: 26,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              //image slider
              CarouselSlider(
                items: [
                  Container(
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/2.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/3.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/4.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
                options: CarouselOptions(
                  height: 150,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 900),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {});
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 22, right: 22),
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromRGBO(188, 204, 154, 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 22, right: 10, top: 8),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Turn bluetooth on/off',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Switch(
                              value: true,
                              onChanged: (value) {
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // AnimatedBuilder(
                            //   animation: _animationController!,
                            //   builder: (BuildContext context, Widget? child) {
                            //     final color = _colorAnimation!.value!;
                            //     return Icon(
                            //       Icons.bluetooth,
                            //       color: color,
                            //       size: 48,
                            //     );
                            //   },
                            // ),
                            ElevatedButton(
                              onPressed: () {
                                _startDiscovery();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey.shade100,
                                minimumSize: const Size(100, 40),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22),
                                ),
                              ),
                              child: Text(
                                'Scan',
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                color: Colors.grey.shade100,
                              ),
                              child: Center(
                                child: DropdownButton<ScanResult>(
                                  value: selectedDevice,
                                  underline: const SizedBox(),
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.grey.shade600,
                                    size: 16,
                                  ),
                                  onChanged: (ScanResult? newValue) {
                                    setState(() {
                                      selectedDevice = newValue;
                                    });
                                  },
                                  items: filteredDevices
                                      .map<DropdownMenuItem<ScanResult>>(
                                          (ScanResult device) {
                                    return DropdownMenuItem<ScanResult>(
                                      value: device,
                                      child: Text(device.device.name),
                                    );
                                  }).toList(),
                                  hint: Text(
                                    'Select a device',
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // ElevatedButton(
                        //   child: const Text(
                        //     'Connect',
                        //     style: TextStyle(fontSize: 16),
                        //   ),
                        //   onPressed: () {
                        //     _connectToDevice(selectedDevice!.device);
                        //   },
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 22,
                  right: 22,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromRGBO(57, 210, 192, 1),
                      ),
                      child: Row(children: [
                        const SizedBox(width: 20),
                        const Icon(
                          Icons.bluetooth_connected,
                          color: Colors.white,
                          size: 40,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Connected Device',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              connected_device ?? '',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ]),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromRGBO(75, 57, 239, 1),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                _sendMessage("U402");
                              },
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.chrome_reader_mode_rounded,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Read Batch Code',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _sendMessage("U403");
                              },
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Set Batch Code',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromRGBO(251, 175, 124, 1),
                        ),
                        child: Row(children: [
                          const SizedBox(width: 20),
                          const Icon(
                            Icons.contact_mail_rounded,
                            color: Colors.white,
                            size: 40,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              _sendMessage("U401");
                            },
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Start Test',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
