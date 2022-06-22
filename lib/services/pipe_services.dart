import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Pipe {
  static String convertDateToString(DateTime date) {
    return DateFormat().add_yMMMMEEEEd().format(date);
  }

  static String convertDateTimeToTimeString(DateTime date) {
    return DateFormat().add_jms().format(date);
  }

  static DateTime convertTimOfDayToDateTime(TimeOfDay t) {

    final now = DateTime.now();
    return  DateTime(now.year, now.month, now.day, t.hour, t.minute);

  }


}

extension MyString on String {
  String get titleCase => splitMapJoin(' ',
      onMatch: (e) => ' ',
      onNonMatch: (e) => e.isEmpty
          ? ''
          : !(e.length > 1)
              ? e.toUpperCase()
              : (e.substring(0, 1).toUpperCase() +
                  e.substring(1).toLowerCase()));
}
