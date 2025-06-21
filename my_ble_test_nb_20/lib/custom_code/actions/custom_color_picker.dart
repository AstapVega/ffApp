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

import 'dart:async';
import 'dart:io' show Platform;

int inputIndex = 0;

Future customColorPicker(Color? inputColor) async {
  // Add your function code here!

  Color deviceColor_local = const Color.fromARGB(255, 20, 20, 20);

// 1. Вычитываем текущий цвет согласно ID девайса
  deviceColor_local =
      readListOfMyDevice1Field(FFAppState().selectedDeviceId, 'deviceColor');

  if (deviceColor_local != inputColor) {
// 2. если цвет выбрали другой то запускае обновленяи и скидываем значки на чекбоксах  иначе ничего

    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'deviceColor', inputColor);
    FFAppState().deviceColor =
        inputColor ?? FFAppState().deviceColor; //Что делает этот костыль?
    //   Если inputColor есть → записываем его.
    //   Если inputColor == null → оставляем старый цвет.

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
    FFAppState().color8OnOff = false;
    updateListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'color8OnOff', FFAppState().color8OnOff);
  }
}
