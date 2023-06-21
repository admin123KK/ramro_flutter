import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({super.key});

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  String currentTime = '';
  String greeting = '';
  @override
  void initState() {
    super.initState();
    startClock();
    setGreeting();
  }

  void setGreeting() {
    var hour = DateTime.now().hour;

    if (hour < 12) {
      greeting = 'Good Morning';
    } else if (hour < 18) {
      greeting = 'Good Afternoon';
    } else {
      greeting = 'Good Evening ';
    }
  }

  void startClock() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        currentTime = DateFormat('hh:mm:ss a').format(DateTime.now());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Clock'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              greeting,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: Align(
            alignment: Alignment.center,
            child: Text(
              currentTime,
              style: TextStyle(fontSize: 23),
            ),
          ))
        ],
      ),
    );
  }
}
