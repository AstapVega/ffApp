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

import 'ble_custom_action.dart';

Future diologActivityTimer() async {
  // Add your function code here!

  if (FFAppState().dialogActivity ==
      false) // находимся в ОКНЕ выставляем бит активности
  {
    FFAppState().dialogActivity = true;
    debugPrint(
        "ASTAP - сканируем и подключаемся к еашему девайсу"); // мой дебаг
  }
}
