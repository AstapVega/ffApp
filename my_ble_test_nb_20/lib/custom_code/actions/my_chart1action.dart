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

import 'dart:math' as Math;
import 'dart:math' as Math;

import 'package:flutter/foundation.dart';

import 'start_global_timer.dart';

Future myChart1action(String mode) async {
  // Add your function code here!

  if ((mode == 'generate') && (FFAppState().LineCharData1.isEmpty)) {
    var rawData;
    var buffers;
    var t1Rotated;
    var t2Rotated;

    rawData = [];
    buffers = [];
    t1Rotated = [];
    t2Rotated = [];

    rawData = generateTestData(nDays: 1); // шаг 1: генератор данных
    buffers =
        extractBuffersFromTable(rawData, 0, 1440); // шаг 2: вычленение буферов
    //считывание буферов, тесовое извлчение без сдвига
    t1Rotated = passthrough(buffers['T1']!);
    t2Rotated = passthrough(buffers['T2']!);

    // шаг 4: результат → AppState (или прямо в график, если передаёшь напрямую)
    FFAppState().APPmeasuredData1 = t1Rotated;
    FFAppState().APPmeasuredData2 = t2Rotated;

// код для отладки

    FFAppState().LineCharData1 = [];
    FFAppState().LineCharData2 = [];
    rawData = [];
    buffers = [];
    t1Rotated = [];
    t2Rotated = [];
    rawData = await generateTestDataV2(nDays: 182); // шаг 1: генератор данных
    printDateTimeFromUnix(rawData[0][0]); // рабочий
    printDateTimeFromUnix(rawData[1439][0]); //  рабочий
    // buffers = extractBuffersFromTableV2(
    //     rawData, 0, 1440); // шаг 2: вычленение буферов
    buffers = extractBuffersFromTableV2(rawData); // шаг 2: вычленение буферов
    //считывание буферов, тесовое извлчение без сдвига
    t1Rotated = passthroughV2(buffers, 'T1');
    t2Rotated = passthroughV2(buffers, 'T2');
    FFAppState().LineCharData1 = t1Rotated;
    FFAppState().LineCharData2 = t2Rotated;

//проверка послежлвательного вызова

    // await Future.delayed(const Duration(seconds: 2)); // тест на индикатор загрузки

    print('TEST');
    print('TEST');
    print('TEST');

    print('TEST');
  }

  if (mode == 'LineChartOnTap') {
    FFAppState().LineChartOnTap = true; // включаем флаг
    FFAppState().update(() {}); // обновляем AppState
  }

  if (mode == 'tooltipPosition') {
    //  FFAppState().tooltipLineChartX =
    //     FFAppState().tooltipLineChartX + 10; // ещё раз явно задать
    // FFAppState().tooltipLineChartX = 300; // ещё раз явно задать

    FFAppState().LineChartOnTap = true; // включаем флаг

    if (FFAppState().LineChartZoom == false) {
      int timepoint = findIndexByUnixTime(
          FFAppState().LineCharData1, FFAppState().LineChartUnixTimePoint);
      FFAppState().tooltipLineChartX = timepoint.toDouble();

      //FFAppState().tooltipLineChartX = minX.toDouble();
    } else {
      int timepoint = findIndexByUnixTime(FFAppState().panoramaLineCharData1,
          FFAppState().LineChartUnixTimePoint);
      FFAppState().tooltipLineChartX = timepoint.toDouble();
    }

    FFAppState().update(() {}); // обновляем AppState
  }
}

/// Генерация тестовых данных на N дней.
/// Возвращает список точек в формате: [время_в_минутах, T1, T2]
List<List<int>> generateTestData({int nDays = 1}) {
  List<List<int>> result = [];

  final int totalPoints = nDays * 1440; // 1440 минут в сутки

  // Частоты подобраны так, чтобы оставались бесшовными на любом N
  final freq1a = 2 * Math.pi * 2 / 1440; // 2 цикла в сутки
  final freq1b = 2 * Math.pi * 4 / 1440; // 4 цикла в сутки

  final freq2a = 2 * Math.pi * 3 / 1440; // 3 цикла в сутки
  final freq2b = 2 * Math.pi * 6 / 1440; // 6 циклов в сутки

  for (int i = 0; i < totalPoints; i++) {
    final double t1 =
        22 + 4 * ((Math.sin(i * freq1a) + Math.sin(i * freq1b)) / 2);
    final double t2 =
        21 + 3.5 * ((Math.sin(i * freq2a) + Math.sin(i * freq2b)) / 2);

    result.add([i, (t1 * 10).round(), (t2 * 10).round()]);
  }

  return result;
}

