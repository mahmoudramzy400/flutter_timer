import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: Center(
            child: TimerWidget(title: 'Flutter Demo Home Page'),
          ),
        ));
  }
}

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key, required this.title});

  final String title;

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  int _startTime = DateTime.now().millisecondsSinceEpoch;
  int _millisSecondsNumber = 0;
  int _secondsNumber = 0;
  int _minutesNumber = 0;

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(milliseconds: 10), (timer) {
      int timeDifference = DateTime.now().millisecondsSinceEpoch - _startTime;

      double seconds = timeDifference / 1000;
      double minutes = seconds / 60;
      double leftOverSeconds = seconds % 60;
      double leftOverMillisSeconds = timeDifference % 1000 / 10;

      setState(() {
        _millisSecondsNumber = leftOverMillisSeconds.floor();
        _secondsNumber = leftOverSeconds.floor();
        _minutesNumber = minutes.floor();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text('$_minutesNumber:$_secondsNumber: $_millisSecondsNumber');
  }
}
