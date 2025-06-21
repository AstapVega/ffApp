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

import 'ble_custom_action.dart';

Future setIntervalTempere(
  String mode,
  int curentDay,
  int curentInterval,
) async {
  int lastIndex = 0, tempWholeInt = 0, tempHalfInt = 0, setup_temp_shedulle = 0;
  String tempWholeString, tempHalfString, tempMinus;

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

//2. в флой эдиторе ставим двройно улвынй вызов между  вызовом Апдейт UI стандарт и апдейт UI custom

  if (mode == 'ReadState') {
    // 1. Читаем температуру из
    tempWholeString = readDeviceShedulleField(FFAppState().selectedDeviceId,
        "days[$curentDay]dayIntervals$name[$lastIndex].temperatureHigtByte");

    tempHalfString = readDeviceShedulleField(FFAppState().selectedDeviceId,
        "days[$curentDay]dayIntervals$name[$lastIndex].temperatureLowByte");

    tempWhole = IntFromString(tempWholeString);
    tempHalf = IntFromString(tempHalfString);

    setup_temp_shedulle = combineTemperature(
        tempWhole, tempHalf); //переводим два байта в  int setup_temp

    convertTemperature(
        setup_temp_shedulle); //раскладываем обратно значение на формат старший байт + младший (деястые доли)

    FFAppState().TempereSheduleHigthByte = tempWhole.toString();
    FFAppState().TempereSheduleLowByte = tempHalf.toString();
  }

  if (mode == 'ValuePlus') {
    // 1. Читаем температуру из
    tempWholeString = readDeviceShedulleField(FFAppState().selectedDeviceId,
        "days[$curentDay]dayIntervals$name[$lastIndex].temperatureHigtByte");

    tempHalfString = readDeviceShedulleField(FFAppState().selectedDeviceId,
        "days[$curentDay]dayIntervals$name[$lastIndex].temperatureLowByte");

    tempWhole = IntFromString(tempWholeString);
    tempHalf = IntFromString(tempHalfString);

    setup_temp_shedulle = combineTemperature(
        tempWhole, tempHalf); //переводим два байта в  int setup_temp

    setup_temp_shedulle = setup_temp_shedulle + 5;

    convertTemperature(
        setup_temp_shedulle); //раскладываем обратно значение на формат старший байт + младший (деястые доли)

    FFAppState().TempereSheduleHigthByte = tempWhole.toString();
    FFAppState().TempereSheduleLowByte = tempHalf.toString();

// пересохраняем изменое значение обратно в структур РАСПИСАНИЕ
    updateDeviceShedulleField(
        FFAppState().selectedDeviceId,
        "days[$curentDay]dayIntervals$name[$lastIndex].temperatureHigtByte",
        tempWhole); //для понедльника нулевой интервал

    updateDeviceShedulleField(
        FFAppState().selectedDeviceId,
        "days[$curentDay]dayIntervals$name[$lastIndex].temperatureLowByte",
        tempHalf); //для понедльника нулевой интервал

    print(" TEST ");
  }

  if (mode == 'ValueMinus') {
    lastIndex = FFAppState().curentInterval;

    // 1. Читаем температуру из
    tempWholeString = readDeviceShedulleField(FFAppState().selectedDeviceId,
        "days[$curentDay]dayIntervals$name[$lastIndex].temperatureHigtByte");

    tempHalfString = readDeviceShedulleField(FFAppState().selectedDeviceId,
        "days[$curentDay]dayIntervals$name[$lastIndex].temperatureLowByte");

    tempWhole = IntFromString(tempWholeString); //перводим в int
    tempHalf = IntFromString(tempHalfString); //перводим в int

    setup_temp_shedulle = combineTemperature(
        tempWhole, tempHalf); //переводим два байта в  int setup_temp НО
    // учитываем реальную рафметику если стоит флаг минус

    setup_temp_shedulle = setup_temp_shedulle - 5;

    if (setup_temp_shedulle == (-5)) {
      setup_temp_shedulle = -10; // и поехали дальше
    }

    convertTemperature(
        setup_temp_shedulle); //раскладываем обратно значение на формат старший байт + младший (деястые доли)

    FFAppState().TempereSheduleHigthByte = tempWhole.toString();
    FFAppState().TempereSheduleLowByte = tempHalf.toString();

// пересохраняем изменое значение обратно в структур РАСПИСАНИЕ
    updateDeviceShedulleField(
        FFAppState().selectedDeviceId,
        "days[$curentDay]dayIntervals$name[$lastIndex].temperatureHigtByte",
        tempWhole); //для понедльника нулевой интервал

    updateDeviceShedulleField(
        FFAppState().selectedDeviceId,
        "days[$curentDay]dayIntervals$name[$lastIndex].temperatureLowByte",
        tempHalf); //для понедльника нулевой интервал

    print(" TEST ");
  }
}
