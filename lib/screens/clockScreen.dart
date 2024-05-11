import 'package:flutter/material.dart';
import 'package:one_clock/one_clock.dart';

class clockScreen extends StatefulWidget {
  const clockScreen({Key? key}) : super(key: key);

  @override
  State<clockScreen> createState() => _clockScreenState();
}

class _clockScreenState extends State<clockScreen> {
  DateTime dateTime = DateTime.now();

  void _setNewDateTime(DateTime dateTime) {
    setState(() {
      this.dateTime = dateTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Determine whether it's AM or PM
    String period = (dateTime.hour < 12) ? 'AM' : 'PM';
    // Adjust the hour to 12-hour format
    int hour = (dateTime.hour > 12) ? dateTime.hour - 12 : dateTime.hour;

    return Scaffold(
      appBar: AppBar(
          title: Text(
              "Clock",
              style: TextStyle(
                color: Colors.white, // Set text color to white
              ),
            ),       
         backgroundColor: Colors.blue,
         leading: IconButton(
            icon: Icon(Icons.arrow_back,color: Colors.white,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
      ),
      
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 90,
              ),
              // This is the second Analog Clock
             AnalogClock(
              width: 300,
              height: 300,
              isLive: true,
              showDigitalClock: false,
              decoration: BoxDecoration(
                color: const Color.fromARGB(196, 33, 149, 243), // Set clock background color to blue
                shape: BoxShape.circle,
              ),
              hourHandColor: Colors.white, // Set hour hand color to a shade of blue
              minuteHandColor: Colors.white, // Set minute hand color to a shade of blue
              secondHandColor: Colors.red, // Set second hand color to a shade of blue
              numberColor: Colors.white, // Set number color to a shade of blue
              tickColor : Colors.white,
              datetime: dateTime,
            ),

              SizedBox(
                height: 70,
              ),
              // This is the second Digital Clock
              Text(
                "$hour:${dateTime.minute}:${dateTime.second} $period",
                style: TextStyle(
                  fontSize: 40, // Adjust the font size here
                  color: Colors.black, // Change the color of the text
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
