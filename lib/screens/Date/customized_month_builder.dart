import 'package:calendar_builder/calendar_builder.dart';
import 'package:flutter/material.dart';

class CustomizedMonthBuilderScreen extends StatefulWidget {
  const CustomizedMonthBuilderScreen({Key? key}) : super(key: key);

  @override
  State<CustomizedMonthBuilderScreen> createState() =>
      _CustomizedMonthBuilderScreenState();
}

class _CustomizedMonthBuilderScreenState
    extends State<CustomizedMonthBuilderScreen> {
  bool isDarkMode = true;
  DateTime selectedDate = DateTime.now(); // Set the selected date to today

  @override
  Widget build(BuildContext context) {
    // Calculate the first and last day of the current month
    final DateTime now = DateTime.now();
    final DateTime firstDayOfMonth = DateTime(now.year, now.month, 1);
    final DateTime lastDayOfMonth = DateTime(now.year, now.month + 1, 0);

    final selectedYear = DateTime(now.year); // Wrap current year into DateTime object

    return Theme(
      data: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: CbMonthBuilder(
                  cbConfig: CbConfig(
                    startDate: firstDayOfMonth, // First day of the current month
                    endDate: lastDayOfMonth, // Last day of the current month
                    selectedDate: selectedDate, // Highlight the selected date
                     selectedYear: DateTime(2024), // Current year as DateTime object
                    weekStartsFrom: WeekStartsFrom.sunday,
                    // You can customize further if needed
                  ),
                  monthCustomizer: MonthCustomizer(
                    padding: const EdgeInsets.all(20),
                    monthHeaderCustomizer: MonthHeaderCustomizer(
                      textStyle: const TextStyle(
                        color: Colors.blue,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    monthButtonCustomizer: MonthButtonCustomizer(
                      borderStrokeWidth: 2,
                      textStyleOnDisabled: const TextStyle(color: Colors.blue),
                      highlightedColor: Color.fromARGB(255, 92, 91, 91),
                    ),
                    monthWeekCustomizer: MonthWeekCustomizer(
                      textStyle: const TextStyle(
                        color: Color.fromARGB(255, 92, 91, 91),
                      ),
                    ),
                  ),
                  onDateClicked: (onDateClicked) {
                    setState(() {
                      selectedDate = onDateClicked.selectedDate; // Update selected date
                    });
                    snackBar(
                      'selected date' +
                          onDateClicked.selectedDate.toString() +
                          '\n' +
                          'isSelected ' +
                          onDateClicked.isSelected.toString() +
                          '\n' +
                          'isHighlighted ' +
                          onDateClicked.isHighlighted.toString() +
                          '\n' +
                          'hasEvent ' +
                          onDateClicked.hasEvent.toString() +
                          '\n' +
                          'isCurrentDate ' +
                          onDateClicked.isCurrentDate.toString() +
                          '\n' +
                          'isDisabled ' +
                          onDateClicked.isDisabled.toString(),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            setState(() {
              isDarkMode = !isDarkMode;
            });
          },
          isExtended: true,
          label: Row(
            children: [
              Icon(!isDarkMode ? Icons.dark_mode : Icons.light_mode),
              Text(!isDarkMode ? '  Dark Mode' : '  Light Mode')
            ],
          ),
        ),
      ),
    );
  }

  void snackBar(Object meg) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(meg.toString())));
  }
}
