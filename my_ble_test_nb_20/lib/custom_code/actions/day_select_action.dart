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

import 'ble_custom_action.dart';

// FFAppState().update(() {
// if (FFAppState().day1Select.isNotEmpty) {
//  FFAppState().day1Select[0] = const Color(0xFF838A9D);
//   FFAppState().day1Select[1] = const Color(0xFFE00606);
//  } else {
//  FFAppState().day1Select.add(const Color(0xFF838A9D));
//  FFAppState().day1Select.add(const Color(0xFFFFFFFF));
// }
// });

Future daySelectAction(String? selectedDay) async {
// ВНИМАНИЕ !!! если изначально проинициализировать FFppstate лист или стркутру заченими по умолчанию - то доступ к полм удет напрмяю ..
//если нет- то нужно создавать.
// При нклике на нужный день - обновляем цвета
// Для распиания - текущий выбраный день определяем методом вычитывани яцветоп в нужном девайсе - если цвет СЕРЫЙ , то выставляем зачение ffappstate().selectedDay = 1/2/3..

// ВЫЧИТЫВААЕМ ИЗ ДЕВАЙСА

  FFAppState().day1Select[0] =
      readListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day1Select');
  FFAppState().day2Select[0] =
      readListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day2Select');
  FFAppState().day3Select[0] =
      readListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day3Select');
  FFAppState().day4Select[0] =
      readListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day4Select');
  FFAppState().day5Select[0] =
      readListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day5Select');
  FFAppState().day6Select[0] =
      readListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day6Select');
  FFAppState().day7Select[0] =
      readListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day7Select');

  print("ПРОЧИТАНО!");

// ОБНОВЛЯЕМ  ПЕРЕМЕННЕ FFAppState().dayXXSelect

  if (selectedDay == 'readDevice') {
    if (FFAppState().day1Select[0] == const Color.fromRGBO(131, 138, 157, 1)) {
      selectedDay = 'day1';
      FFAppState().curentDay =
          1; // в глобальную перменную состояния пишем текуший выбраный день НЕДЕЛИ
    }
    if (FFAppState().day2Select[0] == const Color.fromRGBO(131, 138, 157, 1)) {
      selectedDay = 'day2';
      FFAppState().curentDay =
          2; // в глобальную перменную состояния пишем текуший выбраный день НЕДЕЛИ
    }
    if (FFAppState().day3Select[0] == const Color.fromRGBO(131, 138, 157, 1)) {
      selectedDay = 'day3';
      FFAppState().curentDay =
          3; // в глобальную перменную состояния пишем текуший выбраный день НЕДЕЛИ
    }
    if (FFAppState().day4Select[0] == const Color.fromRGBO(131, 138, 157, 1)) {
      selectedDay = 'day4';
      FFAppState().curentDay =
          4; // в глобальную перменную состояния пишем текуший выбраный день НЕДЕЛИ
    }
    if (FFAppState().day5Select[0] == const Color.fromRGBO(131, 138, 157, 1)) {
      selectedDay = 'day5';
      FFAppState().curentDay =
          5; // в глобальную перменную состояния пишем текуший выбраный день НЕДЕЛИ
    }
    if (FFAppState().day6Select[0] == const Color.fromRGBO(131, 138, 157, 1)) {
      selectedDay = 'day6';
      FFAppState().curentDay =
          6; // в глобальную перменную состояния пишем текуший выбраный день НЕДЕЛИ
    }
    if (FFAppState().day7Select[0] == const Color.fromRGBO(131, 138, 157, 1)) {
      selectedDay = 'day7';
      FFAppState().curentDay =
          7; // в глобальную перменную состояния пишем текуший выбраный день НЕДЕЛИ
    }
  }

  if (selectedDay == 'day1') // если кликнули на ПОНЕДЕЛЬНИК
  {
    FFAppState().day1Select[0] = const Color.fromRGBO(131, 138, 157, 1);
    FFAppState().day1Select[1] = const Color.fromRGBO(255, 255, 255, 1);
    FFAppState().day2Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day2Select[1] = const Color(0xFF838A9D);
    FFAppState().day3Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day3Select[1] = const Color(0xFF838A9D);
    FFAppState().day4Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day4Select[1] = const Color(0xFF838A9D);
    FFAppState().day5Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day5Select[1] = const Color(0xFF838A9D);
    FFAppState().day6Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day6Select[1] = const Color(0xFF838A9D);
    FFAppState().day7Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day7Select[1] = const Color(0xFF838A9D);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day1Select',
        FFAppState().day1Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day2Select',
        FFAppState().day2Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day3Select',
        FFAppState().day3Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day4Select',
        FFAppState().day4Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day5Select',
        FFAppState().day5Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day6Select',
        FFAppState().day6Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day7Select',
        FFAppState().day7Select[0]);
    FFAppState().curentDay =
        1; // в глобальную перменную состояния пишем текуший выбраный день НЕДЕЛИ
    print("Цвет совпадает!");
  }

  if (selectedDay == 'day2') // если кликнули на ПОНЕДЕЛЬНИК
  {
    FFAppState().day1Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day1Select[1] = const Color(0xFF838A9D);
    FFAppState().day2Select[0] = const Color(0xFF838A9D);
    FFAppState().day2Select[1] = const Color(0xFFFFFFFF);
    FFAppState().day3Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day3Select[1] = const Color(0xFF838A9D);
    FFAppState().day4Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day4Select[1] = const Color(0xFF838A9D);
    FFAppState().day5Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day5Select[1] = const Color(0xFF838A9D);
    FFAppState().day6Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day6Select[1] = const Color(0xFF838A9D);
    FFAppState().day7Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day7Select[1] = const Color(0xFF838A9D);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day1Select',
        FFAppState().day1Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day2Select',
        FFAppState().day2Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day3Select',
        FFAppState().day3Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day4Select',
        FFAppState().day4Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day5Select',
        FFAppState().day5Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day6Select',
        FFAppState().day6Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day7Select',
        FFAppState().day7Select[0]);
    FFAppState().curentDay =
        2; // в глобальную перменную состояния пишем текуший выбраный день НЕДЕЛИ
    print("Цвет совпадает!");
  }

  if (selectedDay == 'day3') // если кликнули на ПОНЕДЕЛЬНИК
  {
    FFAppState().day1Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day1Select[1] = const Color(0xFF838A9D);
    FFAppState().day2Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day2Select[1] = const Color(0xFF838A9D);
    FFAppState().day3Select[0] = const Color(0xFF838A9D);
    FFAppState().day3Select[1] = const Color(0xFFFFFFFF);
    FFAppState().day4Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day4Select[1] = const Color(0xFF838A9D);
    FFAppState().day5Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day5Select[1] = const Color(0xFF838A9D);
    FFAppState().day6Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day6Select[1] = const Color(0xFF838A9D);
    FFAppState().day7Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day7Select[1] = const Color(0xFF838A9D);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day1Select',
        FFAppState().day1Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day2Select',
        FFAppState().day2Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day3Select',
        FFAppState().day3Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day4Select',
        FFAppState().day4Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day5Select',
        FFAppState().day5Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day6Select',
        FFAppState().day6Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day7Select',
        FFAppState().day7Select[0]);
    FFAppState().curentDay =
        3; // в глобальную перменную состояния пишем текуший выбраный день НЕДЕЛИ
    print("Цвет совпадает!");
  }

  if (selectedDay == 'day4') // если кликнули на ПОНЕДЕЛЬНИК
  {
    FFAppState().day1Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day1Select[1] = const Color(0xFF838A9D);
    FFAppState().day2Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day2Select[1] = const Color(0xFF838A9D);
    FFAppState().day3Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day3Select[1] = const Color(0xFF838A9D);
    FFAppState().day4Select[0] = const Color(0xFF838A9D);
    FFAppState().day4Select[1] = const Color(0xFFFFFFFF);
    FFAppState().day5Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day5Select[1] = const Color(0xFF838A9D);
    FFAppState().day6Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day6Select[1] = const Color(0xFF838A9D);
    FFAppState().day7Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day7Select[1] = const Color(0xFF838A9D);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day1Select',
        FFAppState().day1Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day2Select',
        FFAppState().day2Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day3Select',
        FFAppState().day3Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day4Select',
        FFAppState().day4Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day5Select',
        FFAppState().day5Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day6Select',
        FFAppState().day6Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day7Select',
        FFAppState().day7Select[0]);
    FFAppState().curentDay =
        4; // в глобальную перменную состояния пишем текуший выбраный день НЕДЕЛИ
    print("Цвет совпадает!");
  }

  if (selectedDay == 'day5') // если кликнули на ПОНЕДЕЛЬНИК
  {
    FFAppState().day1Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day1Select[1] = const Color(0xFF838A9D);
    FFAppState().day2Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day2Select[1] = const Color(0xFF838A9D);
    FFAppState().day3Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day3Select[1] = const Color(0xFF838A9D);
    FFAppState().day4Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day4Select[1] = const Color(0xFF838A9D);
    FFAppState().day5Select[0] = const Color(0xFF838A9D);
    FFAppState().day5Select[1] = const Color(0xFFFFFFFF);
    FFAppState().day6Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day6Select[1] = const Color(0xFF838A9D);
    FFAppState().day7Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day7Select[1] = const Color(0xFF838A9D);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day1Select',
        FFAppState().day1Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day2Select',
        FFAppState().day2Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day3Select',
        FFAppState().day3Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day4Select',
        FFAppState().day4Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day5Select',
        FFAppState().day5Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day6Select',
        FFAppState().day6Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day7Select',
        FFAppState().day7Select[0]);
    FFAppState().curentDay =
        5; // в глобальную перменную состояния пишем текуший выбраный день НЕДЕЛИ
    print("Цвет совпадает!");
  }

  if (selectedDay == 'day6') // если кликнули на ПОНЕДЕЛЬНИК
  {
    FFAppState().day1Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day1Select[1] = const Color(0xFF838A9D);
    FFAppState().day2Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day2Select[1] = const Color(0xFF838A9D);
    FFAppState().day3Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day3Select[1] = const Color(0xFF838A9D);
    FFAppState().day4Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day4Select[1] = const Color(0xFF838A9D);
    FFAppState().day5Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day5Select[1] = const Color(0xFF838A9D);
    FFAppState().day6Select[0] = const Color(0xFF838A9D);
    FFAppState().day6Select[1] = const Color(0xFFFFFFFF);
    FFAppState().day7Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day7Select[1] = const Color(0xFF838A9D);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day1Select',
        FFAppState().day1Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day2Select',
        FFAppState().day2Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day3Select',
        FFAppState().day3Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day4Select',
        FFAppState().day4Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day5Select',
        FFAppState().day5Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day6Select',
        FFAppState().day6Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day7Select',
        FFAppState().day7Select[0]);
    FFAppState().curentDay =
        6; // в глобальную перменную состояния пишем текуший выбраный день НЕДЕЛИ
    print("Цвет совпадает!");
  }

  if (selectedDay == 'day7') // если кликнули на ПОНЕДЕЛЬНИК
  {
    FFAppState().day1Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day1Select[1] = const Color(0xFF838A9D);
    FFAppState().day2Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day2Select[1] = const Color(0xFF838A9D);
    FFAppState().day3Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day3Select[1] = const Color(0xFF838A9D);
    FFAppState().day4Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day4Select[1] = const Color(0xFF838A9D);
    FFAppState().day5Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day5Select[1] = const Color(0xFF838A9D);
    FFAppState().day6Select[0] = const Color(0xFFFFFFFF);
    FFAppState().day6Select[1] = const Color(0xFF838A9D);
    FFAppState().day7Select[0] = const Color(0xFF838A9D);
    FFAppState().day7Select[1] = const Color(0xFFFFFFFF);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day1Select',
        FFAppState().day1Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day2Select',
        FFAppState().day2Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day3Select',
        FFAppState().day3Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day4Select',
        FFAppState().day4Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day5Select',
        FFAppState().day5Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day6Select',
        FFAppState().day6Select[0]);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'day7Select',
        FFAppState().day7Select[0]);
    FFAppState().curentDay =
        7; // в глобальную перменную состояния пишем текуший выбраный день НЕДЕЛИ
    print("Цвет совпадает!");
  }

  print("СОХРАНЕНО!");
}