//Извлечение буферов из таблицы (extractBuffersFromTable)
/// Извлекает два буфера T1 и T2 на диапазоне [start, end)
Map<String, List<int>> extractBuffersFromTable(
    List<List<int>> table, int start, int end) {
  List<int> bufferT1 = List.filled(end - start, 0);
  List<int> bufferT2 = List.filled(end - start, 0);

  for (var row in table) {
    int px = row[0];
    if (px >= start && px < end) {
      int index = px - start;
      bufferT1[index] = row[1];
      bufferT2[index] = row[2];
    }
  }

  return {
    'T1': bufferT1,
    'T2': bufferT2,
  };
}

// Кольцевой сдвиг (rotateDataV1)

/// Выполняет кольцевой сдвиг массива на shift шагов
List<int> rotateDataV1(List<int> input, int shift) {
  int len = input.length;
  if (len == 0) return []; // если пустой — вернуть пустой

  List<int> output = List<int>.filled(len, 0);

  for (int i = 0; i < len; i++) {
    int newIndex = (i + shift) % len; // расчёт новой позиции по кольцу
    output[newIndex] = input[i]; // перенос значения
  }

  return output;
}

// rotateRight(data, shift) — сдвиг вправо на shift минут:
List<int> rotateRight(List<int> data, int shift) {
  final len = data.length;
  final s = shift % len;
  return data.sublist(len - s)..addAll(data.sublist(0, len - s));
}

//rotateLeft(data, shift) — сдвиг влево на shift минут:

List<int> rotateLeft(List<int> data, int shift) {
  final len = data.length;
  final s = shift % len;
  return data.sublist(s)..addAll(data.sublist(0, s));
}

// просто извлечение без СДВИГА
List<int> passthrough(List<int> buffer) {
  return List<int>.from(buffer); // возвращает копию
}

//----------- новый код поl новые структуры  для FFAppState().LineCharData1 и FFAppState().LineCharData2
/*
// ГЕНЕРАЦИЯ ОТ СЕГОДНЯ В БУДУЩЕЕ

/// Генерация тестовых данных на N дней.
/// Возвращает список точек в формате: [unix_timestamp, T1, T2]

Future<List<List<int>>> generateTestDataV2({int nDays = 1}) async {
  return await compute(_generateTestDataWorker, nDays);
}

// Рабочая функция, которая будет запущена в изоляте
List<List<int>> _generateTestDataWorker(int nDays) {
  List<List<int>> result = [];

  final now = DateTime.now().toUtc();
  final startOfDay = DateTime.utc(now.year, now.month, now.day, 0, 0, 0);
  final int totalPoints = nDays * 1440;

  final freq1a = 2 * Math.pi * 2 / 1440;
  final freq1b = 2 * Math.pi * 4 / 1440;
  final freq2a = 2 * Math.pi * 3 / 1440;
  final freq2b = 2 * Math.pi * 6 / 1440;

  for (int i = 0; i < totalPoints; i++) {
    final double t1 =
        22 + 4 * ((Math.sin(i * freq1a) + Math.sin(i * freq1b)) / 2);
    final double t2 =
        21 + 3.5 * ((Math.sin(i * freq2a) + Math.sin(i * freq2b)) / 2);

    final timestamp =
        startOfDay.add(Duration(minutes: i)).millisecondsSinceEpoch ~/ 1000;

    result.add([timestamp, (t1 * 10).round(), (t2 * 10).round()]);
  }

  return result;
}

*/

/// Генерация тестовых данных на N дней  В ПРОШЛОЕ  от сегодняшней полуночи.
/// Возвращает список точек в формате: [unix_timestamp, T1, T2]

Future<List<List<int>>> generateTestDataV2({int nDays = 1}) async {
  return await compute(_generateTestDataWorker, nDays);
}

