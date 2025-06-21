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

import 'ble_custom_action.dart';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'dart:async';
import 'dart:io' show Platform;

Future gesterezisUpdate(String value) async {
  // Add your function code here!

  FFAppState().GesterezisOUT = value;

  //пишем в локальную структуру девайса по его ID
  updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'deviceHysteresis',
      FFAppState().GesterezisOUT);
}
