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

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'dart:async';
import 'dart:io' show Platform;

int lastIndex2 = 0;

Future updateDayInterval(String? mode) async {
  // Add your function code here!

  int lastIndex = 0;
  var readbufer;

  int curentDay = 0;
  curentDay = FFAppState().curentDay;
  if (curentDay > 0) {
    curentDay = FFAppState().curentDay;
    curentDay = curentDay - 1;
  }

// 1.
  if (mode == 'addNewInterval') // добавть новый интервал в ЛИСТ ВЬЮ
  {
// 1. вычитываем актуальную длинную списка

    lastIndex = ShedullegetIntervalsCount(
        FFAppState().selectedDeviceId, "days[$curentDay].dayIntervalsCustom[]");

    if (lastIndex >= 0) {
      int bufindex;
      bufindex = lastIndex + 1;
/*
// 3D  одиночно обновление с контрольным вычитыванием + опять обновление результатом считывания
      updateDeviceShedulleField(
          FFAppState().selectedDeviceId,
          "days[$curentDay]dayIntervalsCustom[$lastIndex].icon",
          bufindex.toString());
          readbufer = readDeviceShedulleField(FFAppState().selectedDeviceId,
             "days[$curentDay]dayIntervalsCustom[$lastIndex].icon");
     //    updateDeviceShedulleField(FFAppState().selectedDeviceId,
        //    "days[$curentDay]dayIntervalsCustom[$lastIndex].icon", readbufer);
//-----------------------------------------------------------------------
      updateDeviceShedulleField(
          FFAppState().selectedDeviceId,
          "days[$curentDay]dayIntervalsCustom[$lastIndex].temperatureHigtByte",
          '26'); //для понедльника нулевой интервал
         readbufer = readDeviceShedulleField(FFAppState().selectedDeviceId,
            "days[$curentDay]dayIntervalsCustom[$lastIndex].temperatureHigtByte");
      //  updateDeviceShedulleField(
       //     FFAppState().selectedDeviceId,
       //    "days[$curentDay]dayIntervalsCustom[$lastIndex].temperatureHigtByte",
        //   readbufer); //для понедльника нулевой интервал

//-----------------------------------------------------------------------
      updateDeviceShedulleField(
          FFAppState().selectedDeviceId,
          "days[$curentDay]dayIntervalsCustom[$lastIndex].temperatureLowByte",
          '5'); //для понедльника нулевой интервал
        readbufer = readDeviceShedulleField(FFAppState().selectedDeviceId,
            "days[$curentDay]dayIntervalsCustom[$lastIndex].temperatureLowByte");
      //  updateDeviceShedulleField(
      //      FFAppState().selectedDeviceId,
       //    "days[$curentDay]dayIntervalsCustom[$lastIndex].temperatureLowByte",
       //   readbufer); //для понедльника нулевой интервал
//-----------------------------------------------------------------------
      updateDeviceShedulleField(
          FFAppState().selectedDeviceId,
          "days[$curentDay]dayIntervalsCustom[$lastIndex].timeHour",
          '07'); //для понедльника нулевой интервал
       readbufer = readDeviceShedulleField(FFAppState().selectedDeviceId,
           "days[$curentDay]dayIntervalsCustom[$lastIndex].timeHour");
     //  updateDeviceShedulleField(
      //     FFAppState().selectedDeviceId,
      //    "days[$curentDay]dayIntervalsCustom[$lastIndex].timeHour",
      //    readbufer); //для понедльника нулевой интервал
//-----------------------------------------------------------------------
      updateDeviceShedulleField(
          FFAppState().selectedDeviceId,
          "days[$curentDay]dayIntervalsCustom[$lastIndex].timeMinut",
          '00'); //для понедльника нулевой интервал
        readbufer = readDeviceShedulleField(FFAppState().selectedDeviceId,
            "days[$curentDay]dayIntervalsCustom[$lastIndex].timeMinut");
     //  updateDeviceShedulleField(
      //    FFAppState().selectedDeviceId,
      //    "days[$curentDay]dayIntervalsCustom[$lastIndex].timeMinut",
       //  readbufer); //для понедльника нулевой интервал

      print(" DaysSheduller END ");


*/

// груповое измение  - оптимально для отладки с отдельным вызовм batchUpdateShedulle(FFAppState().selectedDeviceId, updates); и созданием
// помежуточного буфера Map<String, dynamic> updates
//Фигурные скобки {} — создают Map, а не List. Это ключ-значение, типа JSON.
//Квадратные [] — создают List, просто массив без ключей.

      Map<String, dynamic> updates = {};

      // 🔹 **Интервал 0**
      updates["days[$curentDay].dayIntervalsCustom[$lastIndex].icon"] =
          bufindex.toString();
      updates["days[$curentDay].dayIntervalsCustom[$lastIndex].temperatureHigtByte"] =
          '26';
      updates["days[$curentDay].dayIntervalsCustom[$lastIndex].temperatureLowByte"] =
          '5';
      updates["days[$curentDay].dayIntervalsCustom[$lastIndex].timeHour"] =
          '07';
      updates["days[$curentDay].dayIntervalsCustom[$lastIndex].timeMinut"] =
          '00';

      // ✅ **Обновляем за ОДИН ВЫЗОВ**
      batchUpdateShedulle(FFAppState().selectedDeviceId, updates);

// еще так можно

/*
Map<String, dynamic> updates = {
  "days[$curentDay].dayIntervalsCustom[$lastIndex].icon": bufindex.toString(),
  "days[$curentDay].dayIntervalsCustom[$lastIndex].temperatureHigtByte": '26',
  "days[$curentDay].dayIntervalsCustom[$lastIndex].temperatureLowByte": '5',
  "days[$curentDay].dayIntervalsCustom[$lastIndex].timeHour": '07',
  "days[$curentDay].dayIntervalsCustom[$lastIndex].timeMinut": '00',
};

batchUpdateShedulle(FFAppState().selectedDeviceId, updates);
*/

// Еще так можно

/*
batchUpdateShedulle(FFAppState().selectedDeviceId, {
  "days[$curentDay].dayIntervalsCustom[$lastIndex].icon": bufindex.toString(),
  "days[$curentDay].dayIntervalsCustom[$lastIndex].temperatureHigtByte": '26',
  "days[$curentDay].dayIntervalsCustom[$lastIndex].temperatureLowByte": '5',
  "days[$curentDay].dayIntervalsCustom[$lastIndex].timeHour": '07',
  "days[$curentDay].dayIntervalsCustom[$lastIndex].timeMinut": '00',
});


*/

      print(" DaysSheduller END ");
    }
  }

// 2.
  if (mode == 'deleteInterval') // удаление текущего интврал из спика ЛИСТ ВЬЮ
  {
// Вычитываем текущий индекс Дневного интервала в списке ИНТЕРВАЛОВ.   В нашем случае индекс в ЛИСТ ВЬЮ совпадаетс ИСТОЧНИКОМ в FildFromListOfMyDevice1Field
// в момент нажатия на кнопку удалить считываем текущий индекс РЕБЕНКА в ЛИСТ втью расписания , и передаем его через appState
    int CurentIndex = 0;
    CurentIndex = FFAppState().DayIntervalIndex;
// удаляем интервал
    // delitListFildFromListOfMyDevice1Field(
    //     FFAppState().selectedDeviceId, "dayIntervals[$CurentIndex]");
    clearAllIntervals();
    print(" DaysSheduller END ");
  }

// 3.
  if (mode == 'deleteFromEnd') // удалить ИНТЕРВАЛ С КОНЦА ( с хвоста ЛИСТ ВЬЮ)
  {
    int lastIndex = 0;
// 1. вычитываем актуальную длинную списка и отнимает 1
// 2. удаляем интервал

//-----------------------------------------------------------------------
    print(" DaysSheduller END ");
    lastIndex = ShedullegetIntervalsCount(
        FFAppState().selectedDeviceId, "days[$curentDay].dayIntervalsCustom[]");
    lastIndex = lastIndex - 1; // Поправка на "1"
    deleteIntervalFromDeviceShedulle(FFAppState().selectedDeviceId,
        "days[$curentDay].dayIntervalsCustom[$lastIndex]");

    print(" DaysSheduller END ");
  }

// 4.
  if (mode == 'updateInterval') {
    // 🔹 Вложенный список (обновляем температуру в 0-м интервале)
  }

//
  if (mode ==
      'LoadStandartShedulle') // загружаем  стандартное расписание из 6 ти интервалов
  {
    resetStandartDayIntervals(FFAppState().selectedDeviceId);
  }

  if (mode ==
      'ClearStandartShedulle') // очистка всех полей стандартного расписания
  {
    FFAppState().myDeviceShedulle.forEach((astapdevice) {
      if (astapdevice.id == FFAppState().selectedDeviceId) {
        astapdevice.day1IntervalsStandart.clear();
      }
    });
  }

// ------------------------- ОБНОВЛЕНИЕ UI LIST VIU в зависимомти от режима  СТАНДАРТНОЕ / КАСТОМНОЕ распсиание

  if (mode == 'updateDayIntervalsUI') //  ОБНОВЛЕНИЕ UI кастомного расписания
  {
    myallloadMyDeviceScheduleToRAM(
        FFAppState().selectedDeviceId, //  новый массив
        "days[$curentDay].dayIntervalsCustom[]");

//----------------------------------------------------------------------

    print(" ОБНОВЛЕНИЕ UI LIST VIU ");
  }

  if (mode ==
      'updateStandartDayIntervalsUI') //  ОБНОВЛЕНИЕ UI  СТАНДАРТНОГО расписания
  {
    myallloadMyDeviceScheduleToRAM(
        FFAppState().selectedDeviceId, //  новый массив
        "days[$curentDay].dayIntervalsStandart[]");
  }

  if (mode == 'inicialCustomShedulle') {
    lastIndex = 0;

    for (int day = 0; day < 7; day++) {
      Map<String, dynamic> updates = {
        "days[$day].dayIntervalsCustom[$lastIndex].icon": '1',
        "days[$day].dayIntervalsCustom[$lastIndex].temperatureHigtByte": '26',
        "days[$day].dayIntervalsCustom[$lastIndex].temperatureLowByte": '5',
        "days[$day].dayIntervalsCustom[$lastIndex].timeHour": '07',
        "days[$day].dayIntervalsCustom[$lastIndex].timeMinut": '00',
      };

      batchUpdateShedulle(FFAppState().selectedDeviceId, updates);
    }

    print("DaysSheduller END");
  }

  if (mode == 'inicialStandartShedulle') {
    for (int day = 0; day < 7; day++) {
      Map<String, dynamic> updates = {};
      lastIndex = 0;

      // 🔹 **Интервал 0**
      updates["days[$day].dayIntervalsStandart[$lastIndex].icon"] =
          'assets/images/period$lastIndex.svg';
      updates["days[$day].dayIntervalsStandart[$lastIndex].temperatureHigtByte"] =
          '26';
      updates["days[$day].dayIntervalsStandart[$lastIndex].temperatureLowByte"] =
          '5';
      updates["days[$day].dayIntervalsStandart[$lastIndex].timeHour"] = '07';
      updates["days[$day].dayIntervalsStandart[$lastIndex].timeMinut"] = '00';

      // 🔹 **Интервал 1**
      lastIndex++;
      updates["days[$day].dayIntervalsStandart[$lastIndex].icon"] =
          'assets/images/period$lastIndex.svg';
      updates["days[$day].dayIntervalsStandart[$lastIndex].temperatureHigtByte"] =
          '26';
      updates["days[$day].dayIntervalsStandart[$lastIndex].temperatureLowByte"] =
          '5';
      updates["days[$day].dayIntervalsStandart[$lastIndex].timeHour"] = '07';
      updates["days[$day].dayIntervalsStandart[$lastIndex].timeMinut"] = '00';

      // 🔹 **Интервал 2**
      lastIndex++;
      updates["days[$day].dayIntervalsStandart[$lastIndex].icon"] =
          'assets/images/period$lastIndex.svg';
      updates["days[$day].dayIntervalsStandart[$lastIndex].temperatureHigtByte"] =
          '26';
      updates["days[$day].dayIntervalsStandart[$lastIndex].temperatureLowByte"] =
          '5';
      updates["days[$day].dayIntervalsStandart[$lastIndex].timeHour"] = '07';
      updates["days[$day].dayIntervalsStandart[$lastIndex].timeMinut"] = '00';

      // 🔹 **Интервал 3**
      lastIndex++;
      updates["days[$day].dayIntervalsStandart[$lastIndex].icon"] =
          'assets/images/period$lastIndex.svg';
      updates["days[$day].dayIntervalsStandart[$lastIndex].temperatureHigtByte"] =
          '26';
      updates["days[$day].dayIntervalsStandart[$lastIndex].temperatureLowByte"] =
          '5';
      updates["days[$day].dayIntervalsStandart[$lastIndex].timeHour"] = '07';
      updates["days[$day].dayIntervalsStandart[$lastIndex].timeMinut"] = '00';

      // 🔹 **Интервал 4**
      lastIndex++;
      updates["days[$day].dayIntervalsStandart[$lastIndex].icon"] =
          'assets/images/period$lastIndex.svg';
      updates["days[$day].dayIntervalsStandart[$lastIndex].temperatureHigtByte"] =
          '26';
      updates["days[$day].dayIntervalsStandart[$lastIndex].temperatureLowByte"] =
          '5';
      updates["days[$day].dayIntervalsStandart[$lastIndex].timeHour"] = '07';
      updates["days[$day].dayIntervalsStandart[$lastIndex].timeMinut"] = '00';

      // 🔹 **Интервал 5**
      lastIndex++;
      updates["days[$day].dayIntervalsStandart[$lastIndex].icon"] =
          'assets/images/period$lastIndex.svg';
      updates["days[$day].dayIntervalsStandart[$lastIndex].temperatureHigtByte"] =
          '26';
      updates["days[$day].dayIntervalsStandart[$lastIndex].temperatureLowByte"] =
          '5';
      updates["days[$day].dayIntervalsStandart[$lastIndex].timeHour"] = '07';
      updates["days[$day].dayIntervalsStandart[$lastIndex].timeMinut"] = '00';

      // ✅ **Обновляем за ОДИН ВЫЗОВ**
      batchUpdateShedulle(FFAppState().selectedDeviceId, updates);
    }

    print("✅ DaysSheduller END — всё идёт по твоему шаблону!");
  }
}