List<List<int>> _generateTestDataWorker(int nDays) {
  List<List<int>> result = [];

  final now = DateTime.now().toUtc();

  // Конец сегодняшнего дня: 23:59
  final endOfToday = DateTime.utc(now.year, now.month, now.day, 23, 59, 0);

  final totalPoints = nDays * 1440;

  final freq1a = 2 * Math.pi * 2 / 1440;
  final freq1b = 2 * Math.pi * 4 / 1440;
  final freq2a = 2 * Math.pi * 3 / 1440;
  final freq2b = 2 * Math.pi * 6 / 1440;

  for (int i = 0; i < totalPoints; i++) {
    final double t1 =
        22 + 4 * ((Math.sin(i * freq1a) + Math.sin(i * freq1b)) / 2);
    final double t2 =
        21 + 3.5 * ((Math.sin(i * freq2a) + Math.sin(i * freq2b)) / 2);

    final timestamp = endOfToday
            .subtract(Duration(
                minutes: totalPoints -
                    1 -
                    i)) // ← начинаем от 23:59 и двигаемся назад
            .millisecondsSinceEpoch ~/
        1000;

    result.add([timestamp, (t1 * 10).round(), (t2 * 10).round()]);
  }

  return result;
}

/*
variant — выбирает формулу генерации
periodMultiplier — изменяет “растяжение” (умножаем частоту на 1/periodMultiplier → чтобы при periodMultiplier > 1 график сжимался, а при <1 растягивался)
все формулы остались “жизненными” (с синусами/косинусами), но дают разные паттерны, не такие симметричные


final rawData = await generateTestDataV2(nDays: 30, variant: 3, periodMultiplier: 1.5);


*/

List<List<int>> _generateTestDataWorkerV2(Map<String, dynamic> params) {
  int nDays = params['nDays'];
  int variant = params['variant'];
  double periodMultiplier = params['periodMultiplier'];

  List<List<int>> result = [];

  final now = DateTime.now().toUtc();
  final startOfDay = DateTime.utc(now.year, now.month, now.day, 0, 0, 0);
  final int totalPoints = nDays * 1440;

  final freq1a = 2 * Math.pi * 2 / 1440 / periodMultiplier;
  final freq1b = 2 * Math.pi * 4 / 1440 / periodMultiplier;
  final freq2a = 2 * Math.pi * 3 / 1440 / periodMultiplier;
  final freq2b = 2 * Math.pi * 6 / 1440 / periodMultiplier;

  for (int i = 0; i < totalPoints; i++) {
    double t1 = 0;
    double t2 = 0;

    switch (variant) {
      case 1:
        t1 = 22 + 4 * ((Math.sin(i * freq1a) + Math.sin(i * freq1b)) / 2);
        t2 = 21 + 3.5 * ((Math.sin(i * freq2a) + Math.sin(i * freq2b)) / 2);
        break;
      case 2:
        t1 = 20 + 3 * Math.sin(i * freq1a) + 2 * Math.cos(i * freq1b);
        t2 = 19 + 2.5 * Math.sin(i * freq2a) + 1.5 * Math.cos(i * freq2b);
        break;
      case 3:
        t1 = 22 + 5 * Math.sin(i * freq1a + Math.pi / 4);
        t2 = 20 + 4 * Math.sin(i * freq2a + Math.pi / 3);
        break;
      case 4:
        t1 = 23 + 2 * Math.sin(i * freq1a) + 1.5 * Math.sin(i * freq2a);
        t2 = 21 + 2 * Math.cos(i * freq1b) + 1.5 * Math.cos(i * freq2b);
        break;
      case 5:
        t1 = 22 + (Math.sin(i * freq1a) * Math.cos(i * freq1b)) * 4;
        t2 = 21 + (Math.sin(i * freq2a) * Math.cos(i * freq2b)) * 3;
        break;
      default:
        t1 = 22;
        t2 = 21;
    }

    final timestamp =
        startOfDay.add(Duration(minutes: i)).millisecondsSinceEpoch ~/ 1000;
    result.add([timestamp, (t1 * 10).round(), (t2 * 10).round()]);
  }

  return result;
}

/// Извлекает буферы в формате [время, значение] для T1 и T2 на диапазоне [start, end)
///
/*
Map<String, List<List<int>>> extractBuffersFromTableV2(List<List<int>> table) {
  List<List<int>> t1 = [];
  List<List<int>> t2 = [];

  for (var row in table) {
    if (row.length < 3) continue;
    t1.add([row[0], row[1]]);
    t2.add([row[0], row[2]]);
  }

  print('✅ Готово: T1=${t1.length}, T2=${t2.length}');

  return {'T1': t1, 'T2': t2};
}

*/

