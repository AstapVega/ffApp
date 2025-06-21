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

Future processSliderValue(double data) async {
  // Add your function code here!

  //FFAppState().NewDataToWrite =
  //   0; //  очищаем старый флаг готовности если быстро двиагется слайдер или кнопки
  // что то вроде антидрбезка

  data = roundToNearestHalf(data); //округляем сырые данные до ближайшег 0,5
  data = data + 6; //поправка с показаниями бегунка слайдера

  setup_temp = convertToTemperatureInt(
      data); // преобразуем float  в  intt 995  формат , 99,5 градуса  два байта

  convertTemperature(
      setup_temp); //раскладываем обратно значение на формат старший байт + младший (деястые доли)

  FFAppState().TempereSetHigthByte = tempWhole;
  FFAppState().TempereSetLowByte = tempHalf;

  updateListOfMyDevice1Field(
      FFAppState()
          .selectedDeviceId, //обновили значение в ЛИСТ ВЬЮ данного девайса
      'tempereSetHigthByte',
      FFAppState().TempereSetHigthByte);
  updateListOfMyDevice1Field(
      FFAppState()
          .selectedDeviceId, //обновили значение в ЛИСТ ВЬЮ данного девайса
      'tempereSetLowByte',
      FFAppState().TempereSetLowByte);

// буферизируем  значение  текуще для вомжности вывода в индикатор внутри выбранного девайса

  dataToWrite[0] = FFAppState().TempereSetHigthByte; //записали в буфер для BLE

  dataToWrite[1] = FFAppState().TempereSetLowByte; //записали в буфер для BLE
  // dataToWrite[2] = tempHalf; //записали в буфер для BLE

  FFAppState().TempereSetFloat = combineToFloat(
      FFAppState().TempereSetHigthByte - 6, FFAppState().TempereSetLowByte);

  FFAppState().NewDataToWrite = 1; //  данные ГОТОВЫ для дальнейшей ЗАПИСИ
}