void resetStandartDayIntervals(String deviceId) {
  FFAppState().myDeviceShedulle = FFAppState().myDeviceShedulle.map((device) {
    if (device.id == deviceId) {
      device.day1IntervalsStandart = [
        MyStandartIntervalsStruct(
            //   icon: '1',
            icon: 'assets/images/period0.svg',
            temperatureHigtByte: '26',
            temperatureLowByte: '5',
            timeHour: '07',
            timeMinut: '00'),
        MyStandartIntervalsStruct(
            //icon: '2',
            icon: 'assets/images/period1.svg',
            temperatureHigtByte: '24',
            temperatureLowByte: '4',
            timeHour: '09',
            timeMinut: '30'),
        MyStandartIntervalsStruct(
            //icon: '3',
            icon: 'assets/images/period2.svg',
            temperatureHigtByte: '22',
            temperatureLowByte: '3',
            timeHour: '12',
            timeMinut: '15'),
        MyStandartIntervalsStruct(
            //icon: '4',
            icon: 'assets/images/period3.svg',
            temperatureHigtByte: '20',
            temperatureLowByte: '2',
            timeHour: '15',
            timeMinut: '45'),
        MyStandartIntervalsStruct(
            //icon: '5',
            icon: 'assets/images/period4.svg',
            temperatureHigtByte: '18',
            temperatureLowByte: '1',
            timeHour: '18',
            timeMinut: '20'),
        MyStandartIntervalsStruct(
            //icon: '6',
            icon: 'assets/images/period5.svg',
            temperatureHigtByte: '16',
            temperatureLowByte: '0',
            timeHour: '22',
            timeMinut: '00'),
      ];
    }
    return device;
  }).toList();
}