Map<String, List<List<int>>> extractBuffersFromTableV2(
  List<List<int>> rawData, {
  int? startIndex,
  int? endIndex,
}) {
  // Защита от выхода за пределы
  final from = (startIndex ?? 0).clamp(0, rawData.length - 1);
  final to = (endIndex ?? (rawData.length - 1)).clamp(from, rawData.length - 1);

  final result = {
    'T1': <List<int>>[],
    'T2': <List<int>>[],
  };

  for (int i = from; i <= to; i++) {
    final row = rawData[i];
    if (row.length < 3) continue;

    result['T1']!.add([row[0], row[1]]); // [timestamp, T1]
    result['T2']!.add([row[0], row[2]]); // [timestamp, T2]
  }

  return result;
}

/*
List<LineChartStruct> passthroughV2(
    Map<String, List<List<int>>> buffers, String key) {
  final buffer = buffers[key]!;
  List<LineChartStruct> result = [];

  for (var row in buffer) {
    if (row.length < 2) continue;

    result.add(LineChartStruct(
      time: row[0],
      temper: row[1],
    ));
  }

  return result;
}
*/

/*
FFAppState().LineCharData1 = passthroughV2(buffers, 'T1');                    // всё
FFAppState().LineCharData2 = passthroughV2(buffers, 'T2', startIndex: 0);     // от начала до конца
FFAppState().LineCharData1 = passthroughV2(buffers, 'T1', endIndex: 100);     // срез 0–100
FFAppState().LineCharData1 = passthroughV2(buffers, 'T1', startIndex: 100, endIndex: 200); // диапазон
FFAppState().LineCharData2 = passthroughV2(buffers, 'T2', startIndex: buffers['T2']!.length - 1); // последний
*/

List<LineChartStruct> passthroughV2(
  Map<String, List<List<int>>> buffers,
  String key, {
  int? startIndex,
  int? endIndex,
}) {
  final buffer = buffers[key]!;
  final from = startIndex ?? 0;
  final to = endIndex ?? (buffer.length - 1);

  List<LineChartStruct> result = [];

  for (int i = from; i <= to && i < buffer.length; i++) {
    final row = buffer[i];
    if (row.length < 2) continue;

    result.add(LineChartStruct(
      time: row[0],
      temper: row[1],
    ));
  }

  return result;
}

// Сдвигает только temper, time остаётся на месте
List<LineChartStruct> rotateLeftV2(List<LineChartStruct> data, int shift) {
  final len = data.length; // Получаем длину списка
  if (len == 0) return []; // Пустой список — сразу выход

  // Выделяем отдельный список температур
  final temps = data.map((e) => e.temper).toList(); // список int

  // Нормализуем сдвиг (на случай отрицательных или превышающих значений)
  final s = ((shift % len) + len) % len;

  // Сдвигаем температуры влево
  final rotatedTemps = [
    ...temps.sublist(s),
    ...temps.sublist(0, s),
  ];

  // Собираем новый список LineChartStruct, оставляя time, но подставляя новую температуру
  return List.generate(len, (i) {
    return LineChartStruct(
      time: data[i].time, // оригинальное время
      temper: rotatedTemps[i], // новая температура
    );
  });
}

List<LineChartStruct> rotateRightV2(List<LineChartStruct> data, int shift) {
  final len = data.length;
  if (len == 0) return [];
  final s = shift % len;
  return [
    ...data.sublist(len - s),
    ...data.sublist(0, len - s),
  ];
}

// отладочный вывод unixTime в дату и время

void printDateTimeFromUnix(int unixTimeSec) {
  // Преобразуем Unix timestamp (в секундах) в объект DateTime

  DateTime dt = DateTime.fromMillisecondsSinceEpoch(unixTimeSec.toInt() * 1000,
      isUtc: true);
// 2. Переводим в местный часовой пояс
  //dt = dt.toLocal();

  // Форматируем вывод
  String dateStr = '${dt.day.toString().padLeft(2, '0')}.'
      '${dt.month.toString().padLeft(2, '0')}.'
      '${dt.year}';
  String timeStr = '${dt.hour.toString().padLeft(2, '0')}:'
      '${dt.minute.toString().padLeft(2, '0')}';

  // Выводим результат
  print('Дата: $dateStr, Время: $timeStr');
}

// АГРЕГАЦИЯ данных в режиме "панорама" — на 1440 точек

int XminALL = 0;
int XmaxALL = 0;

