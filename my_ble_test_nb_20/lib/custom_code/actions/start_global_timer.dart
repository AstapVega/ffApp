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

import 'my_chart1action.dart';

import 'dart:async';

import 'dart:math' as Math;

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Глобальная область
Timer? globalTimer;

bool isNewData = false;

var buffers;

var rawData;

double minX = 0;
double maxX = 0;
double minX_onTAP = 0;
double maxX_onTAP = 0;

// Кастомный экшен — только первый запуск и инициализация таймера

Future startGlobalTimer(String? intervalMsStr) async {
  // Проверяем, активен ли таймер
  if (globalTimer != null && globalTimer!.isActive) {
    print('⚠ Глобальный таймер уже запущен.');
    return;
  }

  // Парсим строку интервала
  int intervalMs = int.tryParse(intervalMsStr ?? '') ?? 1000;
  if (intervalMs <= 0) {
    print('⚠ Некорректный интервал, используется 1000 мс по умолчанию.');
    intervalMs = 1000;
  }

  // Инициализация и первый запуск
  globalTimer = Timer.periodic(Duration(milliseconds: intervalMs), (timer) {
    onGlobalTimerTick(); // Вызов внешней функции-обработчика
  });

  print('✅ Глобальный таймер запущен с интервалом $intervalMs мс.');
}

// Глобальная функция обработки тиков таймера
Future<void> onGlobalTimerTick() async {
  if (FFAppState().TimerComander == 'loadShart' &&
      (FFAppState().LineCharData1.isEmpty)) {
    FFAppState().TimerComander = ''; // сброс команды
    // TODO: вставить вызов loadChart()

    //final rawData;

    rawData = await generateTestDataV2(nDays: 182); // шаг 1: генератор данных
    printDateTimeFromUnix(rawData[0][0]); // рабочий
    printDateTimeFromUnix(rawData[1439][0]); //  рабочий

    buffers = extractBuffersFromTableV2(rawData); // шаг 2: вычленение буферов

    FFAppState().LineCharData1 = passthroughV2(buffers, 'T1');
    FFAppState().LineCharData2 = passthroughV2(buffers, 'T2');

    minX = (await loadPref('lineChartMinX')) as double? ?? 0.0;
    maxX = (await loadPref('lineChartMaxX')) as double? ?? 0.0;

    if ((minX != 0) && ((maxX - minX) == 1439)) {
      FFAppState().LineCharMinX = minX;
      FFAppState().LineCharMaxX = maxX;
    } else {
      minX = 0;
      maxX = 1439;
      FFAppState().LineCharMinX = minX;
      FFAppState().LineCharMaxX = maxX;
      await savePref('lineChartMinX', minX);
      await savePref('lineChartMaxX', maxX);
      minX = (await loadPref('lineChartMinX')) as double? ?? 0.0;
      maxX = (await loadPref('lineChartMaxX')) as double? ?? 0.0;
    }

    //считаем длину данных
    FFAppState().dataChartLength = FFAppState().LineCharData1.length;

    //if (FFAppState().LineChartZoom == false) {
    FFAppState().LineChartUnixTimePoint =
        findUnixTimeByIndex(FFAppState().LineCharData1, minX.toInt());

    // print(FFAppState().LineChartUnixTimePoint);
    // print(
    //     'formatUnixToDate: ${formatUnixToDate(FFAppState().LineChartUnixTimePoint)}'); // контрольный вывод даты

    int timepoint = findIndexByUnixTime(
        FFAppState().LineCharData1, FFAppState().LineChartUnixTimePoint);

    FFAppState().tooltipLineChartX = timepoint.toDouble();
    FFAppState().scrollChannel = 1;
    FFAppState().LineChartOnTap =
        true; // включаем флаг обновления " RebuildAllPages"

    //}

    print('✅ График загружен');
  }

  if (isNewData == true) {
// Сохранение диапазона
    isNewData = false; // сброс флага
// обновили данные, сохраняем диапазон

    await savePref('lineChartMinX', minX);
    await savePref('lineChartMaxX', maxX);
  }

  print(minX); // контрольный вывод через глобальные переменые minX и maxX
  print(maxX); // контрольный вывод через глобальные переменые minX и maxX

  if (FFAppState().TimerComander == 'ScanBLE') {
    FFAppState().TimerComander = ''; // сброс команды
    // TODO: вставить вызов BLE-сканирования
  }
}

/// Сохраняет любое примитивное значение под произвольным ключом.
Future<void> savePref(String key, dynamic value) async {
  final prefs = await SharedPreferences.getInstance();
  if (value is int) {
    await prefs.setInt(key, value);
  } else if (value is double) {
    await prefs.setDouble(key, value);
  } else if (value is bool) {
    await prefs.setBool(key, value);
  } else if (value is String) {
    await prefs.setString(key, value);
  } else if (value is List<String>) {
    await prefs.setStringList(key, value);
  } else {
    throw UnsupportedError('Неподдерживаемый тип: ${value.runtimeType}');
  }
}

/// Загружает значение по ключу. Вернёт нужный тип или `null`, если нет.
Future<dynamic> loadPref(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.get(key);
}

//пример
/*
// Сохранение диапазона
await savePref('lineChartMinX', FFAppState().lineChartMinX);
await savePref('lineChartMaxX', FFAppState().lineChartMaxX);

// Загрузка диапазона
final rawMin = await loadPref('lineChartMinX');
final rawMax = await loadPref('lineChartMaxX');

final minX = rawMin is double ? rawMin : 0.0;  // или ваш дефолт
final maxX = rawMax is double ? rawMax : 100.0;

// Запишем в AppState
FFAppState().update((s) {
  s.lineChartMinX = minX;
  s.lineChartMaxX = maxX;
});
*/
