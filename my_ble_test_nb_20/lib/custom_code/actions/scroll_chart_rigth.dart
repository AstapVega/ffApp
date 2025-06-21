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

import 'my_chart1action.dart';
import 'start_global_timer.dart';

Future scrollChartRigth(String? step) async {
  // Add your function code here!
  int xMinGlobal = 0;
  int xMaxGlobal = 0;
  int xMinLocal = 0;
  int xMaxLocal = 0;
  int newXMin = 0;
  int newXMax = 0;
  int stepStr = 60; // шаг по умолчанию (в минутах)

  // Шаг сдвига (из параметра или из глобальной stepStr)
  stepStr = int.tryParse(step ?? '') ?? stepStr;

  // Получаем длину данных
  int dataLength = FFAppState().dataChartLength;

  xMinGlobal = 0;
  xMaxGlobal = dataLength - 1;

  // Текущие локальные границы (если не заданы, ставим окно последних суток)

  if (minX != null) {
    xMinLocal = minX.toInt();
  } else {
    xMinLocal = xMaxGlobal - 1440;
  }

  if (maxX != null) {
    xMaxLocal = maxX.toInt();
  } else {
    xMaxLocal = xMaxGlobal;
  }

  // Сдвиг вправо
  newXMin = xMinLocal + stepStr;
  newXMax = xMaxLocal + stepStr;

  // Проверка: не выйти за правый край
  if (newXMax > xMaxGlobal) {
    newXMax = xMaxGlobal;
    newXMin = newXMax - (xMaxLocal - xMinLocal);
  }

  // Проверка: не выйти за левый край (подстраховка)
  if (newXMin < xMinGlobal) {
    newXMin = xMinGlobal;
    newXMax = newXMin + (xMaxLocal - xMinLocal);
  }

  // Запись в AppState (как double)
  FFAppState().LineCharMinX = newXMin.toDouble();
  FFAppState().LineCharMaxX = newXMax.toDouble();

  FFAppState().LineChartOut = formatUnixToDate(FFAppState()
      .LineCharData1[newXMin.toInt()]
      .time); // при нажатии кнопки "вправо" выводим дату

  FFAppState().LineChartOnTap = true; // включаем флаг обновить надпись

  minX = newXMin.toDouble();
  maxX = newXMax.toDouble();

  // Сохранение диапазона
  isNewData = true;
  if (stepStr > 100) // если шаг больше 100 минут
  {
    FFAppState().tooltipLineChartX = minX.toDouble();
    FFAppState().LineChartOnTap = true; // включаем флаг обновления старницы
    FFAppState().LineChartUnixTimePoint =
        findUnixTimeByIndex(FFAppState().LineCharData1, minX.toInt());
  }

  print('✅ Сдвиг вправо: $newXMin → $newXMax');
}
