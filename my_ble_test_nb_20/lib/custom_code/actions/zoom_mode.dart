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

import 'start_global_timer.dart';
import 'my_chart1action.dart';

Future zoomMode(String? mode) async {
  // Add your function code here!

  if (mode == 'knobstate') {
    FFAppState().LineChartZoom = !FFAppState().LineChartZoom;
  }

  if (mode == 'Zoomming') {
    if (FFAppState().LineChartZoom == true) {
      // пропускаем через агригатор в режиме панорама

      FFAppState().LineCharMinX = 0;
      FFAppState().LineCharMaxX = 1439;

      //считаем длину данных
      FFAppState().dataChartLength = FFAppState().LineCharData1.length;

      var minTime = FFAppState().LineCharMinX; // значение в UNIX TIME
      var maxTime = FFAppState().LineCharMaxX; //

      var t1Aggregated = aggregateTo1440Final(
          FFAppState().LineCharData1, minTime.toInt(), maxTime.toInt());

      var t2Aggregated = aggregateTo1440Final(
          FFAppState().LineCharData2, minTime.toInt(), maxTime.toInt());

      FFAppState().dataChartLength = t1Aggregated.length;

      FFAppState().panoramaLineCharData1 = t1Aggregated;
      FFAppState().panoramaLineCharData2 = t2Aggregated;

      FFAppState().panoramaMode =
          true; // переключаем режим источкника данных  для ПАНОРАМЫ

      isNewData = true; // обновили данные, сохраняем диапазон

//  выводим принудительное новое положение Тултипла

      print(
          'LineChartUnixTimePoint: ${FFAppState().LineChartUnixTimePoint}'); // контрольный вывод даты
      print(
          'formatUnixToDate: ${formatUnixToDate(FFAppState().LineChartUnixTimePoint)}'); // контрольный вывод даты
      final ts = FFAppState()
          .LineChartUnixTimePoint; // целое число, Unix-время в секундах
      final dt = DateTime.fromMillisecondsSinceEpoch(ts * 1000,
          isUtc: true); // преобразуем во время
      final hhmm =
          '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}'; // форматируем
      print('Время: $hhmm'); // вывод в консоль

// пролучение  ближйашей временой точки в формате " ПОНАРАМА"
      int timepoint = findClosestIndexSameDay(
          FFAppState().panoramaLineCharData1,
          FFAppState().LineChartUnixTimePoint);

      FFAppState().tooltipLineChartX = timepoint.toDouble();

      FFAppState().LineChartOnTap =
          true; // включаем флаг обновления " RebuildAllPages"

      FFAppState().scrollChannel = 0;

      print('Panorama');
    } else {
      //инчае детально выводим данные каждый день

      FFAppState().panoramaMode =
          false; // переключаем режим источкника данных  для ДЕТАЛЬНОГО ВИДА

      FFAppState().LineCharData1 = passthroughV2(buffers, 'T1');
      FFAppState().LineCharData2 = passthroughV2(buffers, 'T2');

      minX = (await loadPref('lineChartMinX')) as double? ??
          0.0; // загрузка диапазона
      maxX = (await loadPref('lineChartMaxX')) as double? ??
          0.0; // загрузка диапазона

      FFAppState().LineCharMinX = minX; // сохранение диапазона
      FFAppState().LineCharMaxX = maxX; // сохранение диапазона

      FFAppState().dataChartLength = FFAppState().LineCharData1.length;

//  выводим принудительное новое положение Тултипла

      print(
          'LineChartUnixTimePoint: ${FFAppState().LineChartUnixTimePoint}'); // контрольный вывод даты
      print(
          'formatUnixToDate: ${formatUnixToDate(FFAppState().LineChartUnixTimePoint)}'); // контрольный вывод даты
      final ts = FFAppState()
          .LineChartUnixTimePoint; // целое число, Unix-время в секундах
      final dt = DateTime.fromMillisecondsSinceEpoch(ts * 1000,
          isUtc: true); // преобразуем во время
      final hhmm =
          '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}'; // форматируем
      print('Время: $hhmm'); // вывод в консоль

// пролучение  ближйашей временой точки в формате " ДЕТАЛЬНО"
      int timepoint = findIndexByUnixTime(
          FFAppState().LineCharData1, FFAppState().LineChartUnixTimePoint);

      FFAppState().tooltipLineChartX = timepoint.toDouble();

      FFAppState().LineChartOnTap =
          true; // включаем флаг обновления " RebuildAllPages"

      FFAppState().scrollChannel = 1;
    }

    print('Zoomming');
    // }
  }
}
