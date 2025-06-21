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

import 'ble_custom_action.dart';

import 'dart:math';

// глубока копия  влоежніх списков!!
/*
List<List<int>> original = [
  [1, 2, 3],
  [4, 5, 6]
];

List<List<int>> deepCopy = []; // 1. Создаем пустой список
deepCopy = original.map((sublist) => sublist.toList()).toList(); // 2. Копируем данные (делаем независимую копию)

if (CopyDayListBufer
          .isNotEmpty) // если буфер уже запонен полезынми зачениями всех дней то возращаем его в  FFAppState().copyDayList
      {
        FFAppState().copyDayList = CopyDayListBufer.toList();
        ; // возращаем обратно
      }

//внимание!  если сделаем  CopyDayListBufer = FFAppState().copyDayList - то єто копирует ссілку на обьект а не сами данніе актуальные
      // CopyDayListBufer = FFAppState()
      //     .copyDayList
      //    .toList(); // копируем весь первоначальный спсиок по умолчаниюв Буфер глобальный

*/

List<String> CopyDayListBufer =
    []; // тестовый БУфер - не сипользуем дальше- как тестовый код иизучение механизма копирвоания списков

Future selectCopyDayList(int? copyDayIndex) async {
  // Add your function code here!

  int DayIndex = 0;
  String BUFER = '';

  if (copyDayIndex != null && copyDayIndex <= 6) {
    // Код, если copyDayIndex не null и меньше/равен 6

    if (FFAppState().copyDayListMode == true) {
      DayIndex = copyDayIndex ?? DayIndex;
      BUFER = FFAppState().copyDayList[DayIndex];
      FFAppState().copyDayList.clear();
      FFAppState().copyDayList.add(BUFER);

      // FFAppState().copyDayOK =
      //   true; // Активируем Надпись " СКОПИРОВАНО НА ххх день"

      FFAppState().copyDayValue =
          ' “ ' + BUFER + ' ”  '; // обновляем глобальный буфер

      print(" copyDayOK ");
    } else {
      // при первом нажатии выпадает заполненый  СПИСОК!!
      FFAppState().copyDayList.clear();
      print(" TEST END ");
      BUFER = FFAppConstants.copyDayList[0]; //Выбираем Понедельник
      FFAppState().copyDayList.add(BUFER);
      BUFER = FFAppConstants.copyDayList[1]; //Выбираем Понедельник
      FFAppState().copyDayList.add(BUFER);
      BUFER = FFAppConstants.copyDayList[2]; //Выбираем Понедельник
      FFAppState().copyDayList.add(BUFER);
      BUFER = FFAppConstants.copyDayList[3]; //Выбираем Понедельник
      FFAppState().copyDayList.add(BUFER);
      BUFER = FFAppConstants.copyDayList[4]; //Выбираем Понедельник
      FFAppState().copyDayList.add(BUFER);
      BUFER = FFAppConstants.copyDayList[5]; //Выбираем Понедельник
      FFAppState().copyDayList.add(BUFER);
      BUFER = FFAppConstants.copyDayList[6]; //Выбираем Понедельник
      FFAppState().copyDayList.add(BUFER);
    }

    //copyDayListMode = !copyDayListMode; // инверсия значения

    FFAppState().copyDayListMode = !FFAppState().copyDayListMode;

    print(" TEST END ");
  } else {
    // первый раз заходим в меню и попадаем на ПОНЕДЕЛЬНИК в ЛИСТ ВЬЮ

    FFAppState().copyDayListMode = false;
    FFAppState().copyDayOK = false; // ТУШИМ НАДПИСЬ " СКОПИРОВАНО НА ххх день"

    FFAppState().copyDayList.clear();
    print(" TEST END ");
    BUFER = FFAppConstants.copyDayList[0]; //Выбираем Понедельник
    FFAppState().copyDayList.add(BUFER);

    // проверяем какой в каком текущем дне  мы находимся

    int dayNameIndex = 0;

    dayNameIndex = FFAppState()
        .curentDay; // отнимаем 1 что бы попасть на нулевой указатель индекса дня в массиве  названии дей недели
    dayNameIndex = --dayNameIndex;

    BUFER = FFAppConstants.copyDayList[dayNameIndex]; //Выбираем Понедельник
    FFAppState().selectedDayName =
        'Копировать  “ ' + BUFER + ' ”  '; // обновляем глобальный буфер
    print(" TEST END ");

    print(" TEST END ");
  }
}
