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

import 'dart:convert';

import 'ble_custom_action.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';

Future addDeviceDEMO(String? mode) async {
  // Add your function code here!

  if (mode == 'addDevice') {
// добавляем поключенный выбранный девайс в итоговый  список по выбранному ID

    await Future.delayed(const Duration(milliseconds: 1000));

    ForDevices_accumulate_and_output_v9(
        retainOnlySelectedDevice(
            FFAppState().ListBleDevice, FFAppState().selectedDeviceId),
        true,
        true,
        true);
  }

/*
  if (kIsWeb) {
    print("Web");
    print("Web");

     await Future.delayed(const Duration(milliseconds: 3000));

    FFAppState().Scaner = 1; // эмитация того что сканирвоание завершено !!
    bleScanDemo();

     initializeDeviceShedulle();

    print("Running on WEB");
  }
*/

  await Future.delayed(const Duration(milliseconds: 3000));

  FFAppState().Scaner = 1; // эмитация того что сканирвоание завершено !!
  bleScanDemo();

  initializeDeviceShedulle();
}
