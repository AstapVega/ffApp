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

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import 'ble_custom_action.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'dart:async';
import 'dart:io' show Platform;

///*

// -----------модификация кода без автоподключения---------------------

// ЧИСТАЯ СЕКЦИЯ БЕЗ АВТОПОДКЛЮЧЕНИЯ И БЛОКИРОВКИ  нажатия  Но с проверкой на статус связи

/*

  if (my_devise != null) {
    if ((FFAppState().selectedDeviceId == my_devise.id.toString()) &&
        (deviceStatus == 1)) {
      if (mode == FFAppConstants.ValiuePlusComand) {
        // Читаем текущие два байта температуры для данного девайса в текущем ЛИСТ ВЬЮ

        tempWhole = readListOfMyDevice1Field(
            FFAppState().selectedDeviceId, 'tempereSetHigthByte');

        tempHalf = readListOfMyDevice1Field(
            FFAppState().selectedDeviceId, 'tempereSetLowByte');

        setup_temp = combineTemperature(
            tempWhole, tempHalf); //переводим два байта в  int setup_temp

        setup_temp = setup_temp + 5; // увеличиваем температуру задания на 0,5

        convertTemperature(
            setup_temp); //раскладываем обратно значение на формат старший байт + младший (деястые доли)

// буферизируем  значение  текуще для вомжности вывода в индикатор внутри выбранного девайса

        FFAppState().TempereSetHigthByte = tempWhole;
        FFAppState().TempereSetLowByte = tempHalf;

        if ((FFAppState().TempereSetFloat) >= (40.0 - 6)) {
          FFAppState().TempereSetFloat = (40.0 - 6);
          FFAppState().TempereSetHigthByte = 40;
          FFAppState().TempereSetLowByte = 0;

          tempWhole = 40;
          tempHalf = 0;
          setup_temp = 400;
        }

        updateListOfMyDevice1Field(
            FFAppState()
                .selectedDeviceId, //обновили значение в ЛИСТ ВЬЮ данного девайса
            'tempereSetHigthByte',
            tempWhole);
        updateListOfMyDevice1Field(
            FFAppState()
                .selectedDeviceId, //обновили значение в ЛИСТ ВЬЮ данного девайса
            'tempereSetLowByte',
            tempHalf);

        dataToWrite[0] =
            FFAppState().TempereSetHigthByte; //записали в буфер для BLE
        dataToWrite[1] =
            FFAppState().TempereSetLowByte; //записали в буфер для BLE

//синхронизация с кнопок на  самом девайсе + и - и кнопок + и - на выбраном активном девайсе ВНУТРИ НЕГО  в приложении согласно активному ID

        // обратно преобразовываем в чистый флоат для передачи значения с целью синхронизаации с движением бегунка слйадера!!
        FFAppState().TempereSetFloat = combineToFloat(
            FFAppState().TempereSetHigthByte - 6,
            FFAppState().TempereSetLowByte);

        FFAppState().NewDataToWrite = 1; //  данные ГОТОВЫ для дальнейшей ЗАПИСИ
      }

      if (mode == FFAppConstants.ValiueMinusComand) {
        // Читаем текущие два байта температуры для данного девайса в текущем ЛИСТ ВЬЮ

        tempWhole = readListOfMyDevice1Field(
            FFAppState().selectedDeviceId, 'tempereSetHigthByte');

        tempHalf = readListOfMyDevice1Field(
            FFAppState().selectedDeviceId, 'tempereSetLowByte');

        setup_temp = combineTemperature(
            tempWhole, tempHalf); //переводим два байта в  int setup_temp

        setup_temp = setup_temp - 5; // увеличиваем температуру задания на 0,5

        convertTemperature(
            setup_temp); //раскладываем обратно значение на формат старший байт + младший (деястые доли)

// буферизируем  значение  текуще для вомжности вывода в индикатор внутри выбранного девайса

        FFAppState().TempereSetHigthByte = tempWhole;
        FFAppState().TempereSetLowByte = tempHalf;

        if ((FFAppState().TempereSetFloat) <= (5.0 - 6)) {
          FFAppState().TempereSetFloat = (5.0 - 6);
          FFAppState().TempereSetHigthByte = 5;
          FFAppState().TempereSetLowByte = 0;
          tempWhole = 5;
          tempHalf = 0;
          setup_temp = 50;
        }

        updateListOfMyDevice1Field(
            FFAppState()
                .selectedDeviceId, //обновили значение в ЛИСТ ВЬЮ данного девайса
            'tempereSetHigthByte',
            tempWhole);
        updateListOfMyDevice1Field(
            FFAppState()
                .selectedDeviceId, //обновили значение в ЛИСТ ВЬЮ данного девайса
            'tempereSetLowByte',
            tempHalf);

        dataToWrite[0] =
            FFAppState().TempereSetHigthByte; //записали в буфер для BLE
        dataToWrite[1] =
            FFAppState().TempereSetLowByte; //записали в буфер для BLE

//синхронизация с кнопок на  самом девайсе + и - и кнопок + и - на выбраном активном девайсе ВНУТРИ НЕГО  в приложении согласно активному ID

        // обратно преобразовываем в чистый флоат для передачи значения с целью синхронизаации с движением бегунка слйадера!!
        FFAppState().TempereSetFloat = combineToFloat(
            FFAppState().TempereSetHigthByte - 6,
            FFAppState().TempereSetLowByte);

        FFAppState().NewDataToWrite =
            1; //  БЕЗ  ЗАПИСИ ЕСЛИ OFFLINE   - только имитация интерфейса
      }
    } else {
      if (mode == FFAppConstants.ValiuePlusComand) {
        // Читаем текущие два байта температуры для данного девайса в текущем ЛИСТ ВЬЮ

        tempWhole = readListOfMyDevice1Field(
            FFAppState().selectedDeviceId, 'tempereSetHigthByte');

        tempHalf = readListOfMyDevice1Field(
            FFAppState().selectedDeviceId, 'tempereSetLowByte');

        setup_temp = combineTemperature(
            tempWhole, tempHalf); //переводим два байта в  int setup_temp

        setup_temp = setup_temp + 5; // увеличиваем температуру задания на 0,5

        convertTemperature(
            setup_temp); //раскладываем обратно значение на формат старший байт + младший (деястые доли)

// буферизируем  значение  текуще для вомжности вывода в индикатор внутри выбранного девайса

        FFAppState().TempereSetHigthByte = tempWhole;
        FFAppState().TempereSetLowByte = tempHalf;

        if ((FFAppState().TempereSetFloat) >= (40.0 - 6)) {
          FFAppState().TempereSetFloat = (40.0 - 6);
          FFAppState().TempereSetHigthByte = 40;
          FFAppState().TempereSetLowByte = 0;

          tempWhole = 40;
          tempHalf = 0;
          setup_temp = 400;
        }

        updateListOfMyDevice1Field(
            FFAppState()
                .selectedDeviceId, //обновили значение в ЛИСТ ВЬЮ данного девайса
            'tempereSetHigthByte',
            tempWhole);
        updateListOfMyDevice1Field(
            FFAppState()
                .selectedDeviceId, //обновили значение в ЛИСТ ВЬЮ данного девайса
            'tempereSetLowByte',
            tempHalf);

        dataToWrite[0] =
            FFAppState().TempereSetHigthByte; //записали в буфер для BLE
        dataToWrite[1] =
            FFAppState().TempereSetLowByte; //записали в буфер для BLE

//синхронизация с кнопок на  самом девайсе + и - и кнопок + и - на выбраном активном девайсе ВНУТРИ НЕГО  в приложении согласно активному ID

        // обратно преобразовываем в чистый флоат для передачи значения с целью синхронизаации с движением бегунка слйадера!!
        FFAppState().TempereSetFloat = combineToFloat(
            FFAppState().TempereSetHigthByte - 6,
            FFAppState().TempereSetLowByte);

        FFAppState().NewDataToWrite =
            0; //  БЕЗ  ЗАПИСИ ЕСЛИ OFFLINE   - только имитация интерфейса
      }

      if (mode == FFAppConstants.ValiueMinusComand) {
        // Читаем текущие два байта температуры для данного девайса в текущем ЛИСТ ВЬЮ

        tempWhole = readListOfMyDevice1Field(
            FFAppState().selectedDeviceId, 'tempereSetHigthByte');

        tempHalf = readListOfMyDevice1Field(
            FFAppState().selectedDeviceId, 'tempereSetLowByte');

        setup_temp = combineTemperature(
            tempWhole, tempHalf); //переводим два байта в  int setup_temp

        setup_temp = setup_temp - 5; // увеличиваем температуру задания на 0,5

        convertTemperature(
            setup_temp); //раскладываем обратно значение на формат старший байт + младший (деястые доли)

// буферизируем  значение  текуще для вомжности вывода в индикатор внутри выбранного девайса

        FFAppState().TempereSetHigthByte = tempWhole;
        FFAppState().TempereSetLowByte = tempHalf;

        if ((FFAppState().TempereSetFloat) <= (5.0 - 6)) {
          FFAppState().TempereSetFloat = (5.0 - 6);
          FFAppState().TempereSetHigthByte = 5;
          FFAppState().TempereSetLowByte = 0;
          tempWhole = 5;
          tempHalf = 0;
          setup_temp = 50;
        }

        updateListOfMyDevice1Field(
            FFAppState()
                .selectedDeviceId, //обновили значение в ЛИСТ ВЬЮ данного девайса
            'tempereSetHigthByte',
            tempWhole);
        updateListOfMyDevice1Field(
            FFAppState()
                .selectedDeviceId, //обновили значение в ЛИСТ ВЬЮ данного девайса
            'tempereSetLowByte',
            tempHalf);

        dataToWrite[0] =
            FFAppState().TempereSetHigthByte; //записали в буфер для BLE
        dataToWrite[1] =
            FFAppState().TempereSetLowByte; //записали в буфер для BLE

//синхронизация с кнопок на  самом девайсе + и - и кнопок + и - на выбраном активном девайсе ВНУТРИ НЕГО  в приложении согласно активному ID

        // обратно преобразовываем в чистый флоат для передачи значения с целью синхронизаации с движением бегунка слйадера!!
        FFAppState().TempereSetFloat = combineToFloat(
            FFAppState().TempereSetHigthByte - 6,
            FFAppState().TempereSetLowByte);

        FFAppState().NewDataToWrite =
            0; //  БЕЗ  ЗАПИСИ ЕСЛИ OFFLINE   - только имитация интерфейса
      }
    }
  } else {
    if (mode == FFAppConstants.ValiuePlusComand) {
      // Читаем текущие два байта температуры для данного девайса в текущем ЛИСТ ВЬЮ

      tempWhole = readListOfMyDevice1Field(
          FFAppState().selectedDeviceId, 'tempereSetHigthByte');

      tempHalf = readListOfMyDevice1Field(
          FFAppState().selectedDeviceId, 'tempereSetLowByte');

      setup_temp = combineTemperature(
          tempWhole, tempHalf); //переводим два байта в  int setup_temp

      setup_temp = setup_temp + 5; // увеличиваем температуру задания на 0,5

      convertTemperature(
          setup_temp); //раскладываем обратно значение на формат старший байт + младший (деястые доли)

// буферизируем  значение  текуще для вомжности вывода в индикатор внутри выбранного девайса

      FFAppState().TempereSetHigthByte = tempWhole;
      FFAppState().TempereSetLowByte = tempHalf;

      if ((FFAppState().TempereSetFloat) >= (40.0 - 6)) {
        FFAppState().TempereSetFloat = (40.0 - 6);
        FFAppState().TempereSetHigthByte = 40;
        FFAppState().TempereSetLowByte = 0;

        tempWhole = 40;
        tempHalf = 0;
        setup_temp = 400;
      }

      updateListOfMyDevice1Field(
          FFAppState()
              .selectedDeviceId, //обновили значение в ЛИСТ ВЬЮ данного девайса
          'tempereSetHigthByte',
          tempWhole);
      updateListOfMyDevice1Field(
          FFAppState()
              .selectedDeviceId, //обновили значение в ЛИСТ ВЬЮ данного девайса
          'tempereSetLowByte',
          tempHalf);

      dataToWrite[0] =
          FFAppState().TempereSetHigthByte; //записали в буфер для BLE
      dataToWrite[1] =
          FFAppState().TempereSetLowByte; //записали в буфер для BLE

//синхронизация с кнопок на  самом девайсе + и - и кнопок + и - на выбраном активном девайсе ВНУТРИ НЕГО  в приложении согласно активному ID

      // обратно преобразовываем в чистый флоат для передачи значения с целью синхронизаации с движением бегунка слйадера!!
      FFAppState().TempereSetFloat = combineToFloat(
          FFAppState().TempereSetHigthByte - 6, FFAppState().TempereSetLowByte);

      FFAppState().NewDataToWrite =
          0; //  БЕЗ  ЗАПИСИ ЕСЛИ OFFLINE   - только имитация интерфейса
    }

    if (mode == FFAppConstants.ValiueMinusComand) {
      // Читаем текущие два байта температуры для данного девайса в текущем ЛИСТ ВЬЮ

      tempWhole = readListOfMyDevice1Field(
          FFAppState().selectedDeviceId, 'tempereSetHigthByte');

      tempHalf = readListOfMyDevice1Field(
          FFAppState().selectedDeviceId, 'tempereSetLowByte');

      setup_temp = combineTemperature(
          tempWhole, tempHalf); //переводим два байта в  int setup_temp

      setup_temp = setup_temp - 5; // увеличиваем температуру задания на 0,5

      convertTemperature(
          setup_temp); //раскладываем обратно значение на формат старший байт + младший (деястые доли)

// буферизируем  значение  текуще для вомжности вывода в индикатор внутри выбранного девайса

      FFAppState().TempereSetHigthByte = tempWhole;
      FFAppState().TempereSetLowByte = tempHalf;

      if ((FFAppState().TempereSetFloat) <= (5.0 - 6)) {
        FFAppState().TempereSetFloat = (5.0 - 6);
        FFAppState().TempereSetHigthByte = 5;
        FFAppState().TempereSetLowByte = 0;
        tempWhole = 5;
        tempHalf = 0;
        setup_temp = 50;
      }

      updateListOfMyDevice1Field(
          FFAppState()
              .selectedDeviceId, //обновили значение в ЛИСТ ВЬЮ данного девайса
          'tempereSetHigthByte',
          tempWhole);
      updateListOfMyDevice1Field(
          FFAppState()
              .selectedDeviceId, //обновили значение в ЛИСТ ВЬЮ данного девайса
          'tempereSetLowByte',
          tempHalf);

      dataToWrite[0] =
          FFAppState().TempereSetHigthByte; //записали в буфер для BLE
      dataToWrite[1] =
          FFAppState().TempereSetLowByte; //записали в буфер для BLE

//синхронизация с кнопок на  самом девайсе + и - и кнопок + и - на выбраном активном девайсе ВНУТРИ НЕГО  в приложении согласно активному ID

      // обратно преобразовываем в чистый флоат для передачи значения с целью синхронизаации с движением бегунка слйадера!!
      FFAppState().TempereSetFloat = combineToFloat(
          FFAppState().TempereSetHigthByte - 6, FFAppState().TempereSetLowByte);

      FFAppState().NewDataToWrite =
          0; //  БЕЗ  ЗАПИСИ ЕСЛИ OFFLINE   - только имитация интерфейса
    }
  }

  connect_status_busy ==
      false; // ЗАПРЕЩАЕМ обновлять индикатор сосстояния во всем спсике ЛИСТ ВЬЮ
}

*/