// РАБОЧАЯ ОТЛАДКА  РЕЗЕРВНЫЙ КОД

/*

Future updateDayInterval(String? mode) async {
  // Add your function code here!

// 1.
  if (mode == 'addNewInterval') // добавть новый интервал в ЛИСТ ВЬЮ
  {
    int lastIndex = 0;
    var readbufer;

// 1. вычитываем актуальную длинную списка

    lastIndex = ShedullegetIntervalsCount(
        FFAppState().selectedDeviceId, "day1IntervalsCustom[]");

  //  lastIndex = ShedullegetIntervalsCount(
  //      FFAppState().selectedDeviceId, "days[0].dayIntervalsCustom[]");

    if (lastIndex >= 0) {
      // updateListOfMyDevice1Field(
      //    FFAppState().selectedDeviceId,
      //    "dayIntervals[$lastIndex].icon",
      //    'assets/fonts/period${lastIndex}.svg');
      int bufindex;
      bufindex = lastIndex + 1;


//обновление с контрольным вычитыванием + опять обновление результатом считывания
      updateDeviceShedulleField(FFAppState().selectedDeviceId,
          "day1IntervalsCustom[$lastIndex].icon", bufindex.toString());

      readbufer = readDeviceShedulleField(FFAppState().selectedDeviceId,
          "day1IntervalsCustom[$lastIndex].icon");
      updateDeviceShedulleField(FFAppState().selectedDeviceId,
          "day1IntervalsCustom[$lastIndex].icon", readbufer);
//-----------------------------------------------------------------------
      updateDeviceShedulleField(FFAppState().selectedDeviceId,
          "day1IntervalsCustom[$lastIndex].temperatureHigtByte", '26');
      readbufer = readDeviceShedulleField(FFAppState().selectedDeviceId,
          "day1IntervalsCustom[$lastIndex].temperatureHigtByte");
      updateDeviceShedulleField(FFAppState().selectedDeviceId,
          "day1IntervalsCustom[$lastIndex].temperatureHigtByte", readbufer);
//-----------------------------------------------------------------------
      updateDeviceShedulleField(FFAppState().selectedDeviceId,
          "day1IntervalsCustom[$lastIndex].temperatureLowByte", '5');
      readbufer = readDeviceShedulleField(FFAppState().selectedDeviceId,
          "day1IntervalsCustom[$lastIndex].temperatureLowByte");
      updateDeviceShedulleField(FFAppState().selectedDeviceId,
          "day1IntervalsCustom[$lastIndex].temperatureLowByte", readbufer);
//-----------------------------------------------------------------------
      updateDeviceShedulleField(FFAppState().selectedDeviceId,
          "day1IntervalsCustom[$lastIndex].timeHour", '07');
      readbufer = readDeviceShedulleField(FFAppState().selectedDeviceId,
          "day1IntervalsCustom[$lastIndex].timeHour");
      updateDeviceShedulleField(FFAppState().selectedDeviceId,
          "day1IntervalsCustom[$lastIndex].timeHour", readbufer);
//-----------------------------------------------------------------------
      updateDeviceShedulleField(FFAppState().selectedDeviceId,
          "day1IntervalsCustom[$lastIndex].timeMinut", '00');
      readbufer = readDeviceShedulleField(FFAppState().selectedDeviceId,
          "day1IntervalsCustom[$lastIndex].timeMinut");
      updateDeviceShedulleField(FFAppState().selectedDeviceId,
          "day1IntervalsCustom[$lastIndex].timeMinut", readbufer);
//-----------------------------------------------------------------------

// 3D   обновление с контрольным вычитыванием + опять обновление результатом считывания
      updateDeviceShedulleField(FFAppState().selectedDeviceId,
          "days[0]dayIntervalsCustom[$lastIndex].icon", bufindex.toString());
      readbufer = readDeviceShedulleField(FFAppState().selectedDeviceId,
          "days[0]dayIntervalsCustom[$lastIndex].icon");
      updateDeviceShedulleField(FFAppState().selectedDeviceId,
          "days[0]dayIntervalsCustom[$lastIndex].icon", readbufer);
//-----------------------------------------------------------------------
      updateDeviceShedulleField(
          FFAppState().selectedDeviceId,
          "days[0]dayIntervalsCustom[$lastIndex].temperatureHigtByte",
          '26'); //для понедльника нулевой интервал
      readbufer = readDeviceShedulleField(FFAppState().selectedDeviceId,
          "days[0]dayIntervalsCustom[$lastIndex].temperatureHigtByte");
      updateDeviceShedulleField(
          FFAppState().selectedDeviceId,
          "days[0]dayIntervalsCustom[$lastIndex].temperatureHigtByte",
          readbufer); //для понедльника нулевой интервал
//-----------------------------------------------------------------------
      updateDeviceShedulleField(
          FFAppState().selectedDeviceId,
          "days[0]dayIntervalsCustom[$lastIndex].temperatureLowByte",
          '5'); //для понедльника нулевой интервал
      readbufer = readDeviceShedulleField(FFAppState().selectedDeviceId,
          "days[0]dayIntervalsCustom[$lastIndex].temperatureLowByte");
      updateDeviceShedulleField(
          FFAppState().selectedDeviceId,
          "days[0]dayIntervalsCustom[$lastIndex].temperatureLowByte",
          readbufer); //для понедльника нулевой интервал
//-----------------------------------------------------------------------
      updateDeviceShedulleField(
          FFAppState().selectedDeviceId,
          "days[0]dayIntervalsCustom[$lastIndex].timeHour",
          '07'); //для понедльника нулевой интервал
      readbufer = readDeviceShedulleField(FFAppState().selectedDeviceId,
          "days[0]dayIntervalsCustom[$lastIndex].timeHour");
      updateDeviceShedulleField(
          FFAppState().selectedDeviceId,
          "days[0]dayIntervalsCustom[$lastIndex].timeHour",
          readbufer); //для понедльника нулевой интервал
//-----------------------------------------------------------------------
      updateDeviceShedulleField(
          FFAppState().selectedDeviceId,
          "days[0]dayIntervalsCustom[$lastIndex].timeMinut",
          '00'); //для понедльника нулевой интервал
      readbufer = readDeviceShedulleField(FFAppState().selectedDeviceId,
          "days[0]dayIntervalsCustom[$lastIndex].timeMinut");
      updateDeviceShedulleField(
          FFAppState().selectedDeviceId,
          "days[0]dayIntervalsCustom[$lastIndex].timeMinut",
          readbufer); //для понедльника нулевой интервал

        
         print(" DaysSheduller END ");


    }

    lastIndex = ShedullegetIntervalsCount(
        FFAppState().selectedDeviceId, "day2IntervalsCustom[]");

    if (lastIndex >= 0) {
      // updateListOfMyDevice1Field(
      //    FFAppState().selectedDeviceId,
      //    "dayIntervals[$lastIndex].icon",
      //    'assets/fonts/period${lastIndex}.svg');
      int bufindex;
      bufindex = lastIndex + 1;

      int temp2 = 0;
//-----------------------------------------------------------------------
      updateDeviceShedulleField(FFAppState().selectedDeviceId,
          "day2IntervalsCustom[$lastIndex].icon", bufindex.toString());

//-----------------------------------------------------------------------
      temp2 = bufindex;
      updateDeviceShedulleField(
          FFAppState().selectedDeviceId,
          "day2IntervalsCustom[$lastIndex].temperatureHigtByte",
          temp2.toString());

//-----------------------------------------------------------------------
      temp2 = temp2 + 1;
      updateDeviceShedulleField(
          FFAppState().selectedDeviceId,
          "day2IntervalsStandart[$lastIndex].temperatureHigtByte",
          temp2.toString());
//-----------------------------------------------------------------------
      updateDeviceShedulleField(FFAppState().selectedDeviceId,
          "day2IntervalsCustom[$lastIndex].temperatureLowByte", '5');
//-----------------------------------------------------------------------      
      updateDeviceShedulleField(FFAppState().selectedDeviceId,
          "day2IntervalsCustom[$lastIndex].timeHour", '07');
//-----------------------------------------------------------------------       
      updateDeviceShedulleField(FFAppState().selectedDeviceId,
          "day2IntervalsCustom[$lastIndex].timeMinut", '00');
//-----------------------------------------------------------------------



      print(" DaysSheduller END ");



    }
  }

// 2.
  if (mode == 'deleteInterval') // удаление текущего интврал из спика ЛИСТ ВЬЮ
  {
// Вычитываем текущий индекс Дневного интервала в списке ИНТЕРВАЛОВ.   В нашем случае индекс в ЛИСТ ВЬЮ совпадаетс ИСТОЧНИКОМ в FildFromListOfMyDevice1Field
// в момент нажатия на кнопку удалить считываем текущий индекс РЕБЕНКА в ЛИСТ втью расписания , и передаем его через appState
    int CurentIndex = 0;
    CurentIndex = FFAppState().DayIntervalIndex;
// удаляем интервал
    // delitListFildFromListOfMyDevice1Field(
    //     FFAppState().selectedDeviceId, "dayIntervals[$CurentIndex]");
    clearAllIntervals();
    print(" DaysSheduller END ");
  }

// 3.
  if (mode == 'deleteFromEnd') // удалить ИНТЕРВАЛ С КОНЦА ( с хвоста ЛИСТ ВЬЮ)
  {
    int lastIndex = 0;
// 1. вычитываем актуальную длинную списка и отнимает 1
// 2. удаляем интервал

//     delitListFildFromListOfMyDevice1Field(
//        FFAppState().selectedDeviceId, "dayIntervals[$lastIndex]");


//-----------------------------------------------------------------------
    print(" DaysSheduller END ");
    lastIndex = ShedullegetIntervalsCount(
        FFAppState().selectedDeviceId, "day1IntervalsCustom");
    lastIndex = lastIndex - 1; // Поправка на "1" !!!!!!
      deleteIntervalFromDeviceShedulle(
          FFAppState().selectedDeviceId, "day1IntervalsCustom[$lastIndex]");

//-----------------------------------------------------------------------
    print(" DaysSheduller END ");
    lastIndex = ShedullegetIntervalsCount(
        FFAppState().selectedDeviceId, "day2IntervalsCustom");
    lastIndex = lastIndex - 1; // Поправка на "1
    deleteIntervalFromDeviceShedulle(
        FFAppState().selectedDeviceId, "day2IntervalsCustom[$lastIndex]");


//-----------------------------------------------------------------------
  print(" DaysSheduller END ");
    lastIndex = ShedullegetIntervalsCount(
        FFAppState().selectedDeviceId, "days[0].dayIntervalsCustom[]");
    lastIndex = lastIndex - 1; // Поправка на "1"
    deleteIntervalFromDeviceShedulle(FFAppState().selectedDeviceId,
        "days[0].dayIntervalsCustom[$lastIndex]");





     print(" DaysSheduller END ");
  }

// 4.
  if (mode == 'updateInterval') {
    // 🔹 Вложенный список (обновляем температуру в 0-м интервале)
  }

//
  if (mode ==
      'LoadStandartShedulle') // загружаем  стандартное расписание из 6 ти интервалов
  {
    resetStandartDayIntervals(FFAppState().selectedDeviceId);
  }

  if (mode ==
      'ClearStandartShedulle') // очистка всех полей стандартного расписания
  {
    /*
    FFAppState().ListOfMyDevice1.forEach((astapdevice) {
      if (astapdevice.id == FFAppState().selectedDeviceId) {
         astapdevice.standartDayIntervals.clear();
      }
    });
*/

    FFAppState().myDeviceShedulle.forEach((astapdevice) {
      if (astapdevice.id == FFAppState().selectedDeviceId) {
        astapdevice.day1IntervalsStandart.clear();
      }
    });
  }

