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

import 'ble_custom_action.dart';

import 'dart:async';
import 'dart:io' show Platform;

Future selectShedullMode(bool? mode) async {
  // Add your function code here!

  if (mode == false) {
    FFAppState().standartShedullMode = true;
    FFAppState().customShedullMode = false;

    updateListOfMyDevice1Field(FFAppState().selectedDeviceId,
        'standartShedullMode', FFAppState().standartShedullMode);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId,
        'customShedullMode', FFAppState().customShedullMode);
  }

  if (mode == true) {
    FFAppState().standartShedullMode = false;
    FFAppState().customShedullMode = true;

    updateListOfMyDevice1Field(FFAppState().selectedDeviceId,
        'standartShedullMode', FFAppState().standartShedullMode);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId,
        'customShedullMode', FFAppState().customShedullMode);
  }
}