//------------ПЕВОНАЧАЛЬНЫЙ КОД --------------------------------

Future buttomCustomAction(
  BuildContext context,
  int mode,
) async {
  // Проверяем подключено ли устройство и совпадает ли его ID с выбранным

  FFAppState().NewDataToWrite =
      0; //  очищаем старый флаг готовности если быстро двиагется слайдер или кнопки
  // что то вроде антидрбезка

  connect_status_busy ==
      true; // ЗАПРЕЩАЕМ обновлять индикатор сосстояния во всем спсике ЛИСТ ВЬЮ

  synchronizeBluetoothBuffers(); // синхронизация буферов

//проверка состоятояния

  if (my_devise == null) {
    scanResultDevice = findDeviceById(
        FFAppState().selectedDeviceId, ALLbluetoothDevicesBuffer);
    my_devise = scanResultDevice.device;
  }

  //print("ID устройства (my_devise): ${my_devise.id.toString()}");
  // print(
  //   "ID устройства (FFAppState().selectedDeviceId): ${FFAppState().selectedDeviceId.toString()}");

  // print(" STOP  ");

  int deviceStatus = readListOfMyDevice1Field(
      FFAppState().selectedDeviceId, 'statusConnectState');

  //int deviceStatus = await checkDeviceConnectionStatus(
  //  my_devise); // проверка статуса подключения после подключения

/*
   if ((device_connect_on_servise == true) &&
      (FFAppState().selectedDeviceId == my_devise.id.toString()) &&
      (device_connect_status == 1)) {
*/

  if ((FFAppState().selectedDeviceId == my_devise.id.toString()) &&
      (deviceStatus == 1)) {
    if (mode == FFAppConstants.ValiuePlusComand) {
      // Читаем текущие два байта температуры для данного девайса в текущем ЛИСТ ВЬЮ

      tempWhole = readListOfMyDevice1Field(
          FFAppState().selectedDeviceId, 'tempereSetHigthByte');

      tempHalf = readListOfMyDevice1Field(
          FFAppState().selectedDeviceId, 'tempereSetLowByte');

      setup_temp = combineTemperature(
          tempWhole, tempHalf); //переводим два байта в  int setup_temp

      setup_temp = setup_temp + 5; // увеличиваем температуру задания на 0,5

      convertTemperature(
          setup_temp); //раскладываем обратно значение на формат старший байт + младший (деястые доли)

// буферизируем  значение  текуще для вомжности вывода в индикатор внутри выбранного девайса

      FFAppState().TempereSetHigthByte = tempWhole;
      FFAppState().TempereSetLowByte = tempHalf;

      if ((FFAppState().TempereSetFloat) >= (40.0 - 6)) {
        FFAppState().TempereSetFloat = (40.0 - 6);
        FFAppState().TempereSetHigthByte = 40;
        FFAppState().TempereSetLowByte = 0;

        tempWhole = 40;
        tempHalf = 0;
        setup_temp = 400;
      }

      updateListOfMyDevice1Field(
          FFAppState()
              .selectedDeviceId, //обновили значение в ЛИСТ ВЬЮ данного девайса
          'tempereSetHigthByte',
          tempWhole);
      updateListOfMyDevice1Field(
          FFAppState()
              .selectedDeviceId, //обновили значение в ЛИСТ ВЬЮ данного девайса
          'tempereSetLowByte',
          tempHalf);

      dataToWrite[0] =
          FFAppState().TempereSetHigthByte; //записали в буфер для BLE
      dataToWrite[1] =
          FFAppState().TempereSetLowByte; //записали в буфер для BLE

//синхронизация с кнопок на  самом девайсе + и - и кнопок + и - на выбраном активном девайсе ВНУТРИ НЕГО  в приложении согласно активному ID

      // обратно преобразовываем в чистый флоат для передачи значения с целью синхронизаации с движением бегунка слйадера!!
      FFAppState().TempereSetFloat = combineToFloat(
          FFAppState().TempereSetHigthByte - 6, FFAppState().TempereSetLowByte);

      FFAppState().NewDataToWrite = 1; //  данные ГОТОВЫ для дальнейшей ЗАПИСИ
    }

    if (mode == FFAppConstants.ValiueMinusComand) {
      // Читаем текущие два байта температуры для данного девайса в текущем ЛИСТ ВЬЮ

      tempWhole = readListOfMyDevice1Field(
          FFAppState().selectedDeviceId, 'tempereSetHigthByte');

      tempHalf = readListOfMyDevice1Field(
          FFAppState().selectedDeviceId, 'tempereSetLowByte');

      setup_temp = combineTemperature(
          tempWhole, tempHalf); //переводим два байта в  int setup_temp

      setup_temp = setup_temp - 5; // увеличиваем температуру задания на 0,5

      convertTemperature(
          setup_temp); //раскладываем обратно значение на формат старший байт + младший (деястые доли)

// буферизируем  значение  текуще для вомжности вывода в индикатор внутри выбранного девайса

      FFAppState().TempereSetHigthByte = tempWhole;
      FFAppState().TempereSetLowByte = tempHalf;

      if ((FFAppState().TempereSetFloat) <= (5.0 - 6)) {
        FFAppState().TempereSetFloat = (5.0 - 6);
        FFAppState().TempereSetHigthByte = 5;
        FFAppState().TempereSetLowByte = 0;
        tempWhole = 5;
        tempHalf = 0;
        setup_temp = 50;
      }

      updateListOfMyDevice1Field(
          FFAppState()
              .selectedDeviceId, //обновили значение в ЛИСТ ВЬЮ данного девайса
          'tempereSetHigthByte',
          tempWhole);
      updateListOfMyDevice1Field(
          FFAppState()
              .selectedDeviceId, //обновили значение в ЛИСТ ВЬЮ данного девайса
          'tempereSetLowByte',
          tempHalf);

      dataToWrite[0] =
          FFAppState().TempereSetHigthByte; //записали в буфер для BLE
      dataToWrite[1] =
          FFAppState().TempereSetLowByte; //записали в буфер для BLE

//синхронизация с кнопок на  самом девайсе + и - и кнопок + и - на выбраном активном девайсе ВНУТРИ НЕГО  в приложении согласно активному ID

      // обратно преобразовываем в чистый флоат для передачи значения с целью синхронизаации с движением бегунка слйадера!!
      FFAppState().TempereSetFloat = combineToFloat(
          FFAppState().TempereSetHigthByte - 6, FFAppState().TempereSetLowByte);

      FFAppState().NewDataToWrite = 1; //  данные ГОТОВЫ для дальнейшей ЗАПИСИ
    }
  } else {
    print('Устройство не подключено или не совпадает с выбранным ID');

    connect_status_busy ==
        true; // ЗАПРЕЩАЕМ обновлять индикатор сосстояния во всем спсике ЛИСТ ВЬЮ

// для spp режима подключения
    //   await connectAndProcessDevice(FFAppState().selectedDeviceId);

    synchronizeBluetoothBuffers(); // синхронизация буферов

//----------------  АВТОДИСКОНЕКТ СТАРОГО ДЕВАЙСА + ПОДКЛЮЧЕНИЕ ТЕКУЩЕГО -----------------------

// ВНИМАНИЕ!!! РАБОТАЕМ ЧЕРЕЗ ГЛОБАЛЬНЫЕ ПЕРЕМЕННЫЕ  my_devise и my_devise2
// реальное подключение и проверка статусоидет через главный аккумулятор my_devise !!!

    if (my_devise2 != null && my_devise2 != 0) {
      my_devise = my_devise2; // предыдущий девайс
    }

    if (my_devise2 != null) {
      device_connect_status = await checkDeviceConnectionStatus(
          my_devise2); // проверка статуса подключения после подключения

      if (device_connect_status == 1) //если подключено - то делаем отключение
      {
        device_connect_on_servise == false; //чтение не готово
        my_devise = my_devise2; //возврат для отключения

        await WorkWithTimeout(
          //рвем выбранное соединение
          () => disconnectDevice_repit(maxAttempts: 20),
          timeoutMs: 10000,
          // () => disconnectDevice_repit(maxAttempts: 5),
          //  timeoutMs: 10000,
        );
      }
    }

    if (my_devise2 != null && my_devise2 != 0) {
      device_connect_status = await checkDeviceConnectionStatus(
          my_devise2); // проверка статуса подключения после отключения

      if (device_connect_status ==
          2) // проверяем отключилось ли старое устройтсво??
      {
//  обновляем ID для нового девайса
        scanResultDevice = findDeviceById(
            FFAppState().selectedDeviceId, ALLbluetoothDevicesBuffer);
        my_devise = getDeviceFromScanResult(scanResultDevice);

        device_connect_status = await checkDeviceConnectionStatus(
            my_devise); // проверка статуса подключения после подключения

        my_devise2 =
            my_devise; //обновялем буфер для следующей операции - сохраняем ID последнего подключенного девайсай

//Подключаемся к новому девайсу
        //   if (device_connect_status ==
        //    2) // проверяем контрольно отключилось ли старое устройтсво??
        // {
        await WorkWithTimeout(
          () => connectAndProcessDevice(FFAppState().selectedDeviceId),
          timeoutMs: 10000,
        ); // плюс таймаут на антизависание  при подключении
        //  }

        device_connect_on_servise == true; //чтение готово
      }

      device_connect_status = await checkDeviceConnectionStatus(
          my_devise); // проверка статуса подключения после подключения
    } else //значит самое первое подключение
    {
      device_connect_status = await checkDeviceConnectionStatus(
          my_devise); // контрольная проверка статуса подключения после подключения

//Подключаемся к новому девайсу
      if (device_connect_status ==
          2) // проверяем отключилось ли старое устройтсво??
      {
        await WorkWithTimeout(
          () => connectAndProcessDevice(FFAppState().selectedDeviceId),
          timeoutMs: 10000,
        ); // плюс таймаут на антизависание  при подключении
      }

      my_devise2 =
          my_devise; //обновялем буфер для следующей операции - сохраняем ID последнего подключенного девайсай

      device_connect_status = await checkDeviceConnectionStatus(
          my_devise); // контрольная проверка статуса подключения после подключения
    }

//----------------  END OFF  АВТОДИСКОНЕКТ СТАРОГО ДЕВАЙСА + ПОДКЛЮЧЕНИЕ ТЕКУЩЕГО -----------------------

/*
    if (my_devise2 != null && my_devise2 != 0) {
      my_devise = my_devise2; // предыдущий девайс
    }

    if ((my_devise != null) || (my_devise2 != null)) {
      device_connect_status = await checkDeviceConnectionStatus(
          my_devise); // проверка статуса подключения после подключения

      if (device_connect_status ==
          1) //если нет статуса коннект то делаем полное подключени
      {
        await WorkWithTimeout(
          //рвем выбранное соединение
          () => disconnectDevice_repit(maxAttempts: 10),
          timeoutMs: 10000,
        );
      }
    }

    //

    // СЧИТЫВАЕМ ID выбранного девайса и подключаемся  кнему

    scanResultDevice = findDeviceById(
        FFAppState().selectedDeviceId, ALLbluetoothDevicesBuffer);
    my_devise = getDeviceFromScanResult(scanResultDevice);

    device_connect_status = await checkDeviceConnectionStatus(
        my_devise); // проверка статуса подключения после подключения

    my_devise2 = my_devise;

    if (device_connect_status ==
        2) //если нет статуса коннект то делаем полное подключени
    {
      await WorkWithTimeout(
        () => connectAndProcessDevice(FFAppState().selectedDeviceId),
        timeoutMs: 10000,
      ); // плюс таймаут на антизависание  при подключении
    }

    */

    ///TEST
    ///

    connect_status_busy ==
        false; // разрешаем обновлять индикатор сосстояния во всем спсике ЛИСТ ВЬЮ
  }

  connect_status_busy ==
      false; // ЗАПРЕЩАЕМ обновлять индикатор сосстояния во всем спсике ЛИСТ ВЬЮ
}
