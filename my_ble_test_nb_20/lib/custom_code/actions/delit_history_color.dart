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

Future delitHistoryColor(int? mode) async {
  // Add your function code here!

  if (mode == 1) {
    removeLastColor(); // удаляем цвет с хвоста
    FFAppState().isColorHistoryFull =
        false; //сбрасываем флаг ЗАПОЛНЕНСТИ спсика цветов
  }

  if (mode == 2) {
    removeCurrentColor(); // удаляем  выбранный цвет из списка

    FFAppState().isColorHistoryFull =
        false; //сбрасываем флаг ЗАПОЛНЕНСТИ спсика цветов
  }
}

void removeLastColor() {
  if (FFAppState().colorHistory.isNotEmpty) {
    FFAppState().colorHistory.removeLast();
    FFAppState().colorHistory =
        List.from(FFAppState().colorHistory); // Обновляем состояние
  }
}

void clearColorHistory() {
  if (FFAppState().colorHistory.isNotEmpty) {
    FFAppState().colorHistory.clear();
    FFAppState().colorHistory =
        List.from(FFAppState().colorHistory); // Обновляем состояние
  }
}

void removeCurrentColor() {
  Color currentColor = FFAppState().deviceColor;

  if (FFAppState().colorHistory.isNotEmpty) {
    if (FFAppState().colorHistory.contains(currentColor)) {
      FFAppState().colorHistory.remove(currentColor);
      FFAppState().colorHistory =
          List.from(FFAppState().colorHistory); // Обновляем состояние
    }
  }
}
