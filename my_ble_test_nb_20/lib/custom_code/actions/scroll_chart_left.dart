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

Future scrollChartLeft(String? step) async {
  // Сдвигает окно графика влево на указанный шаг (в минутах).
  // Если в AppState нет сохранённых границ, берём последние 1440 точек.

  int xMinGlobal = 0;
  int xMaxGlobal = 0;
  int xMinLocal = 0;
  int xMaxLocal = 0;
  int newXMin = 0;
  int newXMax = 0;
  int stepStr = 60; // шаг по умолчанию (в минутах)

  // Определяем шаг сдвига: параметр функции имеет приоритет
  stepStr = int.tryParse(step ?? '') ?? stepStr;

  // Получаем длину данных
  int dataLength = FFAppState().dataChartLength;

  // Глобальные границы данных
  xMinGlobal = 0;
  xMaxGlobal = dataLength - 1;

  // Текущие локальные границы (если не заданы, ставим окно последних суток)

  if (minX != null) {
    xMinLocal = minX.toInt();
  } else {
    xMinLocal = (xMaxGlobal - 1440).clamp(xMinGlobal, xMaxGlobal);
  }

  if (maxX != null) {
    xMaxLocal = maxX.toInt();
  } else {
    xMaxLocal = xMaxGlobal;
  }

  // Сдвиг влево
  newXMin = xMinLocal - stepStr;
  newXMax = xMaxLocal - stepStr;

  // Не выходим за левый край
  if (newXMin < xMinGlobal) {
    newXMin = xMinGlobal;
    newXMax = newXMin + (xMaxLocal - xMinLocal);
  }

  // Подстраховка: не выходим за правый край
  if (newXMax > xMaxGlobal) {
    newXMax = xMaxGlobal;
    newXMin = newXMax - (xMaxLocal - xMinLocal);
  }

  // Сохранение в AppState (как double, чтобы FlutterFlow не ругался на типы)
  FFAppState().LineCharMinX = newXMin.toDouble();
  FFAppState().LineCharMaxX = newXMax.toDouble();

  FFAppState().LineChartOut = formatUnixToDate(FFAppState()
      .LineCharData1[newXMin.toInt()]
      .time); // при нажатии кнопки "влево" выводим дату

  FFAppState().LineChartOnTap = true; // включаем флаг обновить надпись

  minX = newXMin.toDouble();
  maxX = newXMax.toDouble();

  // Сохранение диапазона
  isNewData = true;

  print('✅ Сдвиг влево: \$newXMin → \$newXMax');

  if (stepStr > 100) // если шаг больше 100 минут
  {
    FFAppState().tooltipLineChartX = minX.toDouble();
    FFAppState().LineChartOnTap = true; // включаем флаг обновления старницы
    FFAppState().LineChartUnixTimePoint =
        findUnixTimeByIndex(FFAppState().LineCharData1, minX.toInt());
  }
}
