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

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'dart:async';
import 'dart:io' show Platform;

Future handOrProgModeSwich(bool mode) async {
  // Add your function code here!

  debugPrint("ТЕСТ ПЕРЕКЛЮЧАТЕЛЯ ");

  if (mode == false) // если 0 то перключен на ПРОГРАМНЫЙ РЕЖИМ
  {
    // обновляем переменную состояния (глобальный буфер) переключателя для дальнейшего парвильного  входа
    // и отображения текщего положения при загрузке стараницы со СЛАЙДЕРОМ

    FFAppState().HandProgModeSwich =
        false; // обновялемя перменную условного отображения  - общий тест условного отображения
    // условное отображение " РУКА"
    FFAppState().HandModeVisible = true;
    // условное отображение " PROG"
    FFAppState().ProgModeVisible = false;

//обновили значение структуры конкретного девайса для лист вью
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId,
        'handProgModeSwich', FFAppState().HandProgModeSwich);

//реверсивно меняем цвета иконок "ручной" и "программный"
    //  FFAppState().HandModeColor = parseColor("#B5BCCF"); //стал темнее #D09BA1B2
    FFAppState().HandModeColor =
        parseColor("#D09BA1B2"); //стал темнее #D09BA1B2
    FFAppState().ProgModeColor = parseColor("#59B5BCCF"); //стал светлее

    //сохраняем в структуре ID девайса с учетом Persistent (ПЗУ)
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'handModeColor',
        FFAppState().HandModeColor);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'progModeColor',
        FFAppState().ProgModeColor);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'handModeVisible',
        FFAppState().HandModeVisible);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'progModeVisible',
        FFAppState().ProgModeVisible);
  } else // иначе  РУЧНОЙ РЕЖИМ

  {
    // обновляем переменную состояния (глобальный буфер) переключателя для дальнейшего парвильного  входа
    // и отображения текщего положения при загрузке стараницы со СЛАЙДЕРОМ

    FFAppState().HandProgModeSwich =
        true; // обновялемя перменную условного отображения  - общий тест условного отображения

    // условное отображение " РУКА"
    FFAppState().HandModeVisible = false;
    // условное отображение " PROG"
    FFAppState().ProgModeVisible = true;

//обновили значение структуры конкретного девайса для лист вью
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId,
        'handProgModeSwich', FFAppState().HandProgModeSwich);

//реверсивно меняем цвета иконок "ручной" и "программный"
    //FFAppState().ProgModeColor = parseColor("#B5BCCF"); //стал темнее   #D09BA1B2
    FFAppState().ProgModeColor =
        parseColor("#D09BA1B2"); //стал темнее   #D09BA1B2

    FFAppState().HandModeColor =
        parseColor("#59B5BCCF"); //стал светлее  #D09BA1B2

//сохраняем в структуре ID девайса с учетом Persistent (ПЗУ)
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'handModeColor',
        FFAppState().HandModeColor);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'progModeColor',
        FFAppState().ProgModeColor);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'handModeVisible',
        FFAppState().HandModeVisible);
    updateListOfMyDevice1Field(FFAppState().selectedDeviceId, 'progModeVisible',
        FFAppState().ProgModeVisible);
  }
}
