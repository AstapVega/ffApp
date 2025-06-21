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

import 'ble_custom_action.dart';

import 'dart:math';

Future selectHistoryColor(int? historyIndex) async {
  // Add your function code here!

  int colorIndex = 0;
  colorIndex = historyIndex ?? colorIndex;

  FFAppState().deviceColor = FFAppState()
      .colorHistory[colorIndex]; // подсвеичмваем текущий цвет пока не применили

  FFAppState().colorFromPicker = FFAppState().colorHistory[
      colorIndex]; // перехваитили данные ТИПА ОТ ПИКЕРА - но в реальности из истории
}