// ------------------------- ОБНОВЛЕНИЕ UI LIST VIU в зависимомти от режима  СТАНДАРТНОЕ / КАСТОМНОЕ распсиание

  if (mode == 'updateDayIntervalsUI') //  ОБНОВЛЕНИЕ UI кастомного расписания
  {

//----------------------------------------------------------------------
     allloadMyDeviceScheduleToRAM(
        FFAppState().selectedDeviceId, "day1IntervalsCustom[]"); // новый массив
//----------------------------------------------------------------------
     allloadMyDeviceScheduleToRAM(
        FFAppState().selectedDeviceId, "day2IntervalsCustom[]"); // новый массив
//----------------------------------------------------------------------
     myallloadMyDeviceScheduleToRAM(
       FFAppState().selectedDeviceId, "days[0].dayIntervalsCustom[]"); // новый массив




    print(" ОБНОВЛЕНИЕ UI LIST VIU ");
  }

  if (mode ==
      'updateStandartDayIntervalsUI') //  ОБНОВЛЕНИЕ UI  СТАНДАРТНОГО расписания
  {
    allloadMyDeviceScheduleToRAM(
        FFAppState().selectedDeviceId, "day1IntervalsStandart"); // новый массив
    //  allloadMyDeviceScheduleToRAM(
    //     FFAppState().selectedDeviceId, "day2IntervalsStandart"); // новый массив
  }

//---------------------------------------- ОТЛАДКА -----------------------------------------




}



*/
