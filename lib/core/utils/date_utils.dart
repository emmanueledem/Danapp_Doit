import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateUtil {
  static String shortFormatDate(DateTime? dateTime) {
    return DateFormat.yMMMd().format(dateTime!);
  }

  static String longFormatDate(DateTime? dateTime) {
    return DateFormat.yMMMMd().format(dateTime!);
  }

  static String timeFormat(DateTime dateTime) {
    return DateFormat('jms').format(dateTime);
  }

  static String slashFormatDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  static String formatDateAndTime(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd hh:mm:ss a').format(dateTime);
  }

  static String formatLongDateAndTime(DateTime dateTime) {
    return DateFormat('dd MMMM yyyy, hh:mm a').format(dateTime);
  }

  static DateTime combineDateTime(DateTime date, TimeOfDay time) {
    return DateTime.utc(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
  }
}
