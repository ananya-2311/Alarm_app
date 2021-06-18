import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AnalogClockView extends StatefulWidget {
  const AnalogClockView({Key? key}) : super(key: key);

  @override
  _AnalogClockViewState createState() => _AnalogClockViewState();
}

class _AnalogClockViewState extends State<AnalogClockView> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if(!timezoneString.startsWith('-')) offsetSign = '+';
    print(timezoneString);
    return Scaffold(
      backgroundColor:Color(0xff2D2F41),

      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildMenuButton("ALARM"),
              buildMenuButton("STOPWATCH"),
              buildMenuButton("TIMER"),

            ],
          ),
          VerticalDivider(color: Colors.white54,),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 64, 32,32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("CLOCK",
                  style: TextStyle(fontSize: 24, color: Colors.white),),

                  SizedBox(height: 12,),
                  Text(formattedTime,
                    style: TextStyle(fontSize: 60, color: Colors.white),),
                  Text(formattedDate,
                    style: TextStyle(fontSize: 24, color: Colors.white),),
                  SizedBox(height: 30,),
                  Center(
                    child: AnalogClock(
                      decoration: BoxDecoration(
                          border: Border.all(width: 10.0, color: Color(0xffeaecff)),
                          color: Color(0xff444974),
                          shape: BoxShape.circle),
                      width: 200.0,
                      height: 200,
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
                  SizedBox(height: 30,),
                  Text("TimeZone",
                    style: TextStyle(fontSize: 20, color: Colors.white),),

                  Text("UTC"  + offsetSign + timezoneString ,
                    style: TextStyle(fontSize: 24, color: Colors.white),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

FlatButton buildMenuButton(String title){
  return FlatButton(onPressed: (){},
  child: Column(
    children: [
      FlutterLogo(),
      SizedBox(height: 16,),
      Text(title,style: TextStyle(color: Colors.white, fontSize: 14),)
    ],
  ),);
}