import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';

class AnalogClockView extends StatefulWidget {
  const AnalogClockView({Key? key}) : super(key: key);

  @override
  _AnalogClockViewState createState() => _AnalogClockViewState();
}

class _AnalogClockViewState extends State<AnalogClockView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xff2D2F41),

      body: Center(
        child: AnalogClock(
          decoration: BoxDecoration(
              border: Border.all(width: 10.0, color: Color(0xffeaecff)),
              color: Color(0xff444974),
              shape: BoxShape.circle),
          width: 200.0,
          isLive: true,
          hourHandColor: Colors.pink,
          minuteHandColor: Colors.red,
          showSecondHand: true,
          numberColor: Color(0xffeaecff),
          showNumbers: true,
          textScaleFactor: 1.4,
          showTicks: true,
          showDigitalClock: true,
          datetime: DateTime(2019, 1, 1, 9, 12, 15),
        ),
      ),
    );
  }
}

//Container(
//alignment: Alignment.center,
//color: Color(0xff2D2F41),