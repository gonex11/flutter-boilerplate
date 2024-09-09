import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String toDayWeekDayFullMonthYear([String? locale = "id"]) {
    initializeDateFormatting(locale);
    return DateFormat("EEEE, dd MMMM yyyy", locale).format(toLocal());
  }

  String toDayMonthYear([String? locale = "id"]) {
    initializeDateFormatting(locale);
    return DateFormat("dd-MM-yyyy", locale).format(toLocal());
  }

  String toDayFullMonthYear([String? locale = "id"]) {
    initializeDateFormatting(locale);
    return DateFormat("dd MMMM yyyy", locale).format(toLocal());
  }

  String toYearMonthDay([String? locale = "id"]) {
    initializeDateFormatting(locale);
    return DateFormat("yyyy-MM-dd", locale).format(toLocal());
  }

  String toFullDateWithTime([String? locale = "id"]) {
    initializeDateFormatting(locale);
    return DateFormat("dd MMMM yyyy, HH:mm", locale).format(toLocal());
  }

  String toHms() {
    return DateFormat().add_Hms().format(toLocal());
  }
}

extension DateTimeNullableExt on DateTime? {
  String toDayWeekDayFullMonthYear([String? locale = "id"]) {
    if (this == null) return "-";
    initializeDateFormatting(locale);
    return DateFormat("dddd, dd MM yyyy", locale).format(this!.toLocal());
  }

  String toDayMonthYear([String? locale = "id"]) {
    if (this == null) return "-";
    initializeDateFormatting(locale);
    return DateFormat("dd-MM-yyyy", locale).format(this!.toLocal());
  }

  String toDayFullMonthYear([String? locale = "id"]) {
    if (this == null) return "-";
    initializeDateFormatting(locale);
    return DateFormat("dd MMMM yyyy", locale).format(this!.toLocal());
  }

  String toYearMonthDay([String? locale = "id"]) {
    if (this == null) return "-";
    initializeDateFormatting(locale);
    return DateFormat("yyyy-MM-dd", locale).format(this!.toLocal());
  }

  String toFullDateWithTime([String? locale = "id"]) {
    if (this == null) return "-";
    initializeDateFormatting(locale);
    return DateFormat("dd MMMM yyyy, HH:mm", locale).format(this!.toLocal());
  }

  String toHms() {
    if (this == null) return "";
    return DateFormat().add_Hms().format(this!.toLocal());
  }
}
