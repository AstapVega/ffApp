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

import 'dart:math';

Future onColorSelectedAction() async {
  // Add your function code here!
  //globalOnColorSelected?.call(getRandomColor());// не рабочий подход!! коббек автоматом не обновляет состяоние виджета , тем боле он final параметр

  // FFAppState().bufercolor =
  //     getRandomColor(); //  ТРИГРИМ   наш виджет через FFAppState().bufercolor котрую  обновляем пр нажатии н акнопку!!!
//FFAppState().bufercolor = Colors.yellow;// так не обновляет. (проверка) сотояние старое .  Не перестраивает виджет

// при каждом вызове onColorSelectedAction() нужно анализировать состояние массива FFAppState().colorHistory[] на наличие данных как таковых и новых
// цветов и добовлять новый цвет с хвоста если цвет в переменной FFAppState().colorFromPicker отличается от вариантов что есть по факту в массиве
//   FFAppState().colorHistory[]

// Получаем текущий список цветов
  List<Color> history = FFAppState().colorHistory;
  // Получаем выбранный цвет из пикера
  Color newColor = FFAppState().colorFromPicker;
  // Проверяем, есть ли уже такой цвет в истории

  // Проверяем, что цвет не null, его ещё нет в истории и не превышен лимит
  if (newColor != null && !history.contains(newColor) && history.length < 98) {
    // Добавляем новый цвет в конец списка
    history.add(newColor);

    FFAppState().deviceColor =
        newColor; // буферизируем новый вбраный кастомный цвет для дальнейшей обработки

    // Обновляем состояние (чтобы Flutter Flow увидел изменения)
    FFAppState().colorHistory = List.from(history);
  } else {
    if (history.length >= 98) {
// Если лимит достигнут – ставим флаг
      FFAppState().isColorHistoryFull = true;
    }
  }

  print("🎨 Выбран цвет: ");
}

Color getRandomColor() {
  final Random random = Random();
  return Color.fromARGB(
    255,
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
  );
}
