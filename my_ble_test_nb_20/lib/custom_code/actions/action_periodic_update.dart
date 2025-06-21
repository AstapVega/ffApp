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

import 'ble_custom_action.dart';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'dart:async';
import 'dart:io' show Platform;

Future actionPeriodicUpdate(int mode) async {
  // Add your function code here!
  // Add your function code here!

  // debugPrint(
  //    "Фонове обновление N /раз в секунду сразу после загрузки старницы ");

  if (mode == 1) {
    if (FFAppState().StatusConnectState == 0) {
      //   FFAppState().StatusOnOffColor = parseColor("#E1DDDD"); //светло серый

      updateListOfMyDevice1Field(
          FFAppState()
              .selectedDeviceId, //обновили значение в ЛИСТ ВЬЮ данного девайса
          'statusConnectState',
          FFAppState().StatusConnectState);

      updateListOfMyDevice1Field(
          FFAppState()
              .selectedDeviceId, //обновили значение в ЛИСТ ВЬЮ данного девайса
          'statusConnectColor',
          parseColor("#E1DDDD"));
    }

    if (FFAppState().StatusConnectState == 1) {
      //   FFAppState().StatusOnOffColor = parseColor("#39D2C0"); //берюзовый

      updateListOfMyDevice1Field(
          FFAppState()
              .selectedDeviceId, //обновили значение в ЛИСТ ВЬЮ данного девайса
          'statusConnectState',
          FFAppState().StatusConnectState);

      updateListOfMyDevice1Field(
          FFAppState()
              .selectedDeviceId, //обновили значение в ЛИСТ ВЬЮ данного девайса
          'statusConnectColor',
          parseColor("#39D2C0"));
    }
  }

  if (mode == 0) {
//------ возвращаем через глобальную перемнную статус текущего светодиода на странице девайса внутри его

    FFAppState().StatusConnectState = readListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'statusConnectState');

    FFAppState().StatusConnectColor = readListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'statusConnectColor');

    // print('=== processAllDevices  Проверка конечного списка ===');
  }
}
