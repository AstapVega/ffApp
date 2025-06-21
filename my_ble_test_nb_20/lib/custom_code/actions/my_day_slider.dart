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

import 'my_chart1action.dart';
import 'start_global_timer.dart';

Future myDaySlider(double? inputData) async {
  // Add your function code here!
  print(inputData);
  print(formatUnixToDate(inputData!.toInt()));

  FFAppState().LineChartOnTap = true; // включаем флаг обновления старницы
  //FFAppState().LineChartOut = formatUnixToDate(input!);

  FFAppState().LineChartUnixTimePoint = inputData.toInt();
  FFAppState().LineChartOut = FFAppState().LineChartUnixTimePoint.toString();
  FFAppState().LineChartOut = formatUnixToDate(inputData.toInt());

  print(
      'LineChartUnixTimePoint: ${FFAppState().LineChartUnixTimePoint}'); // контрольный вывод даты
  print(
      'formatUnixToDate: ${formatUnixToDate(FFAppState().LineChartUnixTimePoint)}'); // контрольный вывод даты

  int unixBufer;

  unixBufer = inputData.toInt();

  int idx = findIndexByUnixTime(FFAppState().LineCharData1, unixBufer);

//  int idx = findIndexByUnixTime(FFAppState().LineCharData1, inputData.toInt());

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

    FFAppState().LineCharMinX = minX;
    FFAppState().LineCharMaxX = maxX;

    FFAppState().update(() {}); // обновляем AppState
  } else {
    // minX_onTAP = idx.toDouble();

    minX_onTAP = diff.toDouble(); // начало последнего дня
    maxX_onTAP = minX_onTAP + 1439; // конец последнего дня
    minX = minX_onTAP; // обновили  глобальные minX
    maxX = maxX_onTAP; // обновили  глобальные maxX
    isNewData = true;
    FFAppState().LineCharMinX = minX;
    FFAppState().LineCharMaxX = maxX;
  }

  FFAppState().update(() {}); // обновляем AppState
}
