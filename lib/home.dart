import 'package:alarm_app/clock_view.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';
import 'analog_clock.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnalogClockView(),
    );
  }
}
