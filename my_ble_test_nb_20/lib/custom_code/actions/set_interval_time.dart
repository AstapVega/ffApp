// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import 'ble_custom_action.dart';

Future setIntervalTime(
  String mode,
  int curentDay,
  int curentInterval,
) async {
  int lastIndex = 0;

  int minutBuf = 0, hourBuf = 0;
  String minutBufString, houreBufString;

  String name;

  lastIndex = FFAppState().curentInterval;

  FFAppState().curentInterval = curentInterval;
  print(" TEST ");

  curentDay = curentDay - 1; // поправка

  if (FFAppState().standartShedullMode ==
      true) // если выбран текущий режим распиания стнадартный  то добавчая часть имни == 'Standart'
  {
    name = 'Standart';
  } else {
//то добавчая часть имени == 'Сustom'
    name = 'Custom';
  }

  // FFAppState().HourMinutMode = true; //отладка

  if (FFAppState().HourMinutMode == true) {
    // если выбран текущий режим распиания стнадартный  то добавчая часть имни == 'Standart'
    // target = 'timeHour';
    FFAppState().HourBorder = const Color(0x67838A9D);
    FFAppState().MinutBorder = const Color.fromARGB(0, 248, 248, 248);
  } else {
//то добавчая часть имени == 'Сustom'
    // target = 'timeMinut';

    FFAppState().HourBorder = const Color.fromARGB(0, 248, 248, 248);
    FFAppState().MinutBorder = const Color(0x67838A9D);
  }

//2. в флой эдиторе ставим двройно улвынй вызов между  вызовом Апдейт UI стандарт и апдейт UI custom

  if (mode == 'ReadState') {
    // target = 'timeHour';
    // 1. Читаем температуру из
    houreBufString = readDeviceShedulleField(FFAppState().selectedDeviceId,
        "days[$curentDay]dayIntervals$name[$lastIndex].timeHour");
    FFAppState().HourShedule = houreBufString.toString();
    print(" TEST ");

    //  target = 'timeHour';
    minutBufString = readDeviceShedulleField(FFAppState().selectedDeviceId,
        "days[$curentDay]dayIntervals$name[$lastIndex].timeMinut");
    FFAppState().MinutShedule = minutBufString.toString();
    print(" TEST ");
  }
//------------------------------------------------------------------------------

  if (mode == 'ValuePlus') {
    // 1. Читаем температуру из

    if (FFAppState().HourMinutMode == true) {
      // если выбран текущий режим распиания стнадартный  то добавчая часть имни == 'Standart'

      houreBufString = readDeviceShedulleField(FFAppState().selectedDeviceId,
          "days[$curentDay]dayIntervals$name[$lastIndex].timeHour");

      hourBuf = IntFromString(houreBufString); // gпреобразуем значение
      hourBuf = hourBuf + 1; //модифицирем

      FFAppState().HourShedule = hourBuf.toString(); //передаем в индикатор

// пересохраняем изменое значение обратно в структур РАСПИСАНИЕ
      updateDeviceShedulleField(
          FFAppState().selectedDeviceId,
          "days[$curentDay]dayIntervals$name[$lastIndex].timeHour",
          FFAppState().HourShedule); //
    } else {
//то добавчая часть имени == 'Сustom'

      minutBufString = readDeviceShedulleField(FFAppState().selectedDeviceId,
          "days[$curentDay]dayIntervals$name[$lastIndex].timeMinut");

      minutBuf = IntFromString(minutBufString); // gпреобразуем значение
      minutBuf = minutBuf + 1; //модифицирем

      FFAppState().MinutShedule = minutBuf.toString(); //передаем в индикатор

// пересохраняем изменое значение обратно в структур РАСПИСАНИЕ
      updateDeviceShedulleField(
          FFAppState().selectedDeviceId,
          "days[$curentDay]dayIntervals$name[$lastIndex].timeMinut",
          FFAppState().MinutShedule); //
    }

    print(" TEST ");
  }
//-----------------------------------------------------------------------
  if (mode == 'ValueMinus') {
    if (FFAppState().HourMinutMode == true) {
      // если выбран текущий режим распиания стнадартный  то добавчая часть имни == 'Standart'

      houreBufString = readDeviceShedulleField(FFAppState().selectedDeviceId,
          "days[$curentDay]dayIntervals$name[$lastIndex].timeHour");

      hourBuf = IntFromString(houreBufString); // gпреобразуем значение
      hourBuf = hourBuf - 1; //модифицирем

      FFAppState().HourShedule = hourBuf.toString(); //передаем в индикатор

// пересохраняем изменое значение обратно в структур РАСПИСАНИЕ
      updateDeviceShedulleField(
          FFAppState().selectedDeviceId,
          "days[$curentDay]dayIntervals$name[$lastIndex].timeHour",
          FFAppState().HourShedule); //
    } else {
//то добавчая часть имени == 'Сustom'

      minutBufString = readDeviceShedulleField(FFAppState().selectedDeviceId,
          "days[$curentDay]dayIntervals$name[$lastIndex].timeMinut");

      minutBuf = IntFromString(minutBufString); // gпреобразуем значение
      minutBuf = minutBuf - 1; //модифицирем

      FFAppState().MinutShedule = minutBuf.toString(); //передаем в индикатор

// пересохраняем изменое значение обратно в структур РАСПИСАНИЕ
      updateDeviceShedulleField(
          FFAppState().selectedDeviceId,
          "days[$curentDay]dayIntervals$name[$lastIndex].timeMinut",
          FFAppState().MinutShedule); //

      print(" TEST ");
    }
  }
}
