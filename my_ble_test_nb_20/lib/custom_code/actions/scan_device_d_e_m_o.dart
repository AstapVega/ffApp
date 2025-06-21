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

import 'dart:convert';

import 'ble_custom_action.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';

Future scanDeviceDEMO(String? mode) async {
  // Add your function code here!

// ДЕМО РЕЖИМ

  await Future.delayed(const Duration(milliseconds: 3000));
  bleScanDemo();
  FFAppState().Scaner = 1; // эмитация того что сканирвоание завершено !!
// окончание ДЕМО РЕЖИМА
}
