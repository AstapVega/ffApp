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

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import 'ble_custom_action.dart';

import 'dart:async';
import 'dart:io' show Platform;

Future colorAction(
  bool? state,
  int? inputIndex,
) async {
  // Add your function code here!

  if (inputIndex == 1) {
    //   цвет 1
    ///  FFAppState().deviceColor = FFAppConstants.deviceColor1;
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'deviceColor',
        FFAppConstants.deviceColor1);
    FFAppState().deviceColor =
        readListOfMyDevice1Field(FFAppState().selectedDeviceId, 'deviceColor');

    FFAppState().color1OnOff = true;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color1OnOff', FFAppState().color1OnOff);
    FFAppState().color2OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color2OnOff', FFAppState().color2OnOff);
    FFAppState().color3OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color3OnOff', FFAppState().color3OnOff);
    FFAppState().color4OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color4OnOff', FFAppState().color4OnOff);
    FFAppState().color5OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color5OnOff', FFAppState().color5OnOff);
    FFAppState().color6OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color6OnOff', FFAppState().color6OnOff);
    FFAppState().color7OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color7OnOff', FFAppState().color7OnOff);
    FFAppState().color8OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color8OnOff', FFAppState().color8OnOff);
  }
  if (inputIndex == 2) {
    // цвет 1
    //FFAppState().deviceColor = FFAppConstants.deviceColor2;
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'deviceColor',
        FFAppConstants.deviceColor2);
    FFAppState().deviceColor =
        readListOfMyDevice1Field(FFAppState().selectedDeviceId, 'deviceColor');

    FFAppState().color1OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color1OnOff', FFAppState().color1OnOff);
    FFAppState().color2OnOff = true;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color2OnOff', FFAppState().color2OnOff);
    FFAppState().color3OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color3OnOff', FFAppState().color3OnOff);
    FFAppState().color4OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color4OnOff', FFAppState().color4OnOff);
    FFAppState().color5OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color5OnOff', FFAppState().color5OnOff);
    FFAppState().color6OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color6OnOff', FFAppState().color6OnOff);
    FFAppState().color7OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color7OnOff', FFAppState().color7OnOff);
    FFAppState().color8OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color8OnOff', FFAppState().color8OnOff);
  }
  if (inputIndex == 3) {
    // цвет 1
    //FFAppState().deviceColor = FFAppConstants.deviceColor3;
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'deviceColor',
        FFAppConstants.deviceColor3);
    FFAppState().deviceColor =
        readListOfMyDevice1Field(FFAppState().selectedDeviceId, 'deviceColor');

    FFAppState().color1OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color1OnOff', FFAppState().color1OnOff);
    FFAppState().color2OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color2OnOff', FFAppState().color2OnOff);
    FFAppState().color3OnOff = true;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color3OnOff', FFAppState().color3OnOff);
    FFAppState().color4OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color4OnOff', FFAppState().color4OnOff);
    FFAppState().color5OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color5OnOff', FFAppState().color5OnOff);
    FFAppState().color6OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color6OnOff', FFAppState().color6OnOff);
    FFAppState().color7OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color7OnOff', FFAppState().color7OnOff);
    FFAppState().color8OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color8OnOff', FFAppState().color8OnOff);
  }
  if (inputIndex == 4) {
    // цвет 1
    //FFAppState().deviceColor = FFAppConstants.deviceColor4;
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'deviceColor',
        FFAppConstants.deviceColor4);
    FFAppState().deviceColor =
        readListOfMyDevice1Field(FFAppState().selectedDeviceId, 'deviceColor');

    FFAppState().color1OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color1OnOff', FFAppState().color1OnOff);
    FFAppState().color2OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color2OnOff', FFAppState().color2OnOff);
    FFAppState().color3OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color3OnOff', FFAppState().color3OnOff);
    FFAppState().color4OnOff = true;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color4OnOff', FFAppState().color4OnOff);
    FFAppState().color5OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color5OnOff', FFAppState().color5OnOff);
    FFAppState().color6OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color6OnOff', FFAppState().color6OnOff);
    FFAppState().color7OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color7OnOff', FFAppState().color7OnOff);
    FFAppState().color8OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color8OnOff', FFAppState().color8OnOff);
  }
  if (inputIndex == 5) {
    // цвет 1
    //FFAppState().deviceColor = FFAppConstants.deviceColor5;
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'deviceColor',
        FFAppConstants.deviceColor5);
    FFAppState().deviceColor =
        readListOfMyDevice1Field(FFAppState().selectedDeviceId, 'deviceColor');

    FFAppState().color1OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color1OnOff', FFAppState().color1OnOff);
    FFAppState().color2OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color2OnOff', FFAppState().color2OnOff);
    FFAppState().color3OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color3OnOff', FFAppState().color3OnOff);
    FFAppState().color4OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color4OnOff', FFAppState().color4OnOff);
    FFAppState().color5OnOff = true;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color5OnOff', FFAppState().color5OnOff);
    FFAppState().color6OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color6OnOff', FFAppState().color6OnOff);
    FFAppState().color7OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color7OnOff', FFAppState().color7OnOff);
    FFAppState().color8OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color8OnOff', FFAppState().color8OnOff);
  }
  if (inputIndex == 6) {
    // цвет 1
    //FFAppState().deviceColor = FFAppConstants.deviceColor6;
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'deviceColor',
        FFAppConstants.deviceColor6);
    FFAppState().deviceColor =
        readListOfMyDevice1Field(FFAppState().selectedDeviceId, 'deviceColor');

    FFAppState().color1OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color1OnOff', FFAppState().color1OnOff);
    FFAppState().color2OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color2OnOff', FFAppState().color2OnOff);
    FFAppState().color3OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color3OnOff', FFAppState().color3OnOff);
    FFAppState().color4OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color4OnOff', FFAppState().color4OnOff);
    FFAppState().color5OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color5OnOff', FFAppState().color5OnOff);
    FFAppState().color6OnOff = true;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color6OnOff', FFAppState().color6OnOff);
    FFAppState().color7OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color7OnOff', FFAppState().color7OnOff);
    FFAppState().color8OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color8OnOff', FFAppState().color8OnOff);
  }

  if (inputIndex == 7) {
    // цвет 1
    // FFAppState().deviceColor = FFAppConstants.deviceColor7;
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'deviceColor',
        FFAppConstants.deviceColor7);
    FFAppState().deviceColor =
        readListOfMyDevice1Field(FFAppState().selectedDeviceId, 'deviceColor');

    FFAppState().color1OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color1OnOff', FFAppState().color1OnOff);
    FFAppState().color2OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color2OnOff', FFAppState().color2OnOff);
    FFAppState().color3OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color3OnOff', FFAppState().color3OnOff);
    FFAppState().color4OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color4OnOff', FFAppState().color4OnOff);
    FFAppState().color5OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color5OnOff', FFAppState().color5OnOff);
    FFAppState().color6OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color6OnOff', FFAppState().color6OnOff);
    FFAppState().color7OnOff = true;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color7OnOff', FFAppState().color7OnOff);
    FFAppState().color8OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color8OnOff', FFAppState().color8OnOff);
  }
  if (inputIndex == 8) {
    // цвет 1
    //  FFAppState().deviceColor = FFAppConstants.deviceColor8;
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'deviceColor',
        FFAppConstants.deviceColor8);
    FFAppState().deviceColor =
        readListOfMyDevice1Field(FFAppState().selectedDeviceId, 'deviceColor');

    FFAppState().color1OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color1OnOff', FFAppState().color1OnOff);
    FFAppState().color2OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color2OnOff', FFAppState().color2OnOff);
    FFAppState().color3OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color3OnOff', FFAppState().color3OnOff);
    FFAppState().color4OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color4OnOff', FFAppState().color4OnOff);
    FFAppState().color5OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color5OnOff', FFAppState().color5OnOff);
    FFAppState().color6OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color6OnOff', FFAppState().color6OnOff);
    FFAppState().color7OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color7OnOff', FFAppState().color7OnOff);
    FFAppState().color8OnOff = true;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color8OnOff', FFAppState().color8OnOff);
  }
}

void read_all_chexboxColor_from_DeviceList() {
  FFAppState().color1OnOff =
      readListOfMyDevice1Field(FFAppState().selectedDeviceId, 'color1OnOff');
  FFAppState().color2OnOff =
      readListOfMyDevice1Field(FFAppState().selectedDeviceId, 'color2OnOff');
  FFAppState().color3OnOff =
      readListOfMyDevice1Field(FFAppState().selectedDeviceId, 'color3OnOff');
  FFAppState().color4OnOff =
      readListOfMyDevice1Field(FFAppState().selectedDeviceId, 'color4OnOff');
  FFAppState().color5OnOff =
      readListOfMyDevice1Field(FFAppState().selectedDeviceId, 'color5OnOff');
  FFAppState().color6OnOff =
      readListOfMyDevice1Field(FFAppState().selectedDeviceId, 'color6OnOff');
  FFAppState().color7OnOff =
      readListOfMyDevice1Field(FFAppState().selectedDeviceId, 'color7OnOff');
  FFAppState().color8OnOff =
      readListOfMyDevice1Field(FFAppState().selectedDeviceId, 'color8OnOff');
}
