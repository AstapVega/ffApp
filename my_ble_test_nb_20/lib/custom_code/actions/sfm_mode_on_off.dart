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

import 'dart:async';
import 'dart:io' show Platform;

Future sfmModeOnOff(bool input) async {
  // Add your function code here!

  FFAppState().sfmModeOnOff = input;

  updateListOfMyDevice1Field(
      FFAppState().selectedDeviceId, 'sfmModeOnOff', input);
}
