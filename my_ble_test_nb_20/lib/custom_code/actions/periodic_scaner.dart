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

Future periodicScaner() async {
  // Add your function code here!

  //printCurrentTime();

  //  debugPrint( "ASTAP - сканируем и подключаемся к еашему девайсу"); // мой дебаг

  if (FFAppState().dialogActivity ==
      true) // если окно создано и бит FFAppState().dialogActivity == true
  {
    FFAppState().dialogActivity = false;
    debugPrint("диалогое окно ативно"); // мой дебаг
  } else {
    debugPrint("диалогое окно ЗАКРЫЛОСЬ"); // мой дебаг

    debugPrint("МОЖНО ДЕЛАТЬ ПЕРЕХОД НА ДРУГУЮ СТРАНИЦУ"); // мой дебаг
  }
}
