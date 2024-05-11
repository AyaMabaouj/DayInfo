import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../utils.dart';
import 'package:get/get.dart';

class TableBasicsExample extends StatefulWidget {
  @override
  _TableBasicsExampleState createState() => _TableBasicsExampleState();
}

class _TableBasicsExampleState extends State<TableBasicsExample> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
              "Table Calender",
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
      body: Column(
        children: [
         
               Padding(
                 padding: const EdgeInsets.only(top: 50.0),
                 child: TableCalendar(
                  firstDay: kFirstDay,
                  lastDay: kLastDay,
                  focusedDay: _focusedDay,
                  calendarFormat: _calendarFormat,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                               
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                  calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                               ),
               ),
          SizedBox(height: 70,),
        
              Text(
                _getCurrentDate(),
                style: TextStyle(fontSize: 30),
              ),
            
          
        ],
      ),
    );
  }

  String _getCurrentDate() {
    Locale? locale = Get.locale;
    if (locale != null) {
      initializeDateFormatting(locale.toLanguageTag());
      return DateFormat.yMMMMEEEEd(locale.toString()).format(DateTime.now());
    } else {
      // Return a default date format if locale is not set
      return DateFormat.yMMMMEEEEd().format(DateTime.now());
    }
  }
}
