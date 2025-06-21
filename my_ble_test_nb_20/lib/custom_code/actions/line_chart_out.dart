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

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import 'my_chart1action.dart';
import 'start_global_timer.dart';

Future lineChartOut(
  int? input,
  String? mode,
) async {
  // Add your function code here!

// 1 . выситчываем  текущий Xmin и Xmax  и копруем в  глобальный буфер XMIN_onTAP и XMAX_onTAP
// 2.  при нажатии при переходе в режим "детально"  обновляем текущеие пеменные   minX  и maxX и
// выставляем влаг обновления ПЗУ  isNewData = true; после чег отображаетс начало интервала с этого для в детальном режиме

  if (mode == 'onTap') {
    FFAppState().LineChartOnTap = true; // включаем флаг обновления старницы
    //FFAppState().LineChartOut = formatUnixToDate(input!);

    FFAppState().LineChartUnixTimePoint = input!;
    FFAppState().LineChartOut = FFAppState().LineChartUnixTimePoint.toString();
    FFAppState().LineChartOut = formatUnixToDate(input!);

    print(
        'LineChartUnixTimePoint: ${FFAppState().LineChartUnixTimePoint}'); // контрольный вывод даты
    print(
        'formatUnixToDate: ${formatUnixToDate(FFAppState().LineChartUnixTimePoint)}'); // контрольный вывод даты

    FFAppState().update(() {}); // обновляем AppState

    if (FFAppState().LineChartZoom == true) {
      int idx = findIndexByUnixTime(FFAppState().LineCharData1, input!);

//делаем проверку последнего дня.

// если осатлся самый крайний день, то переходим прросто на   начало суток последнего дня
// определяем разницу между FFAppState().LineCharData1.length и idx

      int dataLength = FFAppState().LineCharData1.length;
      int diff = dataLength -
          1440; //  сли разница (диапазон)  больше чем все + 1440 (+последний день) то можно
      // иначае это последний день

      if (idx < diff) {
        minX_onTAP = idx.toDouble();
        maxX_onTAP = minX_onTAP + 1439;
        minX = minX_onTAP; // обновили  глобальные minX
        maxX = maxX_onTAP; // обновили  глобальные maxX

        // Сохранение диапазона
        isNewData = true;
      } else {
        minX_onTAP = diff.toDouble(); // начало последнего дня
        maxX_onTAP = minX_onTAP + 1439; // конец последнего дня
        minX = minX_onTAP; // обновили  глобальные minX
        maxX = maxX_onTAP; // обновили  глобальные maxX
        isNewData = true;
      }

      print(minX_onTAP);
      print(maxX_onTAP);
    }
  }

  if (FFAppState().panoramaMode == false) {
    if (mode == 'startXmin') {
      // FFAppState().LineChartOnTap = true; // включаем флаг обновления старницы
      //FFAppState().LineChartUnixTimePoint =
      //    input!; // принудительный переход на нулевую точку

      //  FFAppState().LineChartOut =
      //    FFAppState().LineChartUnixTimePoint.toString();
      FFAppState().LineChartOut = formatUnixToDate(input!);

      FFAppState().update(() {}); // обновляем AppState
    }
  }
}