List<LineChartStruct> aggregateTo1440Final(
    List<LineChartStruct> input, int minTime, int maxTime) {
  const int minutesPerDay = 1440;

  int totalPoints = input.length;
  if (totalPoints == 0) return [];

  int intervalCount = (totalPoints / minutesPerDay).round();
  if (intervalCount < 1) intervalCount = 1;

  List<LineChartStruct> result = [];

  for (int i = 0; i < totalPoints; i += intervalCount) {
    int sumTemper = 0;
    int count = 0;
    int endIndex = (i + intervalCount).clamp(0, totalPoints);

    for (int j = i; j < endIndex; j++) {
      sumTemper += input[j].temper;
      count++;
    }

    int avgTemper = (count > 0) ? (sumTemper ~/ count) : 0;
    int time = input[i].time; // ВРЕМЕННАЯ МЕТКА из первой точки

    result.add(LineChartStruct(time: time, temper: avgTemper));
  }

  // --- ДОБАВЛЯЕМ ОБНОВЛЕНИЕ Xmin и Xmax ---
  if (result.isNotEmpty) {
    XminALL = result.first.time;
    XmaxALL = result.last.time;
  } else {
    XminALL = 0;
    XmaxALL = 0;
  }

  return result;
}

/* пример 

var minTime = FFAppState().LineCharMinX;
var maxTime = FFAppState().LineCharMaxX;

var t1Aggregated = aggregateTo1440Final(FFAppState().LineCharData1, minTime, maxTime);
var t2Aggregated = aggregateTo1440Final(FFAppState().LineCharData2, minTime, maxTime);




*/

String formatUnixToDate(int unixTime) {
  var dt = DateTime.fromMillisecondsSinceEpoch(unixTime * 1000, isUtc: true);
  var day = dt.day.toString().padLeft(2, '0');
  var month = dt.month.toString().padLeft(2, '0');
  var year = dt.year.toString().substring(2);
  return '$day.$month.$year';
}

int findIndexByUnixTime(List<LineChartStruct> data, int unixTime) {
  int left = 0;
  int right = data.length - 1;
  int result = right;

  while (left <= right) {
    int mid = left + ((right - left) ~/ 2);
    if (data[mid].time >= unixTime) {
      result = mid;
      right = mid - 1;
    } else {
      left = mid + 1;
    }
  }
  return result;
}

/// Возвращает unix-время (в секундах) на начало суток для данного unixtime.
/// Работает для любого unixTime в секундах (UTC!).
int findStartTimeByCurrentDay(int unixTime) {
  final date =
      DateTime.fromMillisecondsSinceEpoch(unixTime * 1000, isUtc: true);
  final startOfDay = DateTime.utc(date.year, date.month, date.day);
  return startOfDay.millisecondsSinceEpoch ~/ 1000;
}

// пример вызова

//int index = findIndexByUnixTime(FFAppState().LineCharData1, unixTime);

int? parseDateStrToUnix(String dateStr) {
  final parts = dateStr.split('.');
  if (parts.length != 3) return null;

  final day = int.tryParse(parts[0]);
  final month = int.tryParse(parts[1]);
  final year = int.tryParse(parts[2]);

  if (day == null || month == null || year == null) return null;

  final fullYear = 2000 + year; // всегда 2000 + гг

  final dt = DateTime.utc(fullYear, month, day);
  return (dt.millisecondsSinceEpoch ~/ 1000);
}

/*
берёт список агрегированных данных
сравнивает дату (год, месяц, день) с целевой датой
выбирает ближайшее время ТОЛЬКО внутри того же дня
возвращает индекс этой точки
если не нашлось ни одной точки в этом дне → возвращает 0

*/

int findClosestIndexSameDay(
    List<LineChartStruct> aggregatedData, int targetUnixTime) {
  final targetDate =
      DateTime.fromMillisecondsSinceEpoch(targetUnixTime * 1000, isUtc: true);

  int? closestIndex;
  int? minDiff;

  for (int i = 0; i < aggregatedData.length; i++) {
    final pointDate = DateTime.fromMillisecondsSinceEpoch(
        aggregatedData[i].time * 1000,
        isUtc: true);

    if (pointDate.year == targetDate.year &&
        pointDate.month == targetDate.month &&
        pointDate.day == targetDate.day) {
      final diff = (aggregatedData[i].time - targetUnixTime).abs();
      if (minDiff == null || diff < minDiff) {
        minDiff = diff;
        closestIndex = i;
      }
    }
  }

  return closestIndex ?? 0; // fallback если не найден
}

/// Возвращает значение времени (UNIX timestamp) по индексу
int findUnixTimeByIndex(List<LineChartStruct> data, int index) {
  if (index >= 0 && index < data.length) {
    return data[index].time;
  }
  return 0; // или -1, если хочешь признак ошибки
}
