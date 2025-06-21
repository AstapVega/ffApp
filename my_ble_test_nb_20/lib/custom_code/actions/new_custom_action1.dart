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

import 'dart:convert';

import 'ble_custom_action.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';

Future newCustomAction1(
  BuildContext context,
  int mode,
) async {
  // Add your function code here!

  if (mode == FFAppConstants.scanBLE) {
    // если режим одиночного сканирования
    //идин раз проходит режим сканирвоани ядо момета повтроного взводоа флага FFAppState().ScanSinglMode=1

    debugPrint("scan_mode");

    if (kIsWeb) {
      print("Web");
      print("Web");

      await Future.delayed(const Duration(milliseconds: 3000));

      FFAppState().Scaner = 1; // эмитация того что сканирвоание завершено !!
      bleScanDemo();
    }

    if (Platform.isAndroid) {
      // Code for Android
      print("Running on Android");
      await scanForDevices_v5("VEGA", 2, 15,
          true); // маска для фильтрации по "VEGA-LTC " и три цифры после пробела , true - с фильтрацией

// ДЕМО РЕЖИМ

      //    bleScanDemo();
      //    FFAppState().Scaner = 1; // эмитация того что сканирвоание завершено !!

// окончание ДЕМО РЕЖИМА

      synchronizeBluetoothBuffers(); // синхронизация буферов
      await updateGlobalDeviceIds();
    }

    if (Platform.isIOS) {
      // Code for iOS
      print("Running on iOS");
      await scanForDevices_v5("VEGA", 2, 10,
          true); // маска для фильтрации по "VEGA-LTC " и три цифры после пробела , true - с фильтрацией

      synchronizeBluetoothBuffers(); // синхронизация буферов
      await updateGlobalDeviceIds();
    }
  }

  if (mode == FFAppConstants.connectBLE) {
    synchronizeBluetoothBuffers(); // синхронизация буферов

    scanResultDevice = findDeviceById(
        FFAppState().selectedDeviceId, ALLbluetoothDevicesBuffer);
    my_devise = getDeviceFromScanResult(scanResultDevice);

    device_connect_status = await checkDeviceConnectionStatus(
        my_devise); // проверка статуса подключения после подключения

    if (device_connect_status !=
        1) //если нет статуса коннект то делаем полное подключени
    {
      await WorkWithTimeout(
        () => connectAndProcessDevice(FFAppState().selectedDeviceId),
        timeoutMs: 10000,
      ); // плюс таймаут на антизависание  при подключении
    }
  }

  if (mode == FFAppConstants.reconnectBLE) {
    if (device_connect_on_servise == true &&
        FFAppState().selectedDeviceId == my_devise.id.toString()) {
      // Если подключенное устройство соответствует выбранному, выполняем действия

//ничего не делаем  - устойтсво уже подключено
    } else {
      //иначе - подключаемся заново к выбранному устройству

      await WorkWithTimeout(
        () => disconnectDevice_repit(
            maxAttempts: 5), // контрольный дисконект последнего соединения
        timeoutMs: 1000,
      );

      // подключаемся заново к выбранному устройству

      await WorkWithTimeout(
        () => connectAndProcessDevice(FFAppState().selectedDeviceId),
        timeoutMs: 6000,
      ); // плюс таймаут на антизависание  при подключении
    }
  }

  if (mode == FFAppConstants.disconnectBLE) {
    debugPrint("disconnectBLE_mode");
    //connectToDeviceAndProcessSpecificService("50:54:7B:74:B8:BB", "ffe4");// тестовый вариант

    //обновляем наш my_devise
    scanResultDevice = await findDeviceById(
        FFAppState().selectedDeviceId, ALLbluetoothDevicesBuffer);
    my_devise = scanResultDevice.device;

    //анализ текущего соединения
    device_connect_status = await checkDeviceConnectionStatus(
        my_devise); // проверка статуса подключения

// если оно активно - дделаем дисконект

    if (device_connect_status == 1) {
      await WorkWithTimeout(
        //рвем выбранное соединение
        () => disconnectDevice_repit(maxAttempts: 6),
        timeoutMs: 8000,
      );
    }

    device_connect_status = await checkDeviceConnectionStatus(
        my_devise); // проверка статуса подключения после Diskonnect

    await processAllDevices(); // обновляем все статусы в ЛИСТ ВЬЮ
    await updateGlobalDeviceIdsV2();
    await updateGlobalDeviceIdsV3(); // Обновляем списки  активных устройствq

    debugPrint('STOP');

    // Вызов   функции оключения +  Тайм-аут в 6000 миллисекунд + автоповтор
  }

  if (mode == FFAppConstants.deviceInfo) {
    //буферизируем сигнатуру нужнодевайса по его ID
    //my_devise = getDeviceById(FFAppState().selectedDeviceId);

    // Отключаем устройство
    // await my_devise.disconnect();

    // выведи в консоль сигнатуру
    // выведи в консоль ID
  }

  if (mode == FFAppConstants.WriteDataToBle) {
    if (FFAppState().NewDataToWrite ==
        1) //если  данные ГОТОВЫ для дальнейшей ЗАПИСИ
    {
      FFAppState().NewDataToWrite =
          0; //  данные ГОТОВЫ для дальнейшей ЗАПИСИ  - сбрасываем

      connect_status_busy ==
          true; // ЗАПРЕЩАЕМ обновлять индикатор сосстояния во всем спсике ЛИСТ ВЬЮ

// расшариваем текущеее устройтсво на кнопку котрого нажимае в лист вью

      if (my_devise != null) {
        scanResultDevice = findDeviceById(
            FFAppState().selectedDeviceId, ALLbluetoothDevicesBuffer);
        my_devise = scanResultDevice.device;
      }

//получаем сервисы  текущего устройства на которое хоим отправить значение
      /*
      List<BluetoothService> services = await my_devise.discoverServices();
      // 4. Ищем нужные характеристики в сервисе fff0
      for (BluetoothService service in services) {
        if (service.uuid.toString() == 'fff0') {
          //print('Найден сервис fff0');
          await findCharacteristicsForService(service);
          break;
        }
      }
*/

      writeCharacteristic = getCharacteristicById(writeCharacteristicsStruct,
          idKeyWrite, FFAppState().selectedDeviceId);

      //await WorkWithTimeout(
      //  () => writeToCharacteristic(dataToWrite),
      //  timeoutMs: 4000,
      //);

      await writeToCharacteristic(dataToWrite);

      connect_status_busy ==
          false; // ЗАПРЕЩАЕМ обновлять индикатор сосстояния во всем спсике ЛИСТ ВЬЮ
    }
  }

  if (mode ==
      FFAppConstants
          .OnOffBleConect) // если нажата кнопка с цикличеким состоянием on/off
  {
    int val;

    if (my_devise == null) {
      scanResultDevice = findDeviceById(
          FFAppState().selectedDeviceId, ALLbluetoothDevicesBuffer);
      my_devise = scanResultDevice.device;
    }

    val = readListOfMyDevice1Field(
        FFAppState().selectedDeviceId, 'onOffKnobState');

    if (val > 1) {
      val = 0;
    }

    // val = 0; // ставим заглушку на режим  - ТОЛЬКО ОТКЛЮЧЕНИЕ

    if (val > 0) {
      //updateListOfMyDevice1Field(
      //  FFAppState().selectedDeviceId, 'onOffKnobValue', 'on');
      // - разрыв предыдущего соединения

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
            () => disconnectDevice_repit(maxAttempts: 10),
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

          // FFAppState().OnOffKnobValueBufer = 'on';

          await WorkWithTimeout(
            () => connectAndProcessDevice(FFAppState().selectedDeviceId),
            timeoutMs: 10000,
          ); // плюс таймаут на антизависание  при подключении
          //  }

          FFAppState().OnOffKnobValueBufer =
              'on'; // быстрая смена значка кроме фонового обновления
          //для недопущения старого "off" в течении 0,5 сек после рального соединения

          updateListOfMyDevice1Field(FFAppState().selectedDeviceId,
              'onOffKnobState', 0); // готово к отключению
          updateListOfMyDevice1Field(
              FFAppState().selectedDeviceId, 'onOffKnobValue', 'on');

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

        if (device_connect_status == 1) //если соединилось
        // то при следующем входе предлагать ДИСКОННЕКТ
        {
          val++;
          updateListOfMyDevice1Field(
              FFAppState().selectedDeviceId, 'onOffKnobState', val);
          // обновляем глобальную перменную статуса устрйотсва (его НАДПИСИ ) для отображения ВНТРИ ДЕВАЙСА
          FFAppState().OnOffKnobValueBufer =
              'on'; // быстрая смена значка кроме фонового обновления
          //для недопущения старого "off" в течении 0,5 сек после рального соединения

          updateListOfMyDevice1Field(FFAppState().selectedDeviceId,
              'onOffKnobState', 0); // готово к отключению
          updateListOfMyDevice1Field(
              FFAppState().selectedDeviceId, 'onOffKnobValue', 'on');
        }
      }

//----------------  END OFF  АВТОДИСКОНЕКТ СТАРОГО ДЕВАЙСА + ПОДКЛЮЧЕНИЕ ТЕКУЩЕГО -----------------------
    } else {
      scanResultDevice = findDeviceById(
          FFAppState().selectedDeviceId, ALLbluetoothDevicesBuffer);
      my_devise = getDeviceFromScanResult(scanResultDevice);

      device_connect_status = await checkDeviceConnectionStatus(
          my_devise); // проверка статуса подключения после подключения

      if (device_connect_status ==
          1) //если нет статуса коннект то делаем полное подключени
      {
        await Future.delayed(Duration(milliseconds: 500));

        await WorkWithTimeout(
          //рвем выбранное соединение
          () => disconnectDevice_repit(maxAttempts: 20),
          timeoutMs: 10000,
        );
      }

      device_connect_status = await checkDeviceConnectionStatus(
          my_devise); // проверка статуса подключения после подключения

      if (device_connect_status == 2) //если разоединилось
      // то при следующем входе предлагать КОННЕКТ
      {
        val++;
        updateListOfMyDevice1Field(
            FFAppState().selectedDeviceId, 'onOffKnobState', val);

        // обновляем глобальную перменную статуса устрйотсва (его НАДПИСИ ) для отображения ВНТРИ ДЕВАЙСА
        FFAppState().OnOffKnobValueBufer =
            'off'; // быстрая смена значка  со старого значени яна новое
        // для минимизации возможного времннего старого изображения до момента обновления процедуры
      }
    }
  }
}
