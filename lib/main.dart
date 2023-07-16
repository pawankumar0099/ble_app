import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  bool _switchValue = true;
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
                      'Good Morning',
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
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade400)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 22, right: 10, top: 15),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Scan Bluetooth Devices",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Turn bluetooth on/off',
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                          Switch(
                            value: _switchValue,
                            onChanged: (value) {
                              _switchValue = value;
                            },
                          ),
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          child: Text('Scan',
                              style: TextStyle(color: Colors.grey.shade600)),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.shade100,
                              minimumSize: const Size(100, 30),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22),
                              ))),
                    ],
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
                        child: Container(
                      margin: EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromRGBO(57, 210, 192, 1)),
                      child: const Row(children: [
                        SizedBox(width: 20),
                        Icon(
                          Icons.bluetooth_connected,
                          color: Colors.white,
                          size: 40,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Connected Device',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Pawan\'s iPhone',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ]),
                    )),
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color.fromRGBO(75, 57, 239, 1)),
                          child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.chrome_reader_mode_rounded,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                      SizedBox(height: 10),
                                      Text('Read Batch Code',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600))
                                    ]),
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                      SizedBox(height: 10),
                                      Text('Set Batch Code',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400))
                                    ]),
                              ]),
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color.fromRGBO(251, 175, 124, 1)),
                          child: const Row(children: [
                            SizedBox(width: 20),
                            Icon(
                              Icons.contact_mail_rounded,
                              color: Colors.white,
                              size: 40,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Start Test',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ]),
                        )),
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
