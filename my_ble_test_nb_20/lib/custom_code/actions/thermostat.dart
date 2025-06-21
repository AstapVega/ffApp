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

import 'ble_custom_action.dart';

import 'dart:async';
import 'dart:io' show Platform;

import 'dart:math'; // Подключаем библиотеку для математических операций

/*
================================================================================
🔥 СУПЕР БАГ FLUTTERFLOW 🔥
================================================================================
📌 **Что случилось?**
- Изначально переменная `heatIconVisible` была **`double`**.
- Ты решил, что она должна быть **`bool`**, и поменял её тип в структуре `MyDeviceStruct`.
- FlutterFlow **не пересоздал структуру правильно** и продолжил видеть `heatIconVisible` как `double`, даже после смены типа.
- При этом **никакого предупреждения или ошибки не было!** Код просто начал вести себя странно.

📌 **Как проявился баг?**
- В `FFAppState()` всё выглядело нормально, но при чтении переменной использовалось **старое закэшированное значение**.
- `heatIconVisible` в некоторых местах работало как `double`, а в других — как `bool`, создавая хаос.
- Любые обновления структуры внутри FlutterFlow **не помогали**, потому что он тянул старые данные.

📌 **Как пофиксили?**
✅ **НЕ МЕНЯЕМ ТИП УЖЕ СОЗДАННЫХ ПОЛЕЙ В FLUTTERFLOW!**
✅ Вместо удаления старого поля, просто добавили **новую переменную `heatIconVisibleForList`** (типа `bool`).
✅ Старое поле **оставили без изменений**, но больше его не трогаем.

📌 **Главный урок!**
⚠ **Нельзя менять структуру данных в FlutterFlow на лету!**
⚠ **Если ошибся с типом — просто добавь новую переменную, а старую игнорируй.**
⚠ **FlutterFlow не умеет пересоздавать структуры, и если ты что-то удалил/поменял, могут остаться "призрачные" данные в кэше.**
================================================================================
*/

// Глобальные переменные
double setupTemp = 26.0; // Целевая температура
double currentTemp = 25.5; // Текущая температура

// Отдельные флаги для каждого состояния реле
bool lastHeatOnState = false;
bool lastHeatOffState = false;

Future thermostat() async {
  // Обновляем значения устройства

  //if ((FFAppState().ListOfMyDevice1.isNotEmpty) &
  //    (FFAppState().selectedDeviceId != "")) {

  if ((FFAppState().ListOfMyDevice1.isNotEmpty))
  // (FFAppState().selectedDeviceId != ""))
  {
    FFAppState().TempereSetHigthByte = readListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'tempereSetHigthByte');
    FFAppState().TempereSetLowByte = readListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'tempereSetLowByte');

    setupTemp = combineToFloat(
        FFAppState().TempereSetHigthByte, FFAppState().TempereSetLowByte);

    FFAppState().tempereReadHighByteString = readListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'tempereReadHighByteString');
    FFAppState().tempereReadLowByteString = readListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'tempereReadLowByteString');

//преобразование STtring в INT
    FFAppState().TempereReadHigthByte =
        IntFromString(FFAppState().tempereReadHighByteString);
    FFAppState().TempereReadLowByte =
        IntFromString(FFAppState().tempereReadLowByteString);

    currentTemp = combineToFloat(
        FFAppState().TempereReadHigthByte, FFAppState().TempereReadLowByte);

    // Проверяем тип гистерезиса
    if (readListOfMyDevice1Field(
            FFAppState().selectedDeviceId, 'deviceHysteresis') ==
        '0.5') {
      // Верхнее плечо (включение)
      if ((setupTemp - currentTemp) >= 0.5 && !lastHeatOnState) {
        FFAppState().HeatIconVisible = true;

        updateListOfMyDevice1Field(FFAppState().selectedDeviceId,
            'heatIconVisibleForList', FFAppState().HeatIconVisible);
        print('Реле включено (симметрично, верх).');

        lastHeatOnState = true; // Запоминаем, что реле уже включено
        lastHeatOffState = false; // Сбрасываем противоположный флаг
      }

      // Нижнее плечо (выключение)
      if ((currentTemp - setupTemp) >= 0.5 && !lastHeatOffState) {
        FFAppState().HeatIconVisible = false;

        updateListOfMyDevice1Field(FFAppState().selectedDeviceId,
            'heatIconVisibleForList', FFAppState().HeatIconVisible);
        print('Реле выключено (симметрично, низ).');

        lastHeatOffState = true; // Запоминаем, что реле уже выключено
        lastHeatOnState = false; // Сбрасываем противоположный флаг
      }
    } else if (readListOfMyDevice1Field(
            FFAppState().selectedDeviceId, 'deviceHysteresis') ==
        '1.0') {
      // Верхнее плечо (включение)
      if ((setupTemp - currentTemp) >= 0.5 && !lastHeatOnState) {
        FFAppState().HeatIconVisible = true;

        updateListOfMyDevice1Field(FFAppState().selectedDeviceId,
            'heatIconVisibleForList', FFAppState().HeatIconVisible);
        print('Реле включено (асимметрично, верх).');

        lastHeatOnState = true; // Запоминаем, что реле уже включено
        lastHeatOffState = false;
      }

      // Нижнее плечо (выключение)
      if ((currentTemp - setupTemp) >= 1.0 && !lastHeatOffState) {
        FFAppState().HeatIconVisible = false;

        updateListOfMyDevice1Field(
            FFAppState().selectedDeviceId,
            'heatIconVisibleForList',
            FFAppState()
                .HeatIconVisible); // вот оно конченная перменная heatIconVisible doble,  изначально..пришлось отсавить
        //и добавить heatIconVisibleForList типа bool  снизу структуры!! нельзя трогать структуру созданную
        print('Реле выключено (асимметрично, низ).'); // в флатер фло !!

        lastHeatOffState = true; // Запоминаем, что реле уже выключено
        lastHeatOnState = false;
      }
    }
  }
}
