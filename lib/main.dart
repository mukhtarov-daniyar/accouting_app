import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isClicking = false;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        isClicking = !isClicking;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Автокликер'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Нажимать кнопку?'),
              Switch(
                value: isClicking,
                onChanged: (value) {
                  setState(() {
                    isClicking = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  timer.cancel();
                },
                child: Text('Остановить'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
