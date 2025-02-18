import 'package:calendar_builder/calendar_builder.dart';
import 'package:flutter/material.dart';

class CustomMonthBuilderScreen extends StatelessWidget {
  const CustomMonthBuilderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CbMonthBuilder(
                cbConfig: CbConfig(
                    startDate: DateTime(2024),
                    endDate: DateTime(2123),
                    selectedDate: DateTime(2024),
                    selectedYear: DateTime(2024),
                    weekStartsFrom: WeekStartsFrom.sunday,
                    eventDates: [
                      DateTime(2024, 1, 2),
                      DateTime(2024, 1, 2),
                      DateTime(2024, 1, 3)
                    ],
                    highlightedDates: [
                      DateTime(2024, 1, 6),
                      DateTime(2024, 1, 3)
                    ]),
                yearDropDownCustomizer: YearDropDownCustomizer(
                  yearHeaderBuilder:
                      (isYearPickerExpanded, selectedDate, selectedYear, year) {
                    return Container(
                      height: 40,
                      color: Colors.blue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            year,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Icon(!isYearPickerExpanded
                              ? Icons.arrow_drop_down_outlined
                              : Icons.arrow_drop_up_outlined)
                        ],
                      ),
                    );
                  },
                ),
                monthCustomizer: MonthCustomizer(
                  montMinhHeight: 200,
                  monthMinWidth: 450,
                  padding: const EdgeInsets.all(20),
                  monthHeaderBuilder:
                      (month, headerHeight, headerWidth, paddingLeft) {
                    return Container(
                      color: Colors.grey[200],
                      height: headerHeight,
                      width: headerWidth,
                      child: Padding(
                        padding: EdgeInsets.only(left: paddingLeft),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            month,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  monthWeekBuilder: (index, weeks, weekHeight, weekWidth) {
                    return SizedBox(
                      height: weekHeight,
                      width: weekWidth,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blueAccent.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.blueAccent)),
                          child: Align(
                            child: Text(
                              weeks,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  monthButtonBuilder: (dateTime,
                      childHeight,
                      childWidth,
                      isSelected,
                      isDisabled,
                      hasEvent,
                      isHighlighted,
                      isCurrentDay) {
                    //Text Theme
                    final txtTheme = Theme.of(context).textTheme;
                    //color theme
                    final colorTheme = Theme.of(context);

                    var daysText = Align(
                      child: Text(
                        '${dateTime.day}',
                        style: isDisabled
                            ? txtTheme.caption
                            : isSelected
                                ? txtTheme.bodyText1!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        colorTheme.brightness == Brightness.dark
                                            ? Colors.black
                                            : Colors.white)
                                : isHighlighted
                                    ? txtTheme.bodyText2 //Highlighted TextStyle
                                    : isCurrentDay
                                        ? txtTheme
                                            .bodyText2 //CurrentDay TextStyle
                                        : txtTheme.bodyText2,
                      ),
                    );
                    if (isSelected) {
                      return Container(
                        decoration: const BoxDecoration(
                          color: Colors.blueAccent,
                          shape: BoxShape.rectangle,
                        ),
                        margin: const EdgeInsets.all(2),
                        child: daysText,
                      );
                    }
                    return Container(
                      decoration: BoxDecoration(
                          color: isDisabled ? Colors.grey[200] : Colors.blue,
                          shape: BoxShape.rectangle,
                          border: hasEvent || isHighlighted
                              ? Border.all(
                                  color:
                                      isHighlighted ? Colors.blueAccent : Colors.blue,
                                  width: 2)
                              : null),
                      margin: const EdgeInsets.all(2),
                      child: daysText,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
