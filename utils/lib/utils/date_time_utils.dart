import 'package:date_format/date_format.dart' as df;
import 'package:flutter/material.dart';

class DateTimeUtils {
  static const String dd = df.dd;
  static const String yyyy = df.yyyy;
  static const String yy = df.yy;
  static const String mm = df.mm;
  static const String m = df.m;
  static const String MM = df.MM;
  static const String M = df.M;
  static const String d = df.d;
  static const String w = df.w;
  static const String WW = df.WW;
  static const String W = df.W;
  static const String DD = df.DD;
  static const String D = df.D;
  static const String hh = df.hh;
  static const String h = df.h;
  static const String HH = df.HH;
  static const String H = df.H;
  static const String nn = df.nn;
  static const String n = df.n;
  static const String ss = df.ss;
  static const String s = df.s;
  static const String SSS = df.SSS;
  static const String S = df.S;
  static const String uuu = df.uuu;
  static const String u = df.u;
  static const String am = df.am;
  static const String z = df.z;
  static const String Z = df.Z;

  static const List<String> dataFormat = [dd, "/", mm, "/", yyyy];
  static const List<String> dataHoraFormat = [
    dd,
    "/",
    mm,
    "/",
    yyyy,
    " ",
    HH,
    ":",
    nn
  ];
  static const List<String> dataHoraSimplesFormat = [HH, ":", nn];
  static const List<String> dataHoraFullFormat = [
    dd,
    "/",
    mm,
    "/",
    yyyy,
    " ",
    HH,
    ":",
    nn,
    ":",
    ss
  ];
  static const List<String> dataHora = [
    dd,
    "/",
    mm,
    "/",
    yyyy,
    " ",
    HH,
    ":",
    nn,
  ];
  static const List<String> sqlFormat = [yyyy, "-", mm, "-", dd];
  static const List<String> invertedNoFormatData = [yyyy, mm, dd];
  static const List<String> invertedNoFormatHora = [HH, nn, ss];

  static String? format(DateTime? dateTime, List<String> formats) {
    if (dateTime == null) return null;
    return df.formatDate(dateTime, formats);
  }

  static DateTime fromString(String dataHora) {
    //String Formato aceito --> AAAA MM DD HH MM SS

    String year = dataHora.substring(0, 4);
    String month = dataHora.substring(4, 6);
    String dayOfMonth = dataHora.substring(6, 8);
    String hour = dataHora.substring(8, 10);
    String minute = dataHora.substring(10, 12);
    String second = dataHora.substring(12, 14);

    return DateTime(int.parse(year), int.parse(month), int.parse(dayOfMonth),
        int.parse(hour), int.parse(minute), int.parse(second));
  }

  static String horaFormated({TimeOfDay? timeOfDay, DateTime? dateTime}) {
    //retorna String  --> HH : MM
    String hora = "";
    if (timeOfDay != null) {
      if (timeOfDay.hour < 9) {
        hora = "0${timeOfDay.hour}";
      } else {
        hora = "${timeOfDay.hour}";
      }
      if (timeOfDay.minute < 9) {
        hora += ":0${timeOfDay.minute}";
      } else {
        hora += ":${timeOfDay.minute}";
      }
    } else if (dateTime != null) {
      if (dateTime.hour < 9) {
        hora = "0${dateTime.hour}";
      } else {
        hora = "${dateTime.hour}";
      }
      if (dateTime.minute < 9) {
        hora += ":0${dateTime.minute}";
      } else {
        hora += ":${dateTime.minute}";
      }
    }
    return hora;
  }


  static String printDuration(Duration duration, {bool? printSeconds}) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    if (duration.inDays > 0)
      return '${duration.inDays} dia${(duration.inDays > 1) ? "s" : ""}';

    if (printSeconds == null || !printSeconds)
      return "${twoDigits(duration.inHours)}:$twoDigitMinutes";
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}
