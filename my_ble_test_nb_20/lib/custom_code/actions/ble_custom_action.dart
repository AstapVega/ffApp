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

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:android_intent_plus/android_intent.dart';

import 'package:android_intent_plus/flag.dart';

import 'dart:async';
import 'dart:io' show Platform;

import 'dart:convert';

import 'color_action.dart';

Function(Color)? globalOnColorSelected;

Future bleCustomAction(
  BuildContext context,
  BleActionStructStruct thisBleAction,
) async {
  // Add your function code here!

  // FFAppState().ReadTimer++;// отсановили прослушку

  if (thisBleAction.mode == FFAppConstants.showPlatform) {
    if (Platform.isAndroid) {
      // Code for Android
      print("Running on Android");
      FFAppState().readPlatform = 1; // показываем платформу Android

      // Отладка: выводим обновленный список устройств
      print(
          '=== Обновленный список устройств в FFAppState().ListOfMyDevice ===');
      for (var device in FFAppState().ListOfMyDevice1) {
        print('ID: ${device.id}, Имя: ${device.name}, FACE: ${device.face}');
      }

      setupCustomErrorHandling();
      disableSystemLogs();
      suppressSpecificError();

      globalDeviceIndex =
          0; // обнуляем глабальный указатель v активных устройтсв
      globalDeviceIndexV2 =
          0; // обнуляем глабальный указатель v2 активных устройтсв

      await FlutterForegroundTask.startService(
        notificationTitle: 'BLE активно',
        notificationText: 'Соединение в фоне поддерживается',
      );

      //requestBatteryOptimizationDialog();

      final intent = AndroidIntent(
        action: 'android.settings.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS',
        data: 'package:com.mycompany.mybletestnb20',
        flags: <int>[Flag.FLAG_ACTIVITY_NEW_TASK],
      );
      await intent.launch();

      print('[DEBUG] ForegroundService должен быть активен');
    }

    if (Platform.isIOS) {
      // Code for iOS
      print("Running on iOS");
      FFAppState().readPlatform = 2; // показываем платформу iOS

      setupCustomErrorHandling();
      disableSystemLogs();
      suppressSpecificError();

      globalDeviceIndex =
          0; // обнуляем глабальный указатель v активных устройтсв
      globalDeviceIndexV2 =
          0; // обнуляем глабальный указатель v2 активных устройтсв

      // await scanForDevices_v5("VEGA", 2, 2, true); // маск
    }

    initializeDeviceShedulle();

    print("ИНИЦИАЛИЗАЦИЯ  РАСПИСАНИЯ ДЛЯ ДОСТУПНЫХ ДЕВАЙСОВ");
  }

  if (thisBleAction.mode == FFAppConstants.delitALLdevice) {
    // Инициализация буферной переменной

    globalDeviceIndex = 0; // обнуляем глабальный указатель v активных устройтсв
    globalDeviceIndexV2 =
        0; // обнуляем глабальный указатель v2 активных устройтсв

/*
      List<Map<String, dynamic>> myDeviceAccumulator2 = [];
    // Копируем пустой буферный список в конечный список FFAppState().ListOfMyDevice1
    FFAppState().ListOfMyDevice1 = myDeviceAccumulator2
        .map((device) => MyDeviceStruct(
            id: device['id'],
            name: device['name'],
            onOff: device['on_off'],
            // tempere: device['tempere'],
            face: device['face']))
        .toList();
*/
    FFAppState().ListOfMyDevice1.clear();

    print('Все устройства удалены из FFAppState().ListOfMyDevice1');
  }

  if (thisBleAction.mode == FFAppConstants.delitTHISdevice) {
    // Удаление устройства по ID из итогового списка устройтсв

    globalDeviceIndex = 0; // обнуляем глабальный указатель v активных устройтсв
    globalDeviceIndexV2 =
        0; // обнуляем глабальный указатель v2 активных устройтсв

    removeDeviceById(FFAppState().selectedDeviceId);

    initializeDeviceShedulle();

    print("ИНИЦИАЛИЗАЦИЯ  РАСПИСАНИЯ ДЛЯ ДОСТУПНЫХ ДЕВАЙСОВ");
  }

  if (thisBleAction.mode == FFAppConstants.scanBLEspeed) {
    debugPrint("scan_mode");

    if (Platform.isIOS) {
      // Code for iOS
      //if (FFAppState().BLEspeedStop == 0) {
      await startDeviceScan(); //быстрое сканирвоание при первой загрузке
    }

    if (Platform.isAndroid) {
      // Code for Android
      print("Running on Android"); // для андроид не используется
      //scanForDevices_v5("VEGA", 2, 6,true); // маска для фильтрации по "VEGA-LTC " и три цифры после пробела , true - с фильтрацией
    }
  }

  if (thisBleAction.mode == FFAppConstants.scanBLE) {
    // если режим одиночного сканирования
    //идин раз проходит режим сканирвоани ядо момета повтроного взводоа флага FFAppState().ScanSinglMode=1

    debugPrint("scan_mode");

    if (Platform.isAndroid) {
      // Code for Android
      print("Running on Android");

      await scanForDevices_v5("VEGA", 2, 6,
          true); // маска для фильтрации по "VEGA-LTC " и три цифры после пробела , true - с фильтрацией

      setupCustomErrorHandling();
      disableSystemLogs();
    }

    if (Platform.isIOS) {
      // Code for iOS
      print("Running on iOS");

      await scanForDevices_v5("VEGA", 2, 6,
          true); // маска для фильтрации по "VEGA-LTC " и три цифры после пробела , true - с фильтрацией
    }
  }

  if (thisBleAction.mode == FFAppConstants.connectBLE) {
    debugPrint("connect_mode");

    globalDeviceIndex = 0; // обнуляем глабальный указатель v активных устройтсв
    globalDeviceIndexV2 =
        0; // обнуляем глабальный указатель v2 активных устройтсв

// для simple phereferia
    // await Connect_Read_Device(scan_connect_mode, FFAppState().selectedDeviceId);

// для spp

    //   resetStatusFields(); // предварительно сбрасываем предыдущюю  индикацию CONNECT всех возможных девайсов

    // Синхронизируем буферы после сканирования, но перед подключением
    synchronizeBluetoothBuffers(); // синхронизация буферов
    if (my_devise2 != null) {
      my_devise = my_devise2;

      await WorkWithTimeout(
        () => disconnectDevice_repit(maxAttempts: 6),
        timeoutMs: 6000,
      );
    }

    //device_connect_status = await checkDeviceConnectionStatus(
    //    my_devise); // проверка статуса подключения после подключения// проверка статуса отключения

    await WorkWithTimeout(
      () => connectAndProcessDevice(FFAppState().selectedDeviceId),
      timeoutMs: 5000,
    ); // плюс таймаут на антизависание  при подключении

    // добавляем поключенный выбранный девайс в итоговый  список по выбранному ID
    ForDevices_accumulate_and_output_v9(
        retainOnlySelectedDevice(
            FFAppState().ListBleDevice, FFAppState().selectedDeviceId),
        true,
        true,
        true);

    device_connect_status = await checkDeviceConnectionStatus(
        my_devise); // проверка статуса подключения после переподключения

    if (device_connect_status == 2) {
      // если ДИСКОННЕКТ
      //   FFAppState().StatusOnOffColor = parseColor("#E1DDDD"); //светло серый

      device_connect_on_servise = false; //произошел разрыв

      updateListOfMyDevice1Field(
          FFAppState()
              .selectedDeviceId, //обновили значение в ЛИСТ ВЬЮ данного девайса
          'statusConnectState',
          FFAppState().StatusConnectState);

      updateListOfMyDevice1Field(
          FFAppState()
              .selectedDeviceId, //обновили значение в ЛИСТ ВЬЮ данного девайса
          'statusConnectColor',
          parseColor("#E1DDDD"));
    }

    if (device_connect_status == 1) {
      // если КОННЕКТ
      //   FFAppState().StatusOnOffColor = parseColor("#39D2C0"); //берюзовый

      updateListOfMyDevice1Field(
          FFAppState()
              .selectedDeviceId, //обновили значение в ЛИСТ ВЬЮ данного девайса
          'statusConnectState',
          FFAppState().StatusConnectState);

      updateListOfMyDevice1Field(
          FFAppState()
              .selectedDeviceId, //обновили значение в ЛИСТ ВЬЮ данного девайса
          'statusConnectColor',
          parseColor("#39D2C0"));
    }

    my_devise2 = my_devise;

    await updateGlobalDeviceIds();

    initializeDeviceShedulle();

    print("ИНИЦИАЛИЗАЦИЯ  РАСПИСАНИЯ ДЛЯ ДОСТУПНЫХ ДЕВАЙСОВ");
  }

  //-----------------------------------------------------------------------------------------------------------

  if (thisBleAction.mode == FFAppConstants.disconnectBLE) {
    debugPrint("disconnectBLE_mode");
    //connectToDeviceAndProcessSpecificService("50:54:7B:74:B8:BB", "ffe4");//
    //Scan_Connect_Read_Device_v3(scan_connect_mode);

    await disconnectDevice_speed(); // более корктное отключение дл ИОС //оставляем его
  }

  if (thisBleAction.mode == FFAppConstants.ReadConnectStatus) {
    //device_connect_status = await checkDeviceConnectionStatus( my_devise); // проверка статуса подключения после подключения

    // if (FFAppState().selectedDeviceId != '') {
    if ((FFAppState().ListOfMyDevice1.isNotEmpty) &
        (FFAppState().selectedDeviceId != "")) {
      // 1.
      // фоново обнавляем  "СТАТУС СОЕДИНЕНИЯ " внутри девайса
      FFAppState().StatusConnectColorBufer = readListOfMyDevice1Field(
          FFAppState().selectedDeviceId, 'statusConnectColor');

      // 2.
      // фоново обнавляем  "ОПИСАНИЕ ДЕВАЙСА" внутри девайса
      FFAppState().deviseDiscript = readListOfMyDevice1Field(
          FFAppState().selectedDeviceId, 'deviseDiscript');
      // фоново обнавляем  "ОПИСАНИЕ ДАТЧИКА" внутри девайса
      FFAppState().sensorDiscript = readListOfMyDevice1Field(
          FFAppState().selectedDeviceId, 'sensorDiscript');
      // фоново обнавляем  "ОПИСАНИЕ ДАТЧИКА в МЕНЮ ГИСТЕРЕЗИС " внутри девайса
      FFAppState().settingsSensorName = readListOfMyDevice1Field(
          FFAppState().selectedDeviceId, 'settingsSensorName');
      // фоново обнавляем  "ЗНАЧЕНИЕ ГИТЕРЕЗИСА " внутри девайса
      FFAppState().GesterezisOUT = readListOfMyDevice1Field(
          FFAppState().selectedDeviceId, 'deviceHysteresis');
      // фоново обнавляем  "ЗНАЧЕНИЕ keyBlockOnOff " внутри девайса
      FFAppState().keyBlockOnOff = readListOfMyDevice1Field(
          FFAppState().selectedDeviceId, 'keyBlockOnOff');
      // фоново обнавляем  "ЗНАЧЕНИЕ sfmModeOnOff " внутри девайса
      FFAppState().sfmModeOnOff = readListOfMyDevice1Field(
          FFAppState().selectedDeviceId, 'sfmModeOnOff');
      // фоново обнавляем  "ЗНАЧЕНИЕ флагов для цветов  CheckBox  " внутри девайса
      read_all_chexboxColor_from_DeviceList();
      // фоново обнавляем  "FFAppState().deviceColor" внутри девайса - начальная иициализация водного цвета для Color Picker
      FFAppState().deviceColor = readListOfMyDevice1Field(
          FFAppState().selectedDeviceId, 'deviceColor');

      //FFAppState().deviceShedulleList

      // фоново обнавляем  сотсояние  "РЕЖИМ РАСПИСАНИЯ  " внутри девайса
      // стандартное расписание
      FFAppState().standartShedullMode = readListOfMyDevice1Field(
          FFAppState().selectedDeviceId, 'standartShedullMode');
      // пользовательское расписание
      FFAppState().customShedullMode = readListOfMyDevice1Field(
          FFAppState().selectedDeviceId, 'customShedullMode');

      // 3.
      // фоново обнавляем  "ТЕМПЕРАТУРУ ЗАДАНИЯ - старший байт " внутри девайса
      FFAppState().TempereSetHigthByte = readListOfMyDevice1Field(
          FFAppState().selectedDeviceId, 'tempereSetHigthByte');
      // фоново обнавляем  "ТЕМПЕРАТУРУ ЗАДАНИЯ - младший байт " внутри девайса
      FFAppState().TempereSetLowByte = readListOfMyDevice1Field(
          FFAppState().selectedDeviceId, 'tempereSetLowByte');
      // фоново обнавляем  "ТЕМПЕРАТУРУ ЗАДАНИЯ - float"  для слайдера  внутри девайса
      FFAppState().TempereSetFloat = combineToFloat(
          FFAppState().TempereSetHigthByte - 6, FFAppState().TempereSetLowByte);

      // 4.
      // фоново обнавляем  "ТЕМПЕРАТУРУ ТЕКУЩАЯ - старший байт " внутри девайса
      FFAppState().tempereReadHighByteString = readListOfMyDevice1Field(
          FFAppState().selectedDeviceId, 'tempereReadHighByteString');
      // фоново обнавляем  "ТЕМПЕРАТУРУ ТЕКУЩАЯ - младший байт " внутри девайса
      FFAppState().tempereReadLowByteString = readListOfMyDevice1Field(
          FFAppState().selectedDeviceId, 'tempereReadLowByteString');

      // 5.
      // фоново обновляем текущих значений  цветов для иконок " РУЧНОЙ" и "ПРОГРАМНИК"
      FFAppState().HandProgModeSwich = readListOfMyDevice1Field(
          FFAppState().selectedDeviceId, 'handProgModeSwich');
      FFAppState().HandModeColor = readListOfMyDevice1Field(
          FFAppState().selectedDeviceId, 'handModeColor');
      FFAppState().ProgModeColor = readListOfMyDevice1Field(
          FFAppState().selectedDeviceId, 'progModeColor');
      FFAppState().HandModeVisible = readListOfMyDevice1Field(
          FFAppState().selectedDeviceId, 'handModeVisible');
      FFAppState().ProgModeVisible = readListOfMyDevice1Field(
          FFAppState().selectedDeviceId, 'progModeVisible');
    }

    if ((my_devise != null) &
        (connect_status_busy == false) &
        (device_connect_on_servise == true)) {
// обновление фоновое для текущего  активного девайса в списке, для коректной работы  команд ЗАПИСИ по флагу is connect! Не удалть
//работает через глобальную перменную       device_connect_status и my_devise

//----------------------------------------------------------

      scanResultDevice = findDeviceById(
          FFAppState().selectedDeviceId, ALLbluetoothDevicesBuffer);
      my_devise = getDeviceFromScanResult(scanResultDevice);

      device_connect_status = await checkDeviceConnectionStatus(
          my_devise); // проверка статуса подключения после подключения

      if (device_connect_status ==
          2) // если Дисконект произошел для  my_devise то сбрасываем device_connect_on_servise
      {
        // device_connect_on_servise = false; // скинули флаг активного соединения

        // resetStatusFields(); // обновили все состояния в OFFLINE
        //updateListOfMyDevice1Field(
        //   FFAppState().selectedDeviceId,
        //   'tempereReadColor', //стал шрифт светлее  при обновленных данных
        //   parseColor("#B5BCCF"));
      } //else // иначе подключен девайс

//-----------------------------------------------------------------------------

      await processAllDevices(); // оновляем все статусы
    } else {
      FFAppState().resetStatusFields =
          1; // сбрасываем индикатор коннекта на серй цвет если нет активного соединения будь где

      if (my_devise == null) {
        resetStatusFields();

        //  print('=== processAllDevices  Проверка конечного списка ===');
      }
    }

    if (thisBleAction.mode ==
        FFAppConstants.ReadeNewSliderState) //  ReadeNewSliderState
    {
//setup_temp = currentValue;
//final GlobalKey<_SliderAndKeyCustomWidgetFFState> sliderKey = GlobalKey();

      convertTemperature(
          setup_temp); //раскладываем обратно значение на формат старший байт + младший (деястые доли)

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

      dataToWrite[0] = tempWhole; //записали в буфер для BLE
      dataToWrite[1] = tempHalf; //записали в буфер для BLE
      // dataToWrite[2] = tempHalf; //записали в буфер для BLE

// буферизируем  значение  текуще для вомжности вывода в индикатор внутри выбранного девайса
      FFAppState().TempereSetHigthByte = tempWhole;
      FFAppState().TempereSetLowByte = tempHalf;

      FFAppState().NewDataToWrite = 1; //  данные ГОТОВЫ для дальнейшей ЗАПИСИ
    }

    // print('=== processAllDevices  Проверка конечного списка ===');
  }

  //-----------------------------------------------------------------------------------------------------------
}

// --------------------получение ID первого устройтсва в спсике устройтсв-------------------
String getFirstDeviceId() {
  if (FFAppState().ListOfMyDevice1.isNotEmpty) {
    return FFAppState().ListOfMyDevice1.first.id;
  } else {
    return "No devices found"; // Возвращает сообщение, если список пуст
  }
}

//-------------------удалние устройства по ID из итогового списка устройтсв  -------------------

// Шаг 1: Создание мапирования (Map) для быстрого доступа к устройствам по ID
Map<String, MyDeviceStruct> createMyDeviceMap(List<MyDeviceStruct> deviceList) {
  Map<String, MyDeviceStruct> deviceMap = {};
  for (var device in deviceList) {
    deviceMap[device.id] =
        device; // Присваиваем ID как ключ, а устройство как значение
  }
  return deviceMap;
}

// Удаление устройства по ID и обновление списка

// Глобальный аккумулятор
List<MyDeviceStruct> myDeviceAccumulator = [];

void removeDeviceById(String deviceId) {
  //  List<MyDeviceStruct> myDeviceAccumulator = [];

// РАБОЧИЙ КОД
  // Очищаем буферный список
  myDeviceAccumulator.clear();
// Шаг 1: Заполняем аккумулятор из текущего списка
  myDeviceAccumulator = List.from(FFAppState().ListOfMyDevice1);
  // Шаг 2: Удаляем устройство по ID из аккумулятора
  myDeviceAccumulator.removeWhere((device) => device.id == deviceId);
  // Шаг 3: Очищаем целевой список
  //FFAppState().ListOfMyDevice1.clear();
  FFAppState().ListOfMyDevice1 = [];

  // Шаг 4: Восстанавливаем обновлённое состояние из аккумулятора
  FFAppState().ListOfMyDevice1.addAll(myDeviceAccumulator);

// ТЕСТОВЫЙ КОД
  // List<Map<String, dynamic>> myDeviceAccumulator2 = [];
//  myDeviceAccumulator2.clear();
  // Копируем пустой буферный список в конечный список FFAppState().ListOfMyDevice1
  /*
    FFAppState().ListOfMyDevice1 = myDeviceAccumulator2
        .map((device) => MyDeviceStruct(
            id: device['id'],
            name: device['name'],
            onOff: device['on_off'],
            // tempere: device['tempere'],
            face: device['face']))
        .toList();
*/
  //FFAppState().ListOfMyDevice1.clear();
  //FFAppState().ListOfMyDevice1 =
  //   myDeviceAccumulator; //восстанавливаем исходное сотсояние спсика всех устройтсв

  // Логирование для отладки
  print('Устройство с ID: $deviceId удалено. Обновлённый список:');
  for (var device in FFAppState().ListOfMyDevice1) {
    print('ID: ${device.id}, Имя: ${device.name}');
  }
}

// Пример вызова функции удаления
void exampleRemoveDevice() {
  String deviceId =
      '50:54:7B:74:B8:BB'; // Указываем ID устройства, которое хотим удалить
  removeDeviceById(deviceId); // Вызываем функцию удаления
}

//------------------запрос разрешений на работу с Bluetooth-------------------

void requestBluetoothPermissions() async {
  if (await FlutterBluePlus.isOn) {
    // Bluetooth is already on
  } else {
    // Request Bluetooth permissions
    await FlutterBluePlus.turnOn();
  }
}

void printCurrentTime() {
  DateTime currentTime = DateTime.now();
  String formattedTime = currentTime.toString().split('.')[0];
  print('Current Time: $formattedTime');
}

// функция вывода в консоль по таймеру   -- проверочный  и фоновый  таймер , запускаем на первой странице , тикает везде

void printConsoleOnTimer() {
  timestamp = DateTime.now().millisecondsSinceEpoch;

  print(timestamp); // Output: 1639592424394
  debugPrint("ASTAP - сканируем и подключаемся к еашему девайсу"); // мой дебаг

  newtime = true; // флаш нового времени для всех страниц

  if (mode_Ext ==
      scan_connect_mode) // обрабатываем в теле таймера необходиму логику подключения и чтения характеристик
  {
    //print('Printing to console on timer');
    timestamp = DateTime.now().millisecondsSinceEpoch;

    if (mydebug == 1) //// разрешение вывода в консоль
    {
      //    print(timestamp); // Output: 1639592424394
      //   debugPrint(
      //     "ASTAP - сканируем и подключаемся к еашему девайсу"); // мой дебаг
    }
  }

  if (mode_Ext == only_read_mode) {
//      onWritePressed(); // пишем в характеристику синхронно каждые 100 мсек...иначе пропускает значения - не самое надежное решение

    if (mydebug == 1) // разрешение вывода в консоль
    {
      //
      //    debugPrint(
      //      "ASTAP - считываем данные с подключенного девайса"); // мой дебаг
    }
  }
}

// ---функция прослушивания данных  с устройства

///*

List<int> previousValue = []; // Глобальный буфер для предыдущего значения

Future<dynamic> streamSubscription(var mydevice) async {
  Completer<dynamic> completer =
      Completer<dynamic>(); // Completer для возврата значения
  late StreamSubscription<List<int>> _lastValueSubscription;
  List<int> _value = [5];

//int initialSize = 10; // Начальный размер списка
//List<int> dataToWrite = List.filled(initialSize, 0, growable: true);
//dataToWrite.add(11); // Добавляем 11-й элемент (индекс 10), значение 11
//dataToWrite.add(12); // Добавляем 12-й элемент (индекс 11), значение 12

  //String myID;
  // String? currentDeviceId = await getCurrentDeviceId();

  // myID = currentDeviceId ??
  'default_id'; // Если currentDeviceId == null, будет 'default_id'

// расшиаривание сервиса для конкретно девайса

  // 3. Получаем все сервисы устройства
  // List<BluetoothService> services = await mydevice.discoverServices();

  //        services = await r.device.discoverServices();
  //    my_services =services; // Сохраняем сервисы устройства в глобальную переменную

  // debugPrint("Получены сервисы устройства");

  // 4. Ищем нужные характеристики в сервисе fff0
  // for (BluetoothService service in services) {
  //   if (service.uuid.toString() == 'fff0') {
  //    print('Найден сервис fff0');
  //    await findCharacteristicsForService(service);
  //    break;
  //  }
  // }

  // 5. Включаем уведомления и подписываемся на прослушивание в цикле таймера  на фоновой странице

  // Успешное подключение, переключаем на режим чтения
//  mode_Ext = only_read_mode;
  // FFAppState().readmode = 55; // устанавливаем режим чтения
  // device_connect_on_servise = true; // Устройство готово для чтения/записи
  // my_characteristic = notifyCharacteristic;

  try {
    _lastValueSubscription = my_characteristic.lastValueStream.listen((value) {
      _value = value;

      // Проверка на наличие новых данных
      if (_value.isNotEmpty && !_listsEqual(_value, previousValue)) {
        // Обновляем буфер предыдущего значения
        previousValue = List<int>.from(_value);

        // Выводим обновленное значение
        debugPrint('Новое значение: ${_value.toString()}');

        //  packet_count = value[0]; //первый байт - счетчик пакетов

        FFAppState().tempereHigthByte =
            value[0]; //второй байт - температура старший байт
        FFAppState().tempereLowByte =
            value[1]; //второй байт - температура младший байт

        //FFAppState().ListOfMyDevice1.containsMap.

        // обновляем значение для нужно элемента девайса из списка List Viue  устройств на главной странице

        updateListOfMyDevice1Field(FFAppState().selectedDeviceId,
            'tempereReadHigthByte', FFAppState().tempereHigthByte);
        updateListOfMyDevice1Field(FFAppState().selectedDeviceId,
            'tempereReadLowByte', FFAppState().tempereLowByte);

        //  updateListOfMyDevice1Field(
        //      myID, 'tempereReadHigthByte', FFAppState().tempereHigthByte);
        //  updateListOfMyDevice1Field(
        //     myID, 'tempereReadLowByte', FFAppState().tempereLowByte);

        FFAppState().DevicelistDataUpdate =
            1; //флаг обновления данных в списке устройств ддля обновления станицы
        //затем он автоматом сбрасывается

        debugPrint(' Cчетчик пакетов : ${packet_count}');
        debugPrint('Второй элемент: ${_value[1]}');

        String hexString = _value
            .map((byte) => byte.toRadixString(16).padLeft(2, '0'))
            .join(' '); //в HEX

        debugPrint('Новое значение в HEX: $hexString'); //вывод в HEX

        completer.complete(_value); // Возвращаем обновленное значение
        debugPrint(
            'Текущее значение selectedDeviceId: ${FFAppState().selectedDeviceId}');
        //отображаем текущий ID устройства
      } else {
        completer
            .complete(false); // Возвращаем false, если данные не изменились
      }

      // Отмена подписки после обработки
      _lastValueSubscription.cancel();
    });
  } catch (e) {
    // В случае ошибки возвращаем "ERROR"
    completer.complete("ERROR");
    _lastValueSubscription
        .cancel(); // На всякий случай отменяем подписку при ошибке
  }

  // Возвращаем результат через Completer
  return completer.future;
}

Map<String, List<int>> previousValuesV2 =
    {}; // Глобальный буфер для предыдущих значений по ID устройств

Future<dynamic> streamSubscriptionV2(var mydevice) async {
  Completer<dynamic> completer =
      Completer<dynamic>(); // Completer для возврата значения
  late StreamSubscription<List<int>> _lastValueSubscription;
  List<int> _value = [5];

  int TempereSetHigthByteLocal;
  int TempereSetLowByteLocal;
  double TempereSetFloatLocal;
  int TempereReadHigthByteLocal;
  int TempereReadLowByteLocal;

  var my_characteristic_local;
  var my_services_local;
  var idbuf;
  var index;
  var resultCharacteristic;
  resultCharacteristic = 0;
  idbuf = myID2;

  index = getIndexById(idKeyRead, idbuf);
  resultCharacteristic =
      getCharacteristicById(readCharacteristicsStruct, idKeyRead, idbuf);

  my_characteristic = resultCharacteristic;
  mode_Ext = only_read_mode;
  FFAppState().readmode = 55; // устанавливаем режим чтения
  device_connect_on_servise = true; // Устройство готово для чтения/записи

  // Включаем уведомления
  //onNotifyPressed(resultCharacteristic); // Включаем уведомления

  try {
    _lastValueSubscription =
        resultCharacteristic.lastValueStream.listen((value) {
      _value = value;

      // Проверка на наличие новых данных для текущего устройства
      if (_value.isNotEmpty &&
          (!_listsEqual(_value, previousValuesV2[myID2] ?? []))) {
        // Обновляем буфер предыдущего значения для текущего устройства
        previousValuesV2[myID2] = List<int>.from(_value);

        // Выводим обновленное значение
        debugPrint('Новое значение: ${_value.toString()}');

        // Если список обновился и не пустой
        if (globalDeviceIdsV3.isNotEmpty) {
          print(
              'Обновлён список активных устройств: $globalDeviceIdsV3'); // Со скобками
          // print('Обновлён список активных устройств: ${globalDeviceIdsV3.join(', ')}'); // Без скобок
        }

// ОТЛАДКА + синхронизация через глобальные переменные состояния

        // /*
// это ЭХО  - обратная связь по температуре  УСТАВКИ!!!

// ----------------------------- Считывание  температуры ЗАДАНИЯ  с термостата --------------------

//синхронизация с кнопок на  самом девайсе + и - и кнопок + и - на выбраном активном девайсе ВНУТРИ НЕГО  в приложении согласно активному ID

        if (FFAppState().TempereSetHigthByte != 0) {
          TempereSetHigthByteLocal = value[0];
          TempereSetLowByteLocal = value[1];

          // обратно преобразовываем в чистый флоат для передачи значения с целью синхронизаации с движением бегунка слйадера!!

          TempereSetFloatLocal = combineToFloat(
              TempereSetHigthByteLocal - 6, TempereSetLowByteLocal);

          if ((TempereSetFloatLocal) >= (40.0 - 6)) {
            TempereSetFloatLocal = (40.0 - 6);
            TempereSetHigthByteLocal = 40;
            TempereSetLowByteLocal = 0;
            tempWhole = 40;
            tempHalf = 0;
            setup_temp = 400 - 60;
          }

          if ((TempereSetFloatLocal) <= (5.0 - 6)) {
            TempereSetFloatLocal = (5.0 - 6);
            TempereSetHigthByteLocal = 5;
            TempereSetLowByteLocal = 0;
            tempWhole = 5;
            tempHalf = 0;
            setup_temp = 50;
          }

          updateListOfMyDevice1Field(
              myID2, 'tempereSetHigthByte', TempereSetHigthByteLocal);
          updateListOfMyDevice1Field(
              myID2, 'tempereSetLowByte', TempereSetLowByteLocal);

          //updateListOfMyDevice1Field(
          //        FFAppState().selectedDeviceId, 'tempereSetHigthByte', FFAppState().TempereSetHigthByte);

          //  updateListOfMyDevice1Field(
          //   FFAppState().selectedDeviceId, 'tempereSetLowByte', FFAppState().TempereSetLowByte);
        }

        debugPrint(
            'Текущее значение FFAppState().TempereSetFloat: ${FFAppState().TempereSetFloat}');
        debugPrint(
            'Текущее значение FFAppState().TempereSetHigthByte: ${FFAppState().TempereSetHigthByte}');
        debugPrint(
            'Текущее значение FFAppState().TempereSetLowByte: ${FFAppState().TempereSetLowByte}');
        debugPrint('Текущее значение setup_temp: ${setup_temp}');

//------------------------  END OF ЭХО -----------------------

        // */

// -------------------------------------считывание измеренной температуры с ТЕРМОСТАТА --------------

        TempereReadHigthByteLocal = value[2];
        TempereReadLowByteLocal = value[3];

// обновляем  значение температура в СТРИНГОВОМ формате
/*
     
        updateListOfMyDevice1Field(
            FFAppState()
                .selectedDeviceId, //обновили значение в ЛИСТ ВЬЮ данного девайса
            'tempereReadHighByteString',
            TempereReadHighByteToString(TempereReadHigthByteLocal));

        updateListOfMyDevice1Field(
            FFAppState()
                .selectedDeviceId, //обновили значение в ЛИСТ ВЬЮ данного девайса
            'tempereReadLowByteString',
            TempereReadLowByteToString(TempereReadLowByteLocal));

        updateListOfMyDevice1Field(
            FFAppState().selectedDeviceId,
            'tempereReadColor', //стал шрифт темнее при побновленных данных
            parseColor("#6E6C6C")); //#B5BCCF // #59B5BCCF

*/

        updateListOfMyDevice1Field(
            myID2, //обновили значение в ЛИСТ ВЬЮ данного девайса
            'tempereReadHighByteString',
            TempereReadHighByteToString(TempereReadHigthByteLocal));

        updateListOfMyDevice1Field(
            myID2, //обновили значение в ЛИСТ ВЬЮ данного девайса
            'tempereReadLowByteString',
            TempereReadLowByteToString(TempereReadLowByteLocal));

        updateListOfMyDevice1Field(
            myID2,
            'tempereReadColor', //стал шрифт темнее при побновленных данных
            parseColor("#6E6C6C")); //#B5BCCF // #59B5BCCF

        FFAppState().DevicelistDataUpdate = 1; // Флаг обновления данных

        debugPrint(' Cчетчик пакетов : ${packet_count}');
        debugPrint('Второй элемент: ${_value[1]}');

        String hexString = _value
            .map((byte) => byte.toRadixString(16).padLeft(2, '0'))
            .join(' ');

        completer.complete(_value); // Возвращаем обновленное значение
        debugPrint(
            'Текущее значение selectedDeviceId: ${FFAppState().selectedDeviceId}');
      } else {
        completer
            .complete(false); // Возвращаем false, если данные не изменились
      }

      // Отмена подписки после обработки
      _lastValueSubscription.cancel();
    });
  } catch (e) {
    // В случае ошибки возвращаем "ERROR"
    completer.complete("ERROR");
    _lastValueSubscription
        .cancel(); // На всякий случай отменяем подписку при ошибке
  }

  // Возвращаем результат через Completer
  return completer.future;
}

// Функция для сравнения двух списков
bool _listsEqual(List<int> list1, List<int> list2) {
  if (list1.length != list2.length) return false;
  for (int i = 0; i < list1.length; i++) {
    if (list1[i] != list2[i]) return false;
  }
  return true;
}

// передача данных в характеристику  термостата

Future onWritePressed(var input, int this_chanell) async {
  try {
    //globals.my_write_characteristic1 = characteristic;//запоминаем характеристику  для дальнейшего использования

    String DATA;

    if (mydebug == 1) {
      //  print('сервис:  Characteristic UUID:  IS WRITE  № 1 :      ${characteristic.uuid}');
      //  print('characteristic = characteristic  № 1:    ${characteristic}');
      //  await characteristic.write(_value.codeUnits);
      // print('ПОИСК ЗАВЕРШЕН:  Characteristic UUID:  IS WRITE № 2 :      ${characteristic.uuid}');
    }

    // DATA = 'Astap'; //пример записи в характеристику

    DATA = input.toString();

    if (this_chanell == 0) {
      my_write_characteristic1.write(
          DATA.codeUnits); // пишем 'Astap' в характеристику  write #2 см ch582
    }

    if (this_chanell == 1) {
      my_write_characteristic2.write(
          DATA.codeUnits); // пишем 'Astap' в характеристику  write #2 см ch582
    }

    // await my_write_characteristic2.write(
    //   DATA.codeUnits); // пишем 'Astap' в характеристику  write #2 см ch582
  } catch (e) {}
}

// включение нотификаций

Future onNotifyPressed(var characteristic_buf) async {
  try {
    if (mydebug == 1) {
      //  debugPrint("ASTAP - нажимаем на кнопку 'Subscribe'    ");// мой дебаг
      //  debugPrint("ASTAP - устанавливаем  Notify характеристику  , вызовом  метода  await с.setNotifyValue(true); ");// мой дебаг
    }

    //characteristic_buf =notify_buf1;
    //notify_buf1 = my_characteristic;
    //await notify_buf1.setNotifyValue(true); //разрешаем нотификацию у телефона
    await characteristic_buf
        .setNotifyValue(true); //разрешаем нотификацию у телефона
  } catch (e) {
    //Snackbar.show(ABC.c, prettyException("Subscribe Error:", e), success: false);
  }
}

// ----------------------------------------ОТЛАДКА--------------------------------------------

// Глобальный массив для буферизации всех найденных устройств
List<Map<String, dynamic>> bluetoothDevicesBuffer =
    []; // Массив для хранения данных о найденных устройствах: ID, имя и прочее

// ------------------------------ Функция 2: Подключение к устройству ------------------------------ +

Future<void> handleDeviceConnection(ScanResult r) async {
  try {
    // Подключаемся к устройству
    await r.device.connect();
    debugPrint("Устройство подключено: ${r.device.name}");

    // Этап 3.1. Получение сервисов и характеристик устройства
    List<BluetoothService> services = await r.device.discoverServices();

    // Сохраняем сервисы устройства в глобальную переменную
    my_services = services;

    // Обрабатываем и сохраняем характеристики устройства
    await processDeviceServices(my_services, "ffe4");

    // Этап 3.3. Переключение на режим только чтения после подключения
    mode_Ext = only_read_mode;
    device_connect_on_servise = true; // Устройство готово для чтения/записи
    onNotifyPressed(notifyCharacteristic); // Включаем уведомления
  } catch (e) {
    debugPrint("Ошибка при подключении к устройству: $e");
  }
}

// Этап 3.2: Обработка сервисов и характеристик устройства

//-------------------------------------------------------------------------------------

Future<void> processDeviceServices(
    List<BluetoothService> services, String targetUuid) async {
  int count = 0;
  List<Map<String, dynamic>> characteristicDetails =
      []; // Для сбора информации о характеристиках
  bool targetCharacteristicFound =
      false; // Флаг для проверки нахождения целевой характеристики

  for (BluetoothService service in services) {
    for (BluetoothCharacteristic characteristic in service.characteristics) {
      // Сохраняем информацию о характеристике
      characteristicDetails.add({
        'uuid': characteristic.uuid.toString(),
        'properties': {
          'read': characteristic.properties.read,
          'write': characteristic.properties.write,
          'notify': characteristic.properties.notify,
        }
      });

      if (characteristic.properties.write) {
        count++;
        if (count == 1) {
          my_write_characteristic1 =
              characteristic; // Сохраняем первую характеристику с записью
        } else if (count == 2) {
          my_write_characteristic2 =
              characteristic; // Сохраняем вторую характеристику
        }
      }

      // Логируем UUID характеристики для отладки
      if (mydebug == 1) {
        debugPrint('Характеристика: UUID ${characteristic.uuid}');
      }

      // Проверка наличия характеристики по переданному UUID
      if (characteristic.uuid.toString() == targetUuid) {
        my_characteristic = characteristic;
        targetCharacteristicFound = true; // Целевая характеристика найдена
        debugPrint('Найдена характеристика с UUID $targetUuid');
      }
    }
  }

  // Выводим итоговую информацию после завершения обработки
  print('Всего найдено характеристик: ${characteristicDetails.length}');
  for (var characteristic in characteristicDetails) {
    print('UUID: ${characteristic['uuid']}');
    print(
        '  Свойства: Чтение: ${characteristic['properties']['read']}, Запись: ${characteristic['properties']['write']}, Уведомление: ${characteristic['properties']['notify']}');
  }

  if (targetCharacteristicFound) {
    print(
        'Целевая характеристика с UUID $targetUuid успешно найдена и подписана для опроса.');
  } else {
    print('Целевая характеристика с UUID $targetUuid не найдена.');
  }
}

//-------------------------------------------------------------------------------------

//  Обработка режима только чтения
void handleOnlyReadMode() {
  if (device_connect_on_servise == true) {
    // onWritePressed(); // Пишем в характеристику
    // streamSubscription(); // Подписываемся на прослушку данных
  }
}

// ------------------------------ Функция 1: Сканирование устройств ------------------------------ +

Future<void> scanForDevices() async {
  try {
    // Очищаем текст перед началом сканирования
    FFAppState().bleDeviceText = ''; // Очистка текстовой переменной

    List<Map<String, dynamic>> namedDevices = [];
    List<Map<String, dynamic>> unnamedDevices = [];
    List<Map<String, dynamic>> allDevices = [];

    // Очищаем буфер найденных устройств перед началом нового сканирования
    bluetoothDevicesBuffer.clear();

    // Запуск сканирования устройств с таймаутом
    await FlutterBluePlus.startScan(timeout: const Duration(seconds: 3));

    // Обрабатываем результаты сканирования
    var subscription = FlutterBluePlus.scanResults.listen((results) async {
      for (ScanResult r in results) {
        // Проверяем, существует ли устройство в списке
        bool exists = namedDevices
                .any((device) => device['id'] == r.device.id.toString()) ||
            unnamedDevices
                .any((device) => device['id'] == r.device.id.toString());

        if (!exists) {
          // Буферизируем данные о каждом устройстве, включая ScanResult
          bluetoothDevicesBuffer.add({
            'id': r.device.remoteId.toString(),
            'name': r.device.name,
            'rssi': r.rssi,
            'scanResult':
                r, // Добавляем ScanResult для последующего использования
          });

          // Разделение устройств на именованные и безымянные
          if (r.device.name.isNotEmpty) {
            namedDevices.add({
              'name': r.device.name,
              'id': r.device.id.toString(),
              'rssi': r.rssi
            });
          } else {
            unnamedDevices.add({
              'name': 'Unnamed Device',
              'id': r.device.id.toString(),
              'rssi': r.rssi
            });
          }
        }
      }
    });

    // Ждем завершения сканирования
    await Future.delayed(const Duration(seconds: 3));
    subscription.cancel();

    // Обновляем состояние сканера
    FFAppState().Scaner = 1; // сканер активен

    // Собираем все устройства в один список
    allDevices.addAll(namedDevices);
    allDevices.addAll(unnamedDevices);

    // Печать найденных устройств
    print('Found BLE Devices:');
    for (var device in allDevices) {
      print(
          'Имя: ${device['name']}, ID: ${device['id']}, RSSI: ${device['rssi']}');
    }

    // Обновляем список устройств в глобальном состоянии (AppState)
    FFAppState().ListBleDevice = allDevices
        .map((device) => BleDeviceStruct(
              name: device['name'],
              id: device['id'],
              rssi: device['rssi'],
            ))
        .toList();

    // Создаем текстовый буфер для отображения найденных устройств
    String deviceTextBuffer = '';
    for (var device in FFAppState().ListBleDevice) {
      deviceTextBuffer +=
          'Имя: ${device.name}, ID: ${device.id}, RSSI: ${device.rssi}\n';
    }

    // Обновляем текстовый буфер в AppState
    FFAppState().bleDeviceText = deviceTextBuffer;

    // Печатаем обновленный список устройств
    print('Copied BLE Devices to global state:');
    for (var device in FFAppState().ListBleDevice) {
      print('Имя: ${device.name}, ID: ${device.id}, RSSI: ${device.rssi}');
    }

    print('Количество устройств: ${FFAppState().ListBleDevice.length}');
  } catch (e) {
    debugPrint("Ошибка при сканировании: $e");
  }
}

//-------------------------------------------------------------------------------------

Future<void> scanForDevices_v5(
    String brand, int debugMode, int scanSek, bool shouldFilter) async {
  try {
    FFAppState().Scaner = 0; // сбрасываем флаг готовности сканирования

    FFAppState().bleDeviceText = ''; // Очистка текстовой переменной

    List<Map<String, dynamic>> namedDevices = [];
    List<Map<String, dynamic>> unnamedDevices = [];
    List<Map<String, dynamic>> allDevices = [];

    // Очищаем буфер найденных устройств перед началом нового сканирования
    bluetoothDevicesBuffer.clear();

    // Запуск сканирования устройств с тайм-аутом
    await FlutterBluePlus.startScan(timeout: Duration(seconds: scanSek));

    // Обрабатываем результаты сканирования
    var subscription = FlutterBluePlus.scanResults.listen((results) async {
      for (ScanResult r in results) {
        // Проверяем, существует ли устройство в списке
        bool exists = namedDevices
                .any((device) => device['id'] == r.device.id.toString()) ||
            unnamedDevices
                .any((device) => device['id'] == r.device.id.toString());

        if (!exists) {
          // Буферизируем данные о каждом устройстве, включая ScanResult
          bluetoothDevicesBuffer.add({
            'id': r.device.remoteId.toString(),
            'name': r.device.name,
            'rssi': r.rssi,
            'scanResult':
                r, // Добавляем ScanResult для последующего использования
          });

          // Разделение устройств на именованные и безымянные
          if (r.device.name.isNotEmpty) {
            namedDevices.add({
              'name': r.device.name,
              'id': r.device.id.toString(),
              'rssi': r.rssi
            });
          } else {
            unnamedDevices.add({
              'name': 'Unnamed Device',
              'id': r.device.id.toString(),
              'rssi': r.rssi
            });
          }
        }
      }
    });

    // Ждем завершения сканирования
    await Future.delayed(Duration(seconds: scanSek));
    subscription.cancel();

    // Собираем все устройства в один список
    allDevices.addAll(namedDevices);
    allDevices.addAll(unnamedDevices);

    // Печать найденных устройств
    print('Found BLE Devices:');
    for (var device in allDevices) {
      print(
          'Имя: ${device['name']}, ID: ${device['id']}, RSSI: ${device['rssi']}');
    }

    // Обновляем список устройств в глобальном состоянии (AppState)
    FFAppState().ListBleDevice = allDevices
        .map((device) => BleDeviceStruct(
              name: device['name'],
              id: device['id'],
              rssi: device['rssi'],
            ))
        .toList();

    // Создаем текстовый буфер для отображения найденных устройств
    String deviceTextBuffer = '';
    for (var device in FFAppState().ListBleDevice) {
      deviceTextBuffer +=
          'Имя: ${device.name}, ID: ${device.id}, RSSI: ${device.rssi}\n';
    }

    // Обновляем текстовый буфер в AppState
    FFAppState().bleDeviceText = deviceTextBuffer;

    // Печатаем обновленный список устройств
    print('Copied BLE Devices to global state:');
    for (var device in FFAppState().ListBleDevice) {
      print('Имя: ${device.name}, ID: ${device.id}, RSSI: ${device.rssi}');
    }

    print('Количество устройств: ${FFAppState().ListBleDevice.length}');

    // Проверяем нужно ли фильтровать устройства
    if (shouldFilter) {
      try {
        //сортруем результат сканирвоания
        processAndSortBleDevices('VEGA');

        //ForDevices_accumulate_and_output_v9(true, true, true);
        //ForDevices_accumulate_and_output_v9(false, true, true);

        // находим выбранное для подключения устройтсво
        //getDeviceFieldsById(FFAppState().ListBleDevice, '50:54:7B:74:B8:BB');

        //  ForDevices_accumulate_and_output_v9(getDeviceFieldsById(FFAppState().ListBleDevice, FFAppState().selectedDeviceId),
        //  false, true, true);

        // добавляем поключенный выбранный девайс в список
        //    ForDevices_accumulate_and_output_v9(
        //    FFAppState().ListBleDevice, false, true, true);
      } catch (e) {
        //  debugPrint("Ошибка при фильтрации: $e");
      }
    } else {
      print('All BLE Devices without filtering:');
      for (var device in bluetoothDevicesBuffer) {
        print(
            'Имя: ${device['name']}, ID: ${device['id']}, RSSI: ${device['rssi']}');
      }

      FFAppState().ListBleDevice = bluetoothDevicesBuffer
          .map((device) => BleDeviceStruct(
                name: device['name'],
                id: device['id'],
                rssi: device['rssi'],
              ))
          .toList();

      print(
          'Количество устройств без фильтрации: ${bluetoothDevicesBuffer.length}');
    }

//-----------------------------КРИТИЧЕСКИЕ ПЕРЕМЕННЫЕ ДЛЯ РАБОТЫ ----------------------------
    // }
  } catch (e) {
    debugPrint("Ошибка при сканировании: $e");
  }

  // Обновляем состояние сканера
  FFAppState().Scaner = 1; //отмечаем готовность сканирования
}

// создание дополнительного зеркального буфера на случай повторного сканирвоания и обработки при удалениии и повторном добавление устройств
// на случай если первичный список сканирвоания bluetoothDevicesBuffer ==0 будет равен нулю !!!

List<Map<String, dynamic>> ALLbluetoothDevicesBuffer = [];

void synchronizeBluetoothBuffers() {
  // Выводим содержимое bluetoothDevicesBuffer перед началом синхронизации
  print("Исходное содержимое bluetoothDevicesBuffer: $bluetoothDevicesBuffer");

  // Проходим по каждому устройству в bluetoothDevicesBuffer
  for (var device in bluetoothDevicesBuffer) {
    // Проверяем, есть ли уже устройство с таким же ID в ALLbluetoothDevicesBuffer
    bool deviceExists = ALLbluetoothDevicesBuffer.any(
        (existingDevice) => existingDevice['id'] == device['id']);

    // Если устройства с таким ID нет в ALLbluetoothDevicesBuffer, добавляем его
    if (!deviceExists) {
      ALLbluetoothDevicesBuffer.add(Map<String, dynamic>.from(device));
      print("Добавлено новое устройство: ${device['id']}"); // Контрольный вывод
    } else {
      print(
          "Устройство с ID ${device['id']} уже существует в буфере, пропускаем.");
    }
  }

  // Контрольный вывод для проверки содержимого ALLbluetoothDevicesBuffer после копирования
  print(
      "Содержимое ALLbluetoothDevicesBuffer после копирования: $ALLbluetoothDevicesBuffer");
}

void printAllFieldsOfMyDevise() {
  // Проверяем, что my_devise не пустой
  if (my_devise != null) {
    print("Детали устройства my_devise:");

    // Пытаемся получить доступ к основным свойствам my_devise
    try {
      print("ID: ${my_devise.id}");
      print("Имя: ${my_devise.name}");
      print("Состояние подключения: ${my_devise.connectionState}");
      print("Сервисы: ${my_devise.services}");
    } catch (e) {
      print("Ошибка при получении данных из my_devise: $e");
    }
  } else {
    print("my_devise пустой");
  }
}

//----------- Функция поиска устройства по заданному ID в списке результат сканирвания  и копирование/возвращение  его полей

/*
Map<String, dynamic>? getDeviceFieldsById(
    List<BleDeviceStruct> deviceList, String deviceId) {
  // Локальный буфер для хранения полей устройства
  Map<String, dynamic> localBuffer = {};

  // Ищем устройство в массиве по переданному ID
  for (var device in deviceList) {
    if (device.id == deviceId) {
      // Копируем поля устройства в локальный буфер
      localBuffer['id'] = device.id;
      localBuffer['name'] = device.name;
      localBuffer['rssi'] = device.rssi;

      // Возвращаем локальный буфер с полями устройства
      return localBuffer;
    }
  }

  // Если устройство не найдено, возвращаем null
  return null;
}

*/

List<BleDeviceStruct> retainOnlySelectedDevice(
    var deviceList, String deviceId) {
  // Создаем новый список для хранения только выбранного устройства
  List<BleDeviceStruct> updatedDeviceList = [];

  // Проходим по списку устройств и ищем устройство с нужным ID
  for (var device in deviceList) {
    if (device.id == deviceId) {
      // Если нашли устройство, добавляем его в новый список
      updatedDeviceList.add(device);
      break; // Прерываем цикл, т.к. нашли нужное устройство
    }
  }

  // Обновляем исходный список устройств, оставляя только выбранное устройство
  deviceList = updatedDeviceList;

  // Возвращаем копию обновленного списка
  return List<BleDeviceStruct>.from(deviceList);
}

// сортировка и фильтрация устройств для списка FFAppState().ListBleDevice

// нужно

void processAndSortBleDevices(String brand) {
  // Этап 1: Печать исходного списка устройств (FFAppState().ListBleDevice)
  print('=== Этап 1: Вывод устройств из FFAppState().ListBleDevice ===');
  List<Map<String, dynamic>> sourceDevices = FFAppState()
      .ListBleDevice
      .map((device) =>
          {'id': device.id, 'name': device.name, 'rssi': device.rssi})
      .toList();

  for (var device in sourceDevices) {
    print(
        'ID: ${device['id']}, Имя: ${device['name']}, RSSI: ${device['rssi']}');
  }

  // Время начала работы для аварийного выхода
  DateTime startTime = DateTime.now();

  // Этап 2: Фильтрация и сортировка по префиксу и суффиксу
  List<Map<String, dynamic>> filteredDevices = sourceDevices.where((device) {
    String name = device['name'] ?? '';
    // Фильтрация по введенному бренду (например, VEGA) и 3 буквы после
    return RegExp('^' + brand + '-[A-Z]{3}').hasMatch(name);
  }).toList();

  // Сортировка сначала по цифровому суффиксу, затем по префиксу (алфавитно)
  filteredDevices.sort((a, b) {
    // Аварийный выход, если цикл длится более 1 секунды
    if (DateTime.now().difference(startTime).inSeconds >= 1) {
      print('Сортировка прервана из-за превышения времени.');
      return 0; // Возвращаем ноль для завершения сортировки
    }

    String nameA = a['name'] ?? '';
    String nameB = b['name'] ?? '';

    // Сравнение по числовому суффиксу
    int suffixA =
        int.tryParse(nameA.substring(brand.length + 5, brand.length + 8)) ?? 0;
    int suffixB =
        int.tryParse(nameB.substring(brand.length + 5, brand.length + 8)) ?? 0;

    // Сортировка по суффиксу
    int suffixComparison = suffixA.compareTo(suffixB);
    if (suffixComparison != 0) {
      return suffixComparison; // Возвращаем результат сортировки по суффиксам
    }

    // Если суффиксы одинаковы, сортируем по буквам
    return nameA
        .substring(brand.length + 1, brand.length + 4)
        .compareTo(nameB.substring(brand.length + 1, brand.length + 4));
  });

  // Печать устройств после фильтрации и сортировки
  print(
      '=== Этап 2: Устройства после фильтрации и сортировки по префиксу и суффиксу ===');
  for (var device in filteredDevices) {
    print(
        'ID: ${device['id']}, Имя: ${device['name']}, RSSI: ${device['rssi']}');
  }

  // Очищаем FFAppState().ListBleDevice и записываем новые отсортированные устройства
  FFAppState().ListBleDevice.clear();

  FFAppState().ListBleDevice = filteredDevices
      .map((device) => BleDeviceStruct(
            name: device['name'],
            id: device['id'],
            rssi: device['rssi'],
          ))
      .toList();

  // Выводим контрольное состояние обновленного списка устройств FFAppState().ListBleDevice
  print(
      '=== Этап 3: Итоговый список устройств в FFAppState().ListBleDevice ===');
  for (var device in FFAppState().ListBleDevice) {
    print('ID: ${device.id}, Имя: ${device.name}');
  }
}

//-------------------------------------------------------------------------------------

// Вспомогательная функция для извлечения цифрового суффикса из имени устройства
int _extractNumericSuffix(String name) {
  // Используем регулярное выражение для поиска числового суффикса
  RegExp regex = RegExp(
      r'(\d+)(?=\s|$)'); // Ищем числовой суффикс перед пробелом или концом строки
  var match = regex.firstMatch(name);
  if (match != null) {
    return int.parse(
        match.group(0) ?? '0'); // Преобразуем найденный суффикс в число
  } else {
    return 0; // Если суффикс не найден, возвращаем 0
  }
}

//------------------нужно

/// Обновляет указанное поле `targetField` у устройства в `ListOfMyDevice1`,
/// идентифицированного по `deviceId`, значением `newValue`.
/// Функция проходит по списку устройств, ищет устройство с совпадающим `deviceId`,
/// и обновляет указанное поле, оставляя другие устройства неизменными.
///
/// Чтобы адаптировать эту функцию для другой структуры:
/// - Замените `ListOfMyDevice1` на нужный вам список.
/// - Добавьте в `switch` блок новые поля для обновления.

/*
void updateListOfMyDevice1Field(
    String deviceId, String targetField, dynamic newValue) {
  FFAppState().ListOfMyDevice1 = FFAppState().ListOfMyDevice1.map((device) {
    if (device.id == deviceId) {
      // Определяем, какое поле обновить, используя switch.
      return MyDeviceStruct(
          id: targetField == 'id' ? newValue : device.id,
          name: targetField == 'name' ? newValue : device.name,
          onOff: targetField == 'onOff' ? newValue : device.onOff,
          //  tempere: targetField == 'tempere' ? newValue : device.tempere,
          face: targetField == 'face' ? newValue : device.face,
          tempereSetHigthByte: targetField == 'tempereSetHigthByte'
              ? newValue
              : device.tempereSetHigthByte,
          tempereSetLowByte: targetField == 'tempereSetLowByte'
              ? newValue
              : device.tempereSetLowByte,
          tempereReadHigthByte: targetField == 'tempereReadHigthByte'
              ? newValue
              : device.tempereReadHigthByte,
          tempereReadLowByte: targetField == 'tempereReadLowByte'
              ? newValue
              : device.tempereReadLowByte,
          statusConnectColor: targetField == 'statusConnectColor'
              ? newValue
              : device.statusConnectColor,
          statusConnectState: targetField == 'statusConnectState'
              ? newValue
              : device.statusConnectState,
          onOffKnobState: targetField == 'onOffKnobState'
              ? newValue
              : device.onOffKnobState,
          onOffKnobValue: targetField == 'onOffKnobValue'
              ? newValue
              : device.onOffKnobValue,
          handProgModeSwich: targetField == 'handProgModeSwich'
              ? newValue
              : device.handProgModeSwich,
          handModeColor:
              targetField == 'handModeColor' ? newValue : device.handModeColor,
          progModeColor:
              targetField == 'progModeColor' ? newValue : device.progModeColor,
          handModeVisible: targetField == 'handModeVisible'
              ? newValue
              : device.handModeVisible,
          progModeVisible: targetField == 'progModeVisible'
              ? newValue
              : device.progModeVisible,
          deviseDiscript: targetField == 'deviseDiscript'
              ? newValue
              : device.deviseDiscript,
          tempereReadHighByteString: targetField == 'tempereReadHighByteString'
              ? newValue
              : device.tempereReadHighByteString,
          tempereReadLowByteString: targetField == 'tempereReadLowByteString'
              ? newValue
              : device.tempereReadLowByteString,
          tempereReadColor: targetField == 'tempereReadColor'
              ? newValue
              : device.tempereReadColor,
          sensorDiscript: targetField == 'sensorDiscript'
              ? newValue
              : device.sensorDiscript,
          heatIconVisible: targetField == 'heatIconVisible'
              ? newValue
              : device.heatIconVisible,
          deviceHysteresis: targetField == 'deviceHysteresis'
              ? newValue
              : device.deviceHysteresis,
          settingsSensorName: targetField == 'settingsSensorName'
              ? newValue
              : device.settingsSensorName,
          heatIconVisibleForList: targetField == 'heatIconVisibleForList'
              ? newValue
              : device.heatIconVisibleForList,
          keyBlockOnOff:
              targetField == 'keyBlockOnOff' ? newValue : device.keyBlockOnOff,
          sfmModeOnOff:
              targetField == 'sfmModeOnOff' ? newValue : device.sfmModeOnOff,
          deviceColor:
              targetField == 'deviceColor' ? newValue : device.deviceColor,

          // Блок флагов для цветов  CheckBox
          color1OnOff:
              targetField == 'color1OnOff' ? newValue : device.color1OnOff,
          color2OnOff:
              targetField == 'color2OnOff' ? newValue : device.color2OnOff,
          color3OnOff:
              targetField == 'color3OnOff' ? newValue : device.color3OnOff,
          color4OnOff:
              targetField == 'color4OnOff' ? newValue : device.color4OnOff,
          color5OnOff:
              targetField == 'color5OnOff' ? newValue : device.color5OnOff,
          color6OnOff:
              targetField == 'color6OnOff' ? newValue : device.color6OnOff,
          color7OnOff:
              targetField == 'color7OnOff' ? newValue : device.color7OnOff,
          color8OnOff:
              targetField == 'color8OnOff' ? newValue : device.color8OnOff,
          standartShedullMode: targetField == 'standartShedullMode'
              ? newValue
              : device.standartShedullMode,
          customShedullMode: targetField == 'customShedullMode'
              ? newValue
              : device.customShedullMode,
          customColor:
              targetField == 'customColor' ? newValue : device.customColor);
    }
    return device; // Остальные устройства остаются без изменений
  }).toList();
}

*/

// глобально работает.. но??
List<ShedullIntervalsStruct>? updatedList;

var acum;

List<StandartIntervalsStruct>? updatedStandartList;

void updateListOfMyDevice1Field(
    String deviceId, String targetField, dynamic newValue) {
  FFAppState().ListOfMyDevice1 = FFAppState().ListOfMyDevice1.map((device) {
    if (device.id == deviceId) {
      Map<String, dynamic> updatedDevice = device.toMap();
//List<ShedullIntervalsStruct>? updatedList;
//List<StandartIntervalsStruct>? updatedStandartList;

      if (targetField.contains("[")) {
        updatedDevice = analyzeBaseField(updatedDevice, targetField, newValue);
//updatedDevice = analyzeBaseField(updatedDevice, targetField, newValue, updatedList, updatedStandartList);
      } else {
        updatedDevice[targetField] = newValue;
      }

      // 🔹 Возвращаем всю структуру (КОПИЯ ТВОЕГО КОДА)
      return MyDeviceStruct(
        id: updatedDevice['id'] ?? device.id,
        name: updatedDevice['name'] ?? device.name,
        onOff: updatedDevice['onOff'] ?? device.onOff,
        face: updatedDevice['face'] ?? device.face,
        tempereSetHigthByte:
            updatedDevice['tempereSetHigthByte'] ?? device.tempereSetHigthByte,
        tempereSetLowByte:
            updatedDevice['tempereSetLowByte'] ?? device.tempereSetLowByte,
        tempereReadHigthByte: updatedDevice['tempereReadHigthByte'] ??
            device.tempereReadHigthByte,
        tempereReadLowByte:
            updatedDevice['tempereReadLowByte'] ?? device.tempereReadLowByte,
        statusConnectColor:
            updatedDevice['statusConnectColor'] ?? device.statusConnectColor,
        statusConnectState:
            updatedDevice['statusConnectState'] ?? device.statusConnectState,
        onOffKnobState:
            updatedDevice['onOffKnobState'] ?? device.onOffKnobState,
        onOffKnobValue:
            updatedDevice['onOffKnobValue'] ?? device.onOffKnobValue,
        handProgModeSwich:
            updatedDevice['handProgModeSwich'] ?? device.handProgModeSwich,
        handModeColor: updatedDevice['handModeColor'] ?? device.handModeColor,
        progModeColor: updatedDevice['progModeColor'] ?? device.progModeColor,
        handModeVisible:
            updatedDevice['handModeVisible'] ?? device.handModeVisible,
        progModeVisible:
            updatedDevice['progModeVisible'] ?? device.progModeVisible,
        deviseDiscript:
            updatedDevice['deviseDiscript'] ?? device.deviseDiscript,
        tempereReadHighByteString: updatedDevice['tempereReadHighByteString'] ??
            device.tempereReadHighByteString,
        tempereReadLowByteString: updatedDevice['tempereReadLowByteString'] ??
            device.tempereReadLowByteString,
        tempereReadColor:
            updatedDevice['tempereReadColor'] ?? device.tempereReadColor,
        sensorDiscript:
            updatedDevice['sensorDiscript'] ?? device.sensorDiscript,
        heatIconVisible:
            updatedDevice['heatIconVisible'] ?? device.heatIconVisible,
        deviceHysteresis:
            updatedDevice['deviceHysteresis'] ?? device.deviceHysteresis,
        settingsSensorName:
            updatedDevice['settingsSensorName'] ?? device.settingsSensorName,
        heatIconVisibleForList: updatedDevice['heatIconVisibleForList'] ??
            device.heatIconVisibleForList,
        keyBlockOnOff: updatedDevice['keyBlockOnOff'] ?? device.keyBlockOnOff,
        sfmModeOnOff: updatedDevice['sfmModeOnOff'] ?? device.sfmModeOnOff,
        deviceColor: updatedDevice['deviceColor'] ?? device.deviceColor,
        color1OnOff: updatedDevice['color1OnOff'] ?? device.color1OnOff,
        color2OnOff: updatedDevice['color2OnOff'] ?? device.color2OnOff,
        color3OnOff: updatedDevice['color3OnOff'] ?? device.color3OnOff,
        color4OnOff: updatedDevice['color4OnOff'] ?? device.color4OnOff,
        color5OnOff: updatedDevice['color5OnOff'] ?? device.color5OnOff,
        color6OnOff: updatedDevice['color6OnOff'] ?? device.color6OnOff,
        color7OnOff: updatedDevice['color7OnOff'] ?? device.color7OnOff,
        color8OnOff: updatedDevice['color8OnOff'] ?? device.color8OnOff,
        standartShedullMode:
            updatedDevice['standartShedullMode'] ?? device.standartShedullMode,
        customShedullMode:
            updatedDevice['customShedullMode'] ?? device.customShedullMode,
        customColor: updatedDevice['customColor'] ?? device.customColor,
        day1Select: updatedDevice['day1Select'] ?? device.day1Select,
        day2Select: updatedDevice['day2Select'] ?? device.day2Select,
        day3Select: updatedDevice['day3Select'] ?? device.day3Select,
        day4Select: updatedDevice['day4Select'] ?? device.day4Select,
        day5Select: updatedDevice['day5Select'] ?? device.day5Select,
        day6Select: updatedDevice['day6Select'] ?? device.day6Select,
        day7Select: updatedDevice['day7Select'] ?? device.day7Select,
      );
    }
    return device;
  }).toList();

  //  acumDay1 = updatedList;
  //   acumDay1 = updatedList;
}

Map<String, dynamic> analyzeBaseField(
    Map<String, dynamic> updatedDevice, String targetField, dynamic newValue) {
//Map<String, dynamic> analyzeBaseField(
  // Map<String, dynamic> updatedDevice, String targetField, dynamic newValue,List<ShedullIntervalsStruct>? updatedList,
  // List<StandartIntervalsStruct>? updatedStandartList) {

  List<String> parts = targetField.split(RegExp(r'\[|\]\.?'));

  String baseField = parts[0];
  int? index = parts.length > 1 ? int.tryParse(parts[1]) : null;
  String? subField = parts.length > 2 ? parts[2] : null;

  if (index == null || subField == null) {
    return updatedDevice; // Ошибка парсинга, ничего не делаем
  }

  String finalBaseField = filterBaseField(baseField);

  List<Map<String, dynamic>> list =
      (updatedDevice[finalBaseField] as List?)?.cast<Map<String, dynamic>>() ??
          [];

  while (list.length <= index) {
    list.add({}); // Добавляем пустую структуру
  }

  list[index][subField] = newValue;

// Кастомные интевалы
  if (baseField.startsWith("dayIntervals")) {
    updatedList = list.map((e) => ShedullIntervalsStruct.fromMap(e)).toList();
  }
  if (baseField.startsWith("dayIntervals1")) {
    // updatedList1 = list.map((e) => ShedullIntervalsStruct.fromMap(e)).toList();
  }
  if (baseField.startsWith("dayIntervals2")) {
    //  updatedList2 = list.map((e) => ShedullIntervalsStruct.fromMap(e)).toList();
  }
  if (baseField.startsWith("dayIntervals3")) {
    //  updatedList3 = list.map((e) => ShedullIntervalsStruct.fromMap(e)).toList();
  }
  if (baseField.startsWith("dayIntervals4")) {
    //  updatedList4 = list.map((e) => ShedullIntervalsStruct.fromMap(e)).toList();
  }
  if (baseField.startsWith("dayIntervals5")) {
    //  updatedList5 = list.map((e) => ShedullIntervalsStruct.fromMap(e)).toList();
  }
  if (baseField.startsWith("dayIntervals6")) {
    //  updatedList6 = list.map((e) => ShedullIntervalsStruct.fromMap(e)).toList();
  }

  //стандартные интервалы
  if (baseField.startsWith("standartDayIntervals")) {
    updatedStandartList =
        list.map((e) => StandartIntervalsStruct.fromMap(e)).toList();
  }
  if (baseField.startsWith("standartDayIntervals1")) {
    //  updatedStandartList1 = list.map((e) => StandartIntervalsStruct.fromMap(e)).toList();
  }
  if (baseField.startsWith("standartDayIntervals2")) {
    //  updatedStandartList2 = list.map((e) => StandartIntervalsStruct.fromMap(e)).toList();
  }
  if (baseField.startsWith("standartDayIntervals3")) {
    //  updatedStandartList3 = list.map((e) => StandartIntervalsStruct.fromMap(e)).toList();
  }
  if (baseField.startsWith("standartDayIntervals4")) {
    //  updatedStandartList4 = list.map((e) => StandartIntervalsStruct.fromMap(e)).toList();
  }
  if (baseField.startsWith("standartDayIntervals5")) {
    // updatedStandartList5 = list.map((e) => StandartIntervalsStruct.fromMap(e)).toList();
  }
  if (baseField.startsWith("standartDayIntervals6")) {
    // updatedStandartList6 = list.map((e) => StandartIntervalsStruct.fromMap(e)).toList();
  }

  updatedDevice[finalBaseField] =
      list.map((e) => e).toList(); // Правильное сохранение

  return updatedDevice;
}

String filterBaseField(String baseField) {
  RegExp regex = RegExp(r'^(dayIntervals|standartDayIntervals)([0-9]{1,2})?$');
  Match? match = regex.firstMatch(baseField);
  if (match == null) return baseField;

  String arrayName = match.group(1) ?? baseField;
  String? suffix = match.group(2);

  return suffix != null ? "$arrayName$suffix" : arrayName;
}

// */

// ----------------------------------------ЧТЕНИЕ ПОЛЕЙ --------------------------------------

/// Возвращает значение указанного поля `targetField` у устройства в `ListOfMyDevice1`,
/// идентифицированного по `deviceId`.
/// Функция ищет устройство по `deviceId` и возвращает значение целевого поля.
///
/// Чтобы адаптировать эту функцию для другой структуры:
/// - Замените `ListOfMyDevice1` на нужный вам список.
/// - Добавьте новые поля для обработки в `switch` блок.

/*

dynamic readListOfMyDevice1Field(String deviceId, String targetField) {
  // Ищем устройство по ID, если его нет — возвращаем null
  var device = FFAppState().ListOfMyDevice1.firstWhere(
      (device) => device.id == deviceId,
      orElse: () => throw Exception('Device with ID $deviceId not found'));

  // Определяем, какое поле прочитать, используя switch.
  switch (targetField) {
    case 'tempereSetHigthByte':
      return device.tempereSetHigthByte;
    case 'tempereSetLowByte':
      return device.tempereSetLowByte;
    case 'name':
      return device.name;
    case 'onOff':
      return device.onOff;
    case 'face':
      return device.face;
    case 'statusConnectState':
      return device.statusConnectState;
    case 'statusConnectColor':
      return device.statusConnectColor;
    case 'onOffKnobState':
      return device.onOffKnobState;
    case 'onOffKnobValue':
      return device.onOffKnobValue;
    case 'handProgModeSwich':
      return device.handProgModeSwich;
    case 'handModeColor':
      return device.handModeColor;
    case 'progModeColor':
      return device.progModeColor;
    case 'handModeVisible':
      return device.handModeVisible;
    case 'progModeVisible':
      return device.progModeVisible;
    case 'deviseDiscript':
      return device.deviseDiscript;
    case 'tempereReadHighByteString':
      return device.tempereReadHighByteString;
    case 'tempereReadLowByteString':
      return device.tempereReadLowByteString;
    case 'tempereReadColor':
      return device.tempereReadColor;
    case 'sensorDiscript':
      return device.sensorDiscript;
    case 'heatIconVisible':
      return device.heatIconVisible;
    case 'deviceHysteresis':
      return device.deviceHysteresis;
    case 'settingsSensorName':
      return device.settingsSensorName;
    case 'heatIconVisibleForList':
      return device.heatIconVisibleForList;
    case 'keyBlockOnOff':
      return device.keyBlockOnOff;
    case 'sfmModeOnOff':
      return device.sfmModeOnOff;
    // Блок флагов для цветов  CheckBox
    case 'color1OnOff':
      return device.color1OnOff;
    case 'color2OnOff':
      return device.color2OnOff;
    case 'color3OnOff':
      return device.color3OnOff;
    case 'color4OnOff':
      return device.color4OnOff;
    case 'color5OnOff':
      return device.color5OnOff;
    case 'color6OnOff':
      return device.color6OnOff;
    case 'color7OnOff':
      return device.color7OnOff;
    case 'color8OnOff':
      return device.color8OnOff;
    case 'deviceColor':
      return device.deviceColor;
    case 'standartShedullMode':
      return device.standartShedullMode;
    case 'customShedullMode':
      return device.customShedullMode;
    case 'customColor':
      return device.customColor;


    // Добавьте другие поля при необходимости
    default:
      throw Exception(
          'Field $targetField not found in device structure'); // Исключение, если поле не распознано
  }
}

*/

// последняя Рабочая версия

dynamic readListOfMyDevice1Field(String deviceId, String targetField) {
  // 🔹 1. Ищем нужное устройство по ID
  var device = FFAppState().ListOfMyDevice1.firstWhere(
      (device) => device.id == deviceId,
      orElse: () => throw Exception('Device with ID $deviceId not found'));

  // 🔹 2. Разбираем `targetField` (например, "dayIntervals[0].temperatureList[1]")
  List<String> parts = targetField.split(RegExp(r'\[|\]\.?'));
  String baseField =
      parts[0]; // Основное поле ("dayIntervals", "statusConnectState")
  int? index = parts.length > 1
      ? int.tryParse(parts[1])
      : null; // Индекс списка (если есть)
  String? subField =
      parts.length > 2 ? parts[2] : null; // Поле внутри объекта списка
  int? subIndex = parts.length > 3
      ? int.tryParse(parts[3])
      : null; // Второй индекс (если вложенный список)

  // 🔹 3. Работа с вложенными структурами (списки и объекты внутри них)
  if (index != null) {
    if (device.toMap().containsKey(baseField)) {
      var baseValue = device.toMap()[baseField];

      if (baseValue is List<dynamic>) {
        if (baseValue.length > index) {
          var item = baseValue[index];

          if (subField != null) {
            if (item is Map<String, dynamic>) {
              if (!item.containsKey(subField)) {
                throw Exception(
                    'Field $subField not found in object at index $index');
              }

              var subValue = item[subField];

              if (subIndex != null) {
                // 🔹 Если это список внутри списка (например, "dayIntervals[0].temperatureList[1]")
                if (subValue is List<dynamic>) {
                  if (subValue.length > subIndex) {
                    return subValue[subIndex];
                  } else {
                    throw Exception(
                        'Index $subIndex out of bounds for field $subField');
                  }
                } else {
                  throw Exception('Field $subField is not a list');
                }
              }
              return subValue;
            } else {
              throw Exception('Index $index does not contain a valid object');
            }
          }
          return item;
        } else {
          throw Exception('Index $index out of bounds for field $baseField');
        }
      } else if (baseValue is Map<String, dynamic>) {
        // 🔹 Если это объект со списками (например, "scheduleSettings.temperatureList[0]")
        if (subField != null && baseValue.containsKey(subField)) {
          var subValue = baseValue[subField];

          if (subValue is List<dynamic>) {
            if (subValue.length > index) {
              return subValue[index];
            } else {
              throw Exception('Index $index out of bounds for field $subField');
            }
          } else {
            throw Exception('Field $subField is not a list');
          }
        } else {
          throw Exception('Field $subField not found in object $baseField');
        }
      } else {
        throw Exception('Field $baseField is not a list or object');
      }
    } else {
      throw Exception('Field $baseField not found in device structure');
    }
  }

  // 🔹 4. Работа с одиночными полями
  switch (targetField) {
    case 'tempereSetHigthByte':
      return device.tempereSetHigthByte;
    case 'tempereSetLowByte':
      return device.tempereSetLowByte;
    case 'name':
      return device.name;
    case 'onOff':
      return device.onOff;
    case 'face':
      return device.face;
    case 'statusConnectState':
      return device.statusConnectState;
    case 'statusConnectColor':
      return device.statusConnectColor;
    case 'onOffKnobState':
      return device.onOffKnobState;
    case 'onOffKnobValue':
      return device.onOffKnobValue;
    case 'handProgModeSwich':
      return device.handProgModeSwich;
    case 'handModeColor':
      return device.handModeColor;
    case 'progModeColor':
      return device.progModeColor;
    case 'handModeVisible':
      return device.handModeVisible;
    case 'progModeVisible':
      return device.progModeVisible;
    case 'deviseDiscript':
      return device.deviseDiscript;
    case 'tempereReadHighByteString':
      return device.tempereReadHighByteString;
    case 'tempereReadLowByteString':
      return device.tempereReadLowByteString;
    case 'tempereReadColor':
      return device.tempereReadColor;
    case 'sensorDiscript':
      return device.sensorDiscript;
    case 'heatIconVisible':
      return device.heatIconVisible;
    case 'deviceHysteresis':
      return device.deviceHysteresis;
    case 'settingsSensorName':
      return device.settingsSensorName;
    case 'heatIconVisibleForList':
      return device.heatIconVisibleForList;
    case 'keyBlockOnOff':
      return device.keyBlockOnOff;
    case 'sfmModeOnOff':
      return device.sfmModeOnOff;
    case 'color1OnOff':
      return device.color1OnOff;
    case 'color2OnOff':
      return device.color2OnOff;
    case 'color3OnOff':
      return device.color3OnOff;
    case 'color4OnOff':
      return device.color4OnOff;
    case 'color5OnOff':
      return device.color5OnOff;
    case 'color6OnOff':
      return device.color6OnOff;
    case 'color7OnOff':
      return device.color7OnOff;
    case 'color8OnOff':
      return device.color8OnOff;
    case 'deviceColor':
      return device.deviceColor;
    case 'standartShedullMode':
      return device.standartShedullMode;
    case 'customShedullMode':
      return device.customShedullMode;
    case 'customColor':
      return device.customColor;
    case 'day1Select':
      return device.day1Select;
    case 'day2Select':
      return device.day2Select;
    case 'day3Select':
      return device.day3Select;
    case 'day4Select':
      return device.day4Select;
    case 'day5Select':
      return device.day5Select;
    case 'day6Select':
      return device.day6Select;
    case 'day7Select':
      return device.day7Select;

    default:
      throw Exception('Field $targetField not found in device structure');
  }
}

void delitListFildFromListOfMyDevice1Field(
    String deviceId, String targetField) {
  FFAppState().ListOfMyDevice1 = FFAppState().ListOfMyDevice1.map((device) {
    if (device.id == deviceId) {
      // Разбираем targetField
      List<String> parts = targetField.split(RegExp(r'\[|\]'));
      if (parts.length < 2) {
        debugPrint('❌ Ошибка: Неверный формат targetField: $targetField');
        return device;
      }

      String baseField = parts[0];
      int? index = int.tryParse(parts[1]);

      if (index == null) {
        debugPrint('❌ Ошибка: Индекс не число в $targetField');
        return device;
      }

      // Фильтруем название поля, учитывая префиксы и индексы
      String finalBaseField = filterBaseField(baseField);

      Map<String, dynamic> updatedDevice = device.toMap();

      if (!updatedDevice.containsKey(finalBaseField)) {
        debugPrint(
            '❌ Ошибка: Поле $finalBaseField не найдено в структуре устройства.');
        return device;
      }

      List<dynamic>? originalList =
          updatedDevice[finalBaseField] as List<dynamic>?;

      if (originalList == null ||
          originalList.isEmpty ||
          index < 0 ||
          index >= originalList.length) {
        debugPrint(
            '❌ Ошибка: Невозможно удалить индекс $index. Длина списка: ${originalList?.length}');
        return device;
      }

      // Удаляем элемент, если поле соответствует гибкому названию
      if (finalBaseField.startsWith("dayIntervals") ||
          finalBaseField.startsWith("standartDayIntervals")) {
        List<dynamic> newList = List.from(originalList);
        newList.removeAt(index);
        updatedDevice[finalBaseField] = newList;

        debugPrint(
            '✅ Удалён элемент с индексом $index. Новый список: $newList');

        // 🛠️ ГАРАНТИРУЕМ, что `daysSheduller` НЕ ПОТЕРЯЕТСЯ
        if (!updatedDevice.containsKey("daysSheduller") ||
            updatedDevice["daysSheduller"] == null) {
/*
          updatedDevice["daysSheduller"] =
              device.daysSheduller?.map((e) => e.toMap()).toList() ?? [];
          debugPrint("🔥 ВОССТАНОВЛЕН `daysSheduller`, чтобы не потерялся.");
*/
        }

        return MyDeviceStruct.fromMap(updatedDevice);
      }

      debugPrint(
          '❌ Ошибка: Поле $finalBaseField нельзя удалить этой функцией.');
      return device;
    }
    return device;
  }).toList();
}

void resetStatusFields() {
  // Обновляем поля только для устройств
  FFAppState().ListOfMyDevice1 = FFAppState().ListOfMyDevice1.map((device) {
    return MyDeviceStruct(
      id: device.id,
      name: device.name,
      onOff: device.onOff,
      face: device.face,
      tempereSetHigthByte: device.tempereSetHigthByte,
      tempereSetLowByte: device.tempereSetLowByte,
      tempereReadHigthByte: device.tempereReadHigthByte,
      tempereReadLowByte: device.tempereReadLowByte,
      // Устанавливаем светло-серый цвет, если statusConnectColor отличается от нужного
      statusConnectColor: device.statusConnectColor != Color(0xFFE1DDDD)
          ? Color(0xFFE1DDDD)
          : device.statusConnectColor,
      // Сбрасываем statusConnectState на 2, если он не равен 2
      statusConnectState:
          device.statusConnectState != 2 ? 2 : device.statusConnectState,
      onOffKnobState: device.onOffKnobState != 1 ? 1 : device.onOffKnobState,
      onOffKnobValue:
          device.onOffKnobValue != 'off' ? 'off' : device.onOffKnobValue,
      handProgModeSwich: device.handProgModeSwich,
      handModeColor: device.handModeColor,
      progModeColor: device.progModeColor,
      handModeVisible: device.handModeVisible,
      progModeVisible: device.progModeVisible,
      deviseDiscript: device.deviseDiscript,
      tempereReadHighByteString: device.tempereReadHighByteString,
      tempereReadLowByteString: device.tempereReadLowByteString,
      // tempereReadColor: device.tempereReadColor =
      //     parseColor("#B5BCCF"), //стал светлее
      sensorDiscript: device.sensorDiscript,
      heatIconVisible: device.heatIconVisible,
      settingsSensorName: device.settingsSensorName,
      deviceHysteresis: device.deviceHysteresis,
      heatIconVisibleForList: device.heatIconVisibleForList,
      keyBlockOnOff: device.keyBlockOnOff,
      sfmModeOnOff: device.sfmModeOnOff,

      // Блок флагов для цветов  CheckBox
      color1OnOff: device.color1OnOff,
      color2OnOff: device.color2OnOff,
      color3OnOff: device.color3OnOff,
      color4OnOff: device.color4OnOff,
      color5OnOff: device.color5OnOff,
      color6OnOff: device.color6OnOff,
      color7OnOff: device.color7OnOff,
      color8OnOff: device.color8OnOff,
      deviceColor: device.deviceColor,
      standartShedullMode: device.standartShedullMode,
      customShedullMode: device.customShedullMode,
      customColor: device.customColor,
      day1Select: device.day1Select,
      day2Select: device.day2Select,
      day3Select: device.day3Select,
      day4Select: device.day4Select,
      day5Select: device.day5Select,
      day6Select: device.day6Select,
      day7Select: device.day7Select,

      // 🔹 Инициализируем `dayIntervals`, если он вдруг пустой или `null`
      // dayIntervals: device.dayIntervals ?? [],
      // standartDayIntervals: device.standartDayIntervals ?? [],
      // daysSheduller: device.daysSheduller ?? []

      //tempereReadHighByteString: device.tempereReadHighByteString = "--",
      //tempereReadLowByteString: device.tempereReadLowByteString = "",
    );
  }).toList();
}

Future<void> ForDevices_accumulate_and_output_v9(
    var inputDeviceList,
    bool filterById,
    bool enableSuffixSorting,
    bool enableAlphabetSorting) async {
  // Этап 2: Промежуточный массив для новых устройствa
  List<Map<String, dynamic>> myDeviceAccumulator = [];

  // Этап 2.1: Проверяем текущее состояние конечного списка перед добавлением
  for (var device in FFAppState().ListOfMyDevice1) {
    print(
        'ID: ${device.id}, Имя: ${device.name}, OnOff: ${device.onOff}, FACE: ${device.face}');
    // Добавляем текущее состояние в аккумулятор
    myDeviceAccumulator.add({
      'id': device.id,
      'name': device.name,
      'on_off': device.onOff,
      'face': device.face,
      'tempereSetLowByte': device.tempereSetLowByte,
      'tempereSetHigthByte': device.tempereSetHigthByte,
      'tempereReadHigthByte': device.tempereReadHigthByte,
      'tempereReadLowByte': device.tempereReadLowByte,
      'statusConnectState': device.statusConnectState,
      'statusConnectColor': device.statusConnectColor,
    });
  }

  // Этап 3: Добавляем новые устройства из входного списка (inputDeviceList) в аккумулятор
  for (var bleDevice in inputDeviceList) {
    // Проверяем, существует ли устройство с таким ID в аккумуляторе
    if (filterById) {
      bool alreadyExists =
          myDeviceAccumulator.any((device) => device['id'] == bleDevice.id);
      if (alreadyExists) {
        print('Устройство с ID: ${bleDevice.id} уже существует, пропускаем.');
        continue; // Пропускаем добавление устройства
      }
    }

    // Присваиваем FACE на основании имени устройства
    String face = '';
    if (bleDevice.name.contains('030')) {
      face = 'assets/images/030_face2.png';
    } else if (bleDevice.name.contains('070')) {
      face = 'assets/images/070_face2.png';
    } else if (bleDevice.name.contains('090')) {
      face = 'assets/images/090_face2.png';
    }

    // Добавляем новое устройство в аккумулятор
    myDeviceAccumulator.add({
      'id': bleDevice.id,
      'name': bleDevice.name,
      //'on_off': 0,
      // 'tempereSetLowByte': 0,
      //'tempereSetHigthByte': myDeviceAccumulator.tempereSetHigthByte,  //tempereSetHigthByte: device['tempereSetHigthByte']
      // 'tempereSetHigthByte':0,
      // 'tempereReadHigthByte': 0,
      // 'tempereReadLowByte': 0,
      //'statusConnectState': 0,
      'statusConnectColor': Color(0xFFE1DDDD),
      'face': face,
    });

// типа того как? tempereSetHigthByte: targetField == 'tempereSetHigthByte'

    print(
        'Добавлено в промежуточный массив: ID: ${bleDevice.id}, Имя: ${bleDevice.name}, FACE: $face');
  }

  // Этап 4: Обновляем конечный список

  FFAppState().ListOfMyDevice1 = myDeviceAccumulator.map((device) {
    // Пытаемся найти устройство с таким же ID в текущем списке
    MyDeviceStruct? existingDevice;
    for (var d in FFAppState().ListOfMyDevice1) {
      if (d.id == device['id']) {
        existingDevice = d;
        break;
      }
    }

    // Если устройство уже существует, обновляем его поля напрямую
    if (existingDevice != null) {
      existingDevice.onOff = device['on_off'] ?? existingDevice.onOff;
      existingDevice.face = device['face'] ?? existingDevice.face;
      existingDevice.tempereSetLowByte =
          device['tempereSetLowByte'] ?? existingDevice.tempereSetLowByte;
      existingDevice.tempereSetHigthByte =
          device['tempereSetHigthByte'] ?? existingDevice.tempereSetHigthByte;
      existingDevice.tempereReadHigthByte =
          device['tempereReadHigthByte'] ?? existingDevice.tempereReadHigthByte;
      existingDevice.tempereReadLowByte =
          device['tempereReadLowByte'] ?? existingDevice.tempereReadLowByte;
      existingDevice.statusConnectState =
          device['statusConnectState'] ?? existingDevice.statusConnectState;
      existingDevice.statusConnectColor =
          device['statusConnectColor'] ?? existingDevice.statusConnectColor;

      // Возвращаем обновлённое устройство (не новый объект!)
      return existingDevice;
    }

    // Если устройство не найдено, мы добавляем его в список напрямую, но только один раз
    // Добавляем это устройство как новый объект

    var newDevice = MyDeviceStruct(
      id: device['id'],
      name: device['name'],
      onOff: device['on_off'],
      face: device['face'],
      tempereSetLowByte: device['tempereSetLowByte'], // Оставляем как есть
      tempereSetHigthByte: device['tempereSetHigthByte'], // Оставляем как есть
      tempereReadHigthByte:
          device['tempereReadHigthByte'], // Оставляем как есть
      tempereReadLowByte: device['tempereReadLowByte'], // Оставляем как есть
      statusConnectState: device['statusConnectState'],
      statusConnectColor: device['statusConnectColor'] ?? Color(0xFFE1DDDD),
    );

    // Логируем создание нового устройства для отладки
    print('Создано новое устройство: ${newDevice.id}');
    return newDevice;
  }).toList();

  // Этап 5: Сортировка
  if (enableSuffixSorting) {
    FFAppState().ListOfMyDevice1.sort((a, b) {
      int suffixA = _extractNumericSuffix(a.name);
      int suffixB = _extractNumericSuffix(b.name);
      return suffixA.compareTo(suffixB); // Сортируем по цифровому суффиксу
    });
    print('Сортировка по цифровым суффиксам выполнена.');

    // Если включена сортировка по алфавиту
    if (enableAlphabetSorting) {
      FFAppState().ListOfMyDevice1.sort((a, b) {
        int suffixA = _extractNumericSuffix(a.name);
        int suffixB = _extractNumericSuffix(b.name);

        if (suffixA == suffixB) {
          return a.name.compareTo(b.name); // Сортируем по алфавиту
        } else {
          return 0; // Если суффиксы разные, не изменяем порядок
        }
      });
      print('Сортировка по алфавиту внутри цифровых групп выполнена.');
    }
  }

  // Проверка обновленного списка после сортировки
  print('=== Обновленный список устройств ===');
  for (var device in FFAppState().ListOfMyDevice1) {
    print(
        'ID: ${device.id}, Имя: ${device.name}, OnOff: ${device.onOff}, FACE: ${device.face}');
  }
}

//--------нужно

Future<void> startDeviceScan() async {
  try {
    FFAppState().ScanReady = 0; // результаты сканирвоания не получены

    // Очищаем текст перед началом сканирования
    FFAppState().bleDeviceText = ''; // Очистка текстовой переменной

    List<Map<String, dynamic>> namedDevices = [];
    List<Map<String, dynamic>> unnamedDevices = [];
    List<Map<String, dynamic>> allDevices = [];

    // Очищаем буфер найденных устройств перед началом нового сканирования
    bluetoothDevicesBuffer.clear();

    // Запуск сканирования устройств с таймаутом
    await FlutterBluePlus.startScan(timeout: const Duration(seconds: 1));

    // Обрабатываем результаты сканирования
    var subscription = FlutterBluePlus.scanResults.listen((results) async {
      for (ScanResult r in results) {
        // Проверяем, существует ли устройство в списке
        bool exists = namedDevices
                .any((device) => device['id'] == r.device.id.toString()) ||
            unnamedDevices
                .any((device) => device['id'] == r.device.id.toString());

        if (!exists) {
          // Буферизируем данные о каждом устройстве, включая ScanResult
          bluetoothDevicesBuffer.add({
            'id': r.device.remoteId.toString(),
            'name': r.device.name,
            'rssi': r.rssi,
            'scanResult':
                r, // Добавляем ScanResult для последующего использования
          });

          // Сохраняем найденный ScanResult в глобальную переменную
          globalScanResult = r; // Сохранение текущего ScanResult

          // Разделение устройств на именованные и безымянные
          if (r.device.name.isNotEmpty) {
            namedDevices.add({
              'name': r.device.name,
              'id': r.device.id.toString(),
              'rssi': r.rssi
            });
          } else {
            unnamedDevices.add({
              'name': 'Unnamed Device',
              'id': r.device.id.toString(),
              'rssi': r.rssi
            });
          }
        }
      }
    });

    // Ждем завершения сканирования
    await Future.delayed(const Duration(seconds: 1));
    subscription.cancel();

    // Обновляем состояние сканера
    FFAppState().Scaner = 1; // сканер активен

    // Собираем все устройства в один список
    allDevices.addAll(namedDevices);
    allDevices.addAll(unnamedDevices);

    // Печать найденных устройств
    print('Found BLE Devices:');
    for (var device in allDevices) {
      print(
          'Имя: ${device['name']}, ID: ${device['id']}, RSSI: ${device['rssi']}');
    }

    // Обновляем список устройств в глобальном состоянии (AppState)
    FFAppState().ListBleDevice = allDevices
        .map((device) => BleDeviceStruct(
              name: device['name'],
              id: device['id'],
              rssi: device['rssi'],
            ))
        .toList();

    // Создаем текстовый буфер для отображения найденных устройств
    String deviceTextBuffer = '';
    for (var device in FFAppState().ListBleDevice) {
      deviceTextBuffer +=
          'Имя: ${device.name}, ID: ${device.id}, RSSI: ${device.rssi}\n';
    }

    // Обновляем текстовый буфер в AppState
    FFAppState().bleDeviceText = deviceTextBuffer;

    // Печатаем обновленный список устройств
    print('Copied BLE Devices to global state:');
    for (var device in FFAppState().ListBleDevice) {
      print('Имя: ${device.name}, ID: ${device.id}, RSSI: ${device.rssi}');
    }

    print('Количество устройств: ${FFAppState().ListBleDevice.length}');

    FFAppState().ScanReady = 1; // результаты сканирвоания получены

    // Обновляем состояние сканера
    FFAppState().Scaner = 1;
    FFAppState().ScanSinglMode = 0; //запрещаем  работу функции
  } catch (e) {
    debugPrint("Ошибка при сканировании: $e");
  }
}

//------------------------------------СКАНИРОВАНИЕ С УЧЕТОМ МАСКИ УСТРОЙСТВ ---------------------------------

Future<void> startDeviceScan_v2(String prefix, int debugMode) async {
  try {
    // Очищаем текст перед началом сканирования
    FFAppState().bleDeviceText = '';

    List<Map<String, dynamic>> namedDevices = [];
    List<Map<String, dynamic>> unnamedDevices = [];
    List<Map<String, dynamic>> allDevices = [];

    bluetoothDevicesBuffer.clear();

    // Запуск сканирования устройств
    await FlutterBluePlus.startScan(timeout: const Duration(seconds: 1));

    var subscription = FlutterBluePlus.scanResults.listen((results) async {
      for (ScanResult r in results) {
        bool exists = namedDevices
                .any((device) => device['id'] == r.device.id.toString()) ||
            unnamedDevices
                .any((device) => device['id'] == r.device.id.toString());

        if (!exists) {
          bluetoothDevicesBuffer.add({
            'id': r.device.remoteId.toString(),
            'name': r.device.name,
            'rssi': r.rssi,
            'scanResult': r,
          });

          globalScanResult = r;

          if (r.device.name.isNotEmpty) {
            namedDevices.add({
              'name': r.device.name,
              'id': r.device.id.toString(),
              'rssi': r.rssi
            });
          } else {
            unnamedDevices.add({
              'name': 'Unnamed Device',
              'id': r.device.id.toString(),
              'rssi': r.rssi
            });
          }
        }
      }
    });

    await Future.delayed(const Duration(seconds: 1));
    subscription.cancel();

    FFAppState().Scaner = 1;

    allDevices.addAll(namedDevices);
    allDevices.addAll(unnamedDevices);

    print('Found BLE Devices:');
    for (var device in allDevices) {
      print(
          'Имя: ${device['name']}, ID: ${device['id']}, RSSI: ${device['rssi']}');
    }

    FFAppState().bleDeviceText = allDevices
        .map((device) =>
            'Имя: ${device['name']}, ID: ${device['id']}, RSSI: ${device['rssi']}')
        .join('\n');

    // Начинаем фильтрацию
    print('Filtered BLE Devices (по маске $prefix):');
    List<Map<String, dynamic>> filteredDevices = allDevices.where((device) {
      String deviceName = device['name'];

      // Этап 1: Проверка префикса
      if (!deviceName.startsWith(prefix)) {
        return false;
      }

      // Этап 2: Извлечение и проверка суффикса
      String suffix = deviceName.substring(prefix.length).trim();
      if (suffix.length < 3) {
        return false; // Если суффикс короче 3 символов
      }

      String numericPart =
          suffix.substring(0, 3); // Берем первые 3 символа суффикса

      // Этап 3: Проверка, что первые три символа — это числа
      if (!RegExp(r'^\d{3}$').hasMatch(numericPart)) {
        if (debugMode == 2) {
          print('Суффикс не является числом: $numericPart');
        }
        return false;
      }

      // Вывод отладочной информации
      if (debugMode >= 1) {
        print('Префикс "$prefix" (количество символов: ${prefix.length})');
        print(
            'Суффикс "$suffix" (количество символов: ${suffix.length}), первые три числа: $numericPart');
      }

      return true; // Пропускаем устройство, если всё соответствует
    }).toList();

    // Вывод отфильтрованных устройств
    for (var device in filteredDevices) {
      print(
          'Имя: ${device['name']}, ID: ${device['id']}, RSSI: ${device['rssi']}');
    }

    print('Количество отфильтрованных устройств: ${filteredDevices.length}');

    // Вставка отфильтрованных устройств в ListBleDevice
    ///*
    FFAppState().ListBleDevice = filteredDevices
        .map((device) => BleDeviceStruct(
              name: device['name'],
              id: device['id'],
              rssi: device['rssi'],
            ))
        .toList();

// конец отладочной вставки без фильтрции
  } catch (e) {
    debugPrint("Ошибка при сканировании: $e");
  }
}

// ------------------------------ Функция 3: Подключение через глобальную переменную ScanResult ------------------------------

bool deviceConnected =
    false; // Глобальная переменная для отслеживания состояния подключения устройства

Future<void> connectToDevice(ScanResult r, {int maxAttempts = 1}) async {
  int attempt = 0;
  my_devise =
      r.device; // Сохраняем устройство для возможности дальнейшего отключения

//проверка состоятояния
  // scanResultDevice = findDeviceById(FFAppState().selectedDeviceId, ALLbluetoothDevicesBuffer);
  // my_devise =  scanResultDevice.device;

  // Пока не подключимся или не исчерпаем количество попыток
  while (attempt < maxAttempts) {
    try {
      attempt++;
      debugPrint("Попытка подключения #$attempt");

      // Подключаемся к устройству с таймаутом и автоповтором
      int connectionResult = await WorkWithTimeout(
        () => my_devise.connect(),
        timeoutMs: 10000, // Общий таймаут для WorkWithTimeout
        // maxRetries: 35, // Максимум 5 попыток внутри таймаута
        // maxRetries: 80, // Максимум 5 попыток внутри таймаута
        maxRetries: 120, // Максимум 5 попыток внутри таймаута
      );

      // Проверяем результат подключения
      if (connectionResult == 1) {
        debugPrint("Устройство успешно подключено: ${r.device.name}");
        device_connect_status = 1; // Успешное подключение
        return; // Завершаем выполнение функции
      } else {
        debugPrint("Устройство не подключено: ${r.device.name}");
        device_connect_status = 2; // Не удалось подключиться
      }
    } catch (e) {
      debugPrint("Ошибка при попытке подключения: $e");
    }

    // Проверяем, не исчерпаны ли попытки
    if (attempt >= maxAttempts) {
      debugPrint("Не удалось подключиться после $maxAttempts попыток.");
      device_connect_status = 2; // Подключение окончательно не удалось
      break;
    } else {
      debugPrint("Повторная попытка подключения...");
      await Future.delayed(
          // Duration(milliseconds: 150)); // Пауза перед повторной попыткой

          Duration(milliseconds: 50)); // Пауза перед повторной попыткой
    }
  }
}

Future<void> checkConnectionStatus(BluetoothDevice device) async {
  final dynamic state = await device.state.first;

  if (state == BluetoothDeviceState.connected) {
    print("Устройство подключено.");
    // Здесь код для обработки завершения подключения
  } else if (state == BluetoothDeviceState.disconnected) {
    print("Устройство отключено.");
    // Здесь код для обработки завершения отключения
  } else {
    print("Состояние устройства: $state");
    // Можно добавить обработку других состояний, если нужно
  }
}

// ---------------------------------ДИСКОНЕКТ N раз ------------------------------

Future<void> disconnectDevice_repit({int maxAttempts = 3}) async {
  int attempt = 0;
  bool isDisconnected = false;

  while (attempt < maxAttempts && !isDisconnected) {
    try {
      attempt++;
      debugPrint("Попытка отключения #$attempt");

      // Команда на отключение устройства
      await my_devise.disconnect();

      // Задержка для завершения процесса отключения
      await Future.delayed(Duration(milliseconds: 500));
      //await Future.delayed(Duration(milliseconds: 250));
      //await Future.delayed(Duration(milliseconds: 125));

      // Проверяем статус подключения
      isDisconnected = !(await my_devise.isConnected);

      if (isDisconnected) {
        debugPrint("Устройство успешно отключено.");

        // Обновляем глобальные флаги только при успешном отключении
        deviceConnected = false;
        device_connect_on_servise = false;
        mode_Ext = scan_connect_mode;

        return; // Завершаем выполнение функции
      } else {
        debugPrint("Устройство все еще подключено после попытки отключения.");
      }
    } catch (e) {
      debugPrint("Ошибка при отключении: $e");
    }

    // Задержка перед повторной попыткой, если отключение не удалось
    if (attempt < maxAttempts) {
      debugPrint("Повторная попытка отключения через 500 мс...");
      // await Future.delayed(Duration(milliseconds: 250));
      await Future.delayed(Duration(milliseconds: 500));
    }
  }

  debugPrint("Отключение устройства не удалось после $maxAttempts попыток.");
}

int statebufer = 0; // Глобальный буфер для сравнения состояний

Future<int> checkDeviceConnectionStatus(var device) async {
  // Подписываемся на состояние устройства с корректным типом
  StreamSubscription<BluetoothConnectionState>? statusSubscription;
  int result = 0; // 0 по умолчанию, если не удалось определить статус

  try {
    // Создаём подписку на поток состояния устройства
    statusSubscription = device.state.listen((state) {
      if (state == BluetoothConnectionState.disconnected) {
        if (statebufer != 2) {
          // Проверяем, отличается ли от предыдущего состояния
          //   debugPrint("Статус устройства: 'Disconnected'");
          statebufer = 2; // Обновляем буфер состояния
        }
        result = 2; // Устанавливаем результат для отключённого состояния
      } else if (state == BluetoothConnectionState.connected) {
        if (statebufer != 1) {
          // Проверяем, отличается ли от предыдущего состояния
          //  debugPrint("Статус устройства: 'Connected'");
          statebufer = 1; // Обновляем буфер состояния
        }
        result = 1; // Устанавливаем результат для подключённого состояния
      }
    });

    // Ждём немного, чтобы подписка успела зафиксировать текущее состояние
    await Future.delayed(Duration(milliseconds: 50));
  } finally {
    // Отписываемся от состояния устройства, чтобы избежать утечек памяти
    await statusSubscription?.cancel();
  }

  return result;
}

// ------------------------------ Итоговая функция: Scan + Connect + Read (v3) ------------------------------

Future<void> Connect_Read_Device(bool mode, String deviceId) async {
  // 1. Проверка текущего состояния (если только режим чтения, сразу выполняем чтение)
  if (mode_Ext == only_read_mode) {
    handleOnlyReadMode();
    return;
  }

  // 2. Обновляем режим работы
  mode_Ext = mode;

  if (mode == scan_connect_mode) {
    // 3. Сканирование устройств
    // await startDeviceScan();

    // Ищем устройство по заданному ID
    for (var device in bluetoothDevicesBuffer) {
      if (device['id'] == deviceId) {
        // Извлекаем ScanResult из буфера для подключения
        ScanResult scanResult = device['scanResult'];

        // Выполняем подключение, передавая ScanResult
        await connectToDevice(scanResult);

        // Обрабатываем сервисы устройства после подключения
        await processDeviceServices(my_services, "ffe4");

        // Успешное подключение, переключаем на режим чтения
        mode_Ext = only_read_mode;

        FFAppState().readmode = 55; // устанавливаем режим чтения

        device_connect_on_servise = true; // Устройство готово для чтения/записи
        onNotifyPressed(notifyCharacteristic); // Включаем уведомления

        // Прерываем цикл, если нашли и подключились к нужному устройству
        break;
      }
    }
  } else if (mode == only_read_mode) {
    // Работа в режиме только чтения
    //handleOnlyReadMode();
  }
}

// Функция для получения всех ID устройств из буфера и их вывода
void printAllDeviceIds() {
  // Проверяем, есть ли устройства в буфере
  if (bluetoothDevicesBuffer.isNotEmpty) {
    // Получаем все ID устройств из буфера
    List<String> allDeviceIds = bluetoothDevicesBuffer
        .map((device) => device['id'].toString())
        .toList();

    // Печатаем список всех ID
    for (var id in allDeviceIds) {
      print("Найденное устройство с ID: $id");
    }
  } else {
    print("Устройства не найдены. Буфер пуст.");
  }
}

// ------------------------------ Пример использования функций  для SPP------------------------------

// Функция записи данных в характеристику
//Future<void> writeToCharacteristic(List<int> dataToWrite) async {

Future<void> writeToCharacteristic(var dataToWrite) async {
  if (writeCharacteristic != null) {
    await writeCharacteristic!.write(dataToWrite);
    print('Данные записаны в характеристику fff2.');
  } else {
    print('Характеристика для записи не найдена.');
  }
}

// ---------------------------------------   Основная функция для подключения и обработки устройства
// Пример вызова основной функции:
// connectAndProcessDevice('50:54:7B:74:B8:BB');

var scanResultDevice;

Future<void> connectAndProcessDevice(String deviceId) async {
  // var scanResultDevice;

  // 1. Ищем устройство по заданному ID

  //scanResultDevice = getDeviceById(FFAppState().selectedDeviceId);// не работает..удалить  !!!

  scanResultDevice =
      findDeviceById(FFAppState().selectedDeviceId, ALLbluetoothDevicesBuffer);

  // 2. Подключаемся к устройству
  if (scanResultDevice != null) {
    // Выполняем подключение, передавая ScanResult
    //await connectToDevice(scanResultDevice);

    await connectToDevice(scanResultDevice,
        maxAttempts: 1); // 5 повторений - ТЕСТ работает

    device_connect_status = await checkDeviceConnectionStatus(
        my_devise); // проверка статуса подключения после подключения

    if (device_connect_status == 1) // если устройство подключено
    {
      device_connect_status = 0; // сбрасываем флаг
      debugPrint("Статус устройства: 'Connected' ");
      print('Устройство подключено: ${scanResultDevice.device.name}');
    }

    if (device_connect_status == 2) {
      device_connect_status = 0; // сбрасываем флаг
      debugPrint("Статус устройства: 'Disconnect' ");
      print('Устройство  НЕ подключено !!!  : ${scanResultDevice.device.name}');
    }

    //if(device_connect_status==1)// если устройство подключено
    //{

    // 3. Получаем все сервисы устройства
    List<BluetoothService> services =
        await scanResultDevice.device.discoverServices();

    //        services = await r.device.discoverServices();
    //    my_services =services; // Сохраняем сервисы устройства в глобальную переменную

    debugPrint("Получены сервисы устройства");

    // 4. Ищем нужные характеристики в сервисе fff0
    for (BluetoothService service in services) {
      if (service.uuid.toString() == 'fff0') {
        print('Найден сервис fff0');
        await findCharacteristicsForService(service);
        break;
      }
    }

    // 5. Включаем уведомления и подписываемся на прослушивание в цикле таймера  на фоновой странице

    // Успешное подключение, переключаем на режим чтения
    mode_Ext = only_read_mode;
    FFAppState().readmode = 55; // устанавливаем режим чтения
    device_connect_on_servise = true; // Устройство готово для чтения/записи
    my_characteristic = notifyCharacteristic;

    onNotifyPressed(notifyCharacteristic); // Включаем уведомления

    print('Процесс подключения и обработки данных завершён.');

    //}
  } else {
    print('Устройство с ID $deviceId не найдено.');
  }
}

// Глобальные переменные для буферов характеристик
BluetoothCharacteristic? writeCharacteristic; // Для записи (fff2)
BluetoothCharacteristic? notifyCharacteristic; // Для уведомлений (fff1)

// Функция поиска характеристик
Future<void> findCharacteristicsForService(BluetoothService service) async {
  // Проходим по всем характеристикам в сервисе
  for (BluetoothCharacteristic characteristic in service.characteristics) {
    if (characteristic.uuid.toString() == 'fff2') {
      // Характеристика для записи
      writeCharacteristic = characteristic;

      var my_writeCharacteristicbuf;
      my_writeCharacteristicbuf = writeCharacteristic;

      addCharacteristicToList(writeCharacteristicsStruct, idKeyWrite,
          FFAppState().selectedDeviceId, my_writeCharacteristicbuf);

      //    print('Найдена характеристика для записи: ${characteristic.uuid}');
    } else if (characteristic.uuid.toString() == 'fff1' &&
        characteristic.properties.notify) {
      // Характеристика для уведомлений
      notifyCharacteristic = characteristic;

      var my_readCharacteristicbuf;
      my_readCharacteristicbuf = notifyCharacteristic;

      // addCharacteristicToList(writeCharacteristicsStruct, my_writeCharacteristicbuf);

      addCharacteristicToList(readCharacteristicsStruct, idKeyRead,
          FFAppState().selectedDeviceId, my_readCharacteristicbuf);

      //    print('Найдена характеристика для уведомлений: ${characteristic.uuid}');
    }
  }
}

// ------------------------------ Конец  использования функций  для SPP ------------------------------

// пример  printAllDeviceIds();  // Выведет список всех ID устройств, найденных при сканировании

//---------------------------------------------------------------------------------

// Функция для подключения к устройству по его ID
Future<void> connectToDeviceById(String deviceId) async {
  try {
    // Ищем устройство с данным ID в буфере
    var deviceToConnect = bluetoothDevicesBuffer.firstWhere(
      (device) => device['id'] == deviceId,
    );

    // Если устройство найдено
    ScanResult scanResult =
        deviceToConnect['scanResult']; // Извлекаем ScanResult

    // Пытаемся подключиться к устройству
    await connectToDevice(scanResult);
    print("Подключен к устройству с ID: $deviceId");
  } catch (e) {
    // Если устройство с данным ID не найдено
    print("Устройство с ID $deviceId не найдено.");
  }
}

// Функция для получения ID подключенного устройства
Future<BluetoothDevice?> getConnectedDevice() async {
  // Получаем список всех подключенных устройств
  List<BluetoothDevice> connectedDevices =
      await FlutterBluePlus.connectedDevices;

  // Проверяем, есть ли подключенные устройства
  if (connectedDevices.isNotEmpty) {
    // Выводим отладочное сообщение с ID подключенного устройства
    debugPrint("Подключенное устройство: ${connectedDevices.first.id}");

    // Возвращаем первое подключенное устройство
    return connectedDevices.first;
  }

  return null; // Если нет подключенных устройств
}

//String deviceId = "your-device-id";  // Замените на фактический ID устройства
//connectToDeviceById(deviceId);

//------------------------------ Функция для получения сервисов после подключения:

List<BluetoothService> availableServices =
    []; // Глобальный массив для хранения доступных сервисов

Future<void> getServicesAfterConnection() async {
  // Проверяем, подключено ли устройство
  if (my_devise != null) {
    // Получаем список всех сервисов устройства и сохраняем их в глобальный массив
    availableServices = await my_devise.discoverServices();
    debugPrint("Список доступных сервисов получен.");

    // Логируем все сервисы
    for (var service in availableServices) {
      debugPrint("Найден сервис: ${service.uuid}");
    }
  } else {
    debugPrint("Устройство не подключено.");
  }
}

// Функция для выбора и работы с конкретным сервисом

Future<void> connectToServiceById(String serviceUuid) async {
  // Ищем сервис по UUID в глобальном списке доступных сервисов
  BluetoothService? serviceToConnect;
  try {
    serviceToConnect = availableServices.firstWhere(
      (service) => service.uuid.toString() == serviceUuid,
    );
  } catch (e) {
    serviceToConnect = null; // Если сервис не найден, присваиваем null
  }

  // Проверяем, что сервис найден
  if (serviceToConnect != null && serviceToConnect.characteristics.isNotEmpty) {
    debugPrint("Подключаемся к сервису: $serviceUuid");

    // Здесь можно работать с характеристиками этого сервиса
    for (var characteristic in serviceToConnect.characteristics) {
      debugPrint("Найденная характеристика: ${characteristic.uuid}");
      // Можно выполнить действия с характеристиками, например, чтение/запись
    }
  } else {
    debugPrint("Сервис с UUID $serviceUuid не найден.");
  }
}

//-------------------------------------------------------------------------------------

//---------Функция для подключения по ID с выбором определенного сервиса

Future<void> connectToDeviceAndProcessSpecificService(
    String deviceId, String targetServiceUUID) async {
  // Ищем устройство в буфере по ID
  var deviceToConnect = bluetoothDevicesBuffer.firstWhere(
    (device) => device['id'] == deviceId,
    orElse: () => {},
  );

  // Проверяем, что устройство найдено и ScanResult не пустое
  if (deviceToConnect.isNotEmpty && deviceToConnect['scanResult'] != null) {
    ScanResult scanResult = deviceToConnect['scanResult'] as ScanResult;

    // Подключаемся к устройству
    await connectToDevice(scanResult);

    // После успешного подключения получаем список сервисов
    List<BluetoothService> services =
        await scanResult.device.discoverServices();

    // Ищем конкретный сервис и характеристику с UUID "ffe4"
    for (BluetoothService service in services) {
      for (BluetoothCharacteristic characteristic in service.characteristics) {
        // Проверяем наличие нужной характеристики
        if (characteristic.uuid.toString() == targetServiceUUID) {
          my_characteristic = characteristic; // Сохраняем характеристику
          debugPrint('Найдена характеристика с UUID $targetServiceUUID');
          // Вы можете добавить логику подключения к сервису здесь, если нужно
          return; // Прерываем после нахождения характеристики
        }
      }
    }

    debugPrint("Характеристика с UUID $targetServiceUUID не найдена.");
  } else {
    debugPrint("Устройство с указанным ID не найдено.");
  }
}

/*
// Подключаемся к устройству по ID и ищем характеристику с UUID "ffe4"
connectToDeviceAndProcessSpecificService("C0:26:DF:12:34:56", "ffe4");

targetServiceUUID — это UUID сервиса или характеристики, к которому нужно подключиться (например, "ffe4").
Функция подключается к устройству по ID, ищет среди доступных сервисов характеристику с заданным UUID и сохраняет её в переменную my_characteristic для дальнейшей работы.


*/

// Функция для отключения от устройства

Future<void> disconnectDevice_speed() async {
  // Проверяем, подключено ли устройство перед отключением
  // if (my_devise != null && device_connect_on_servise == true)

  // if (my_devise != null) {
  //   await my_devise.disconnect();
  // }

  if (device_connect_on_servise == true) {
    // Добавляем задержку в 100 миллисекунд перед отключением

    //буферизируем сигнатуру нужнодевайса по его ID
    my_devise = getDeviceById(FFAppState().selectedDeviceId);

// выведи в консоль сигнатуру
// выведи в консоль ID

    if (my_devise != null) {
      print('Сигнатура устройства: ${my_devise.toString()}');
      print('ID устройства: ${my_devise['id']}');
    } else {
      print('Устройство не найдено.');
    }

    // Выполняем отключение данного устройства
    await my_devise.disconnect();

    await Future.delayed(const Duration(milliseconds: 500));

    // Обнуляем глобальные переменные
    device_connect_on_servise = false; // Устройство отключено
    mode_Ext = scan_connect_mode; // Возвращаемся в режим сканирования

    FFAppState().readmode =
        0; //запрещаем таймеру  на Главной странице для постоянного чтения и обмена данными

    print('Устройство успешно отключено.');
  } else {
    print('Нет подключенного устройства для отключения.');
  }
}

// Антизависалка

// Функция-обёртка для выполнения задачи с тайм-аутом

/*
Future<void> WorkWithTimeout(
    Future<void> Function() connectFunction, // Передаем саму функцию
    {required int timeoutMs} // Тайм-аут в миллисекундах
    ) async {
  // Используем Completer для тайм-аута
  Completer<void> completer = Completer<void>();

  // Запускаем таймер для тайм-аута
  Timer timeoutTimer = Timer(Duration(milliseconds: timeoutMs), () {
    if (!completer.isCompleted) {
      completer.completeError(TimeoutException(
          "Операция превысила время ожидания в $timeoutMs мс."));
    }
  });

  try {
    // Используем Future.any для ожидания либо завершения задачи, либо тайм-аута
    await Future.any([
      connectFunction(), // Выполнение вашей функции
      completer.future, // Либо тайм-аут с ошибкой
    ]);
    timeoutTimer.cancel(); // Отменяем таймер, если задача завершена вовремя
  } catch (e) {
    print("Ошибка при выполнении: $e");
  }
}
*/

Future<int> WorkWithTimeout(
  Future<void> Function() action, {
  required int timeoutMs,
  int maxRetries = 3, // Максимальное количество попыток
}) async {
  final completer = Completer<int>();
  int attempt = 0;
  bool isConnected = false;

  Future<void> tryConnect() async {
    while (attempt < maxRetries && !isConnected) {
      attempt++;
      try {
        debugPrint("Попытка подключения #$attempt");
        await action(); // Выполняем основное действие (my_devise.connect)
        isConnected =
            await my_devise.isConnected; // Проверяем статус соединения

        if (isConnected) {
          debugPrint("Устройство успешно подключено после попытки #$attempt");
          completer.complete(1); // Успешное подключение
          return;
        }
      } catch (e) {
        debugPrint("Ошибка в попытке #$attempt: $e");
      }

      // Небольшая задержка перед следующей попыткой
      if (attempt < maxRetries) {
        //await Future.delayed(Duration(milliseconds: 200));
        // await Future.delayed(Duration(milliseconds: 100));
        await Future.delayed(Duration(milliseconds: 25));
      }
    }

    if (!isConnected) {
      debugPrint("Устройство не удалось подключить за $maxRetries попыток.");
      completer.complete(2); // Подключение не удалось
    }
  }

  // Ограничиваем время работы таймаутом
  final timeout = Future.delayed(Duration(milliseconds: timeoutMs), () {
    if (!completer.isCompleted) {
      debugPrint("Время таймаута $timeoutMs мс истекло.");
      completer.complete(2); // Таймаут считается неудачей
    }
  });

  // Ожидаем завершения подключения или истечения таймаута
  await Future.any([tryConnect(), timeout]);

  return completer.future; // Возвращаем результат подключения
}

Future<void> SyncWorkWithTimeout(
    Future<void> Function() connectFunction, // Передаем саму функцию
    {required int timeoutMs} // Тайм-аут в миллисекундах
    ) async {
  // Переменная для отслеживания статуса выполнения
  bool isCompleted = false;

  // Запускаем таймер для тайм-аута
  Timer timeoutTimer = Timer(Duration(milliseconds: timeoutMs), () {
    if (!isCompleted) {
      print("Ошибка: операция превысила время ожидания в $timeoutMs мс.");
    }
  });

  try {
    // Вызываем функцию подключения

    connectFunction();

    isCompleted = true; // Устанавливаем флаг завершения при успехе
    timeoutTimer.cancel(); // Останавливаем таймер, если подключение завершилось
  } catch (e) {
    print("Ошибка подключения: $e");
  }
}

//------------------------------------------------------

// Функция для добавления устройства в буфер и возврата его копии
dynamic addToBuffer(var device) {
  if (device != null) {
    bluetoothDevicesBuffer.add(device); // Добавляем в буфер
    return device; // Возвращаем то же самое устройство без изменений
  }
  return null; // Если устройство null
}
// ищем все данные и сигнатуры из результата сканирвоания по ID устройства

Map<String, dynamic>? getDeviceById(String deviceId) {
  // Ищем устройство в буфере bluetoothDevicesBuffer по переданному ID
  for (var device in bluetoothDevicesBuffer) {
    if (device['id'] == deviceId) {
      return device; // Если устройство найдено, возвращаем его
    }
  }
  return null; // Если устройство не найдено, возвращаем null
}

dynamic findDeviceById(String deviceId, var bluetoothDevicesBuffer) {
  dynamic scanResultDevice;

  // Ищем устройство по заданному ID
  for (var device in bluetoothDevicesBuffer) {
    if (device['id'] == deviceId) {
      // Извлекаем ScanResult из буфера для подключения
      scanResultDevice = device['scanResult'];
      break;
    }
  }

  return scanResultDevice;
}

/*
Функция findFullDeviceById ищет устройство в bluetoothDevicesBuffer по его ID и 
возвращает полную копию данных устройства в виде Map<String, dynamic>.
*/

Map<String, dynamic>? findFullDeviceById(String deviceId) {
  // Ищем устройство по заданному ID в ALLbluetoothDevicesBuffer
  for (var device in ALLbluetoothDevicesBuffer) {
    if (device['id'] == deviceId) {
      return Map<String, dynamic>.from(device); // Возвращаем полную копию
    }
  }
  return null; // Если устройство не найдено
}

// дальше можно использовать для быстрого переподключения или удержания нескольких подключений

/*  ПРИМЕР:

для соединения №1

 my_devise = getDeviceById("50:54:7B:74:B8:BB"); // Сохраняем устройство для возможности дальнейшей работы


 my_devise2 = getDeviceById("50:54:7B:74:77:88"); // Сохраняем устройство для возможности дальнейшей работы




// Ищем устройство по его ID
Map<String, dynamic>? device1 = getDeviceById("50:54:7B:74:B8:BB");
Map<String, dynamic>? device2 = getDeviceById("50:54:7B:74:77:88");

if (device1 != null) {
  // Устройство найдено, можно работать с ним
  print('Устройство 1: ${device1['name']} с RSSI: ${device1['rssi']}');
  my_devise = device1; // Сохраняем в глобальную переменную для работы
} else {
  print('Устройство 1 не найдено');
}

if (device2 != null) {
  // Устройство найдено, можно работать с ним
  print('Устройство 2: ${device2['name']} с RSSI: ${device2['rssi']}');
  my_devise2 = device2; // Сохраняем в глобальную переменную для работы
} else {
  print('Устройство 2 не найдено');
}


// Получаем устройство по ID
var device1 = getDeviceById("50:54:7B:74:B8:BB");
var device2 = getDeviceById("50:54:7B:74:77:88");

if (device1 != null) {
  print('Устройство 1: ${device1['name']} с RSSI: ${device1['rssi']}');
  // Работаем с device1
}

if (device2 != null) {
  print('Устройство 2: ${device2['name']} с RSSI: ${device2['rssi']}');
  // Работаем с device2
}





*/

// Преобразование  типа String  в int

int TempereReadHighByteFromString(String input) {
  // Конвертируем строку в число
  return int.tryParse(input) ?? 0; // Если не удаётся, возвращаем 0
}

int TempereReadLowByteFromString(String input) {
  // Конвертируем строку в число
  return int.tryParse(input) ?? 0; // Если не удаётся, возвращаем 0
}

int IntFromString(String input) {
  // Конвертируем строку в число
  return int.tryParse(input) ?? 0; // Если не удаётся, возвращаем 0
}

// Преобразование  типа int в String

String TempereReadHighByteToString(int input) {
  if (input < -40 || input > 90) {
    // Если значение вне диапазона, возвращаем "--"
    return '--';
  }
  // Если значение в пределах диапазона, конвертируем в строку
  return input.toString();
}

String TempereReadLowByteToString(int input) {
  if (input < -40 || input > 90) {
    // Аналогично для Low Byte
    return '--';
  }
  return input.toString();
}

//--------------------------------------------------для перобразования температуры---------------------------------

int tempWhole = 0; // Глобальная переменная для целой части температуры
int tempHalf = 0; // Глобальная переменная для половинки градуса (0 или 5)

void convertTemperature(int setupTemp) {
  tempWhole = setupTemp ~/ 10; // Целая часть температуры
  tempHalf = (setupTemp % 10) == 5 ? 5 : 0; // Половинка градуса (5 или 0)

  print(" DaysSheduller END ");
}

int combineTemperature(int tempWhole, int tempHalf) {
  if (tempWhole < 0) {
    return (tempWhole * 10) -
        (tempHalf == 5 ? 5 : 0); // Вычитаем 5, если число отрицательное
  } else {
    return (tempWhole * 10) + (tempHalf == 5 ? 5 : 0);
  }
}

int convertToTemperatureInt(double temperature) {
  return (temperature * 10).round();
}

double roundToNearestHalf(double value) {
  return (value * 2).round() / 2.0;
}

//функция, которая принимает целую и дробную части температуры (tempWhole и tempHalf)
//и возвращает значение в формате float:
double combineToFloat(int tempWhole, int tempHalf) {
  // Проверяем, что дробная часть находится в допустимом диапазоне
  if (tempHalf < 0 || tempHalf >= 10) {
    throw ArgumentError('Дробная часть должна быть в диапазоне от 0 до 9');
  }
  // Возвращаем объединённое значение в виде float
  return tempWhole + (tempHalf / 10.0);
}

//  зона глобальных переменных для этого файла

ScanResult? globalScanResult; // Глобальная переменная для хранения ScanResult
var my_services; // Глобальная переменная для хранения сервисов устройства

bool inverse_mode = false;
int globalInt = 0;
bool globalBoolean = true;
String globalString = "";

String myID2 = "";

double globalDouble = 10.0;
bool scanready = false;
bool scanready2 = false;
int timestamp = 0;
var my_devise;
var my_devise2;

var notify_buf;
var notify_buf1;
var my_characteristic;
var my_write_characteristic1;
var my_write_characteristic2;
var my_characteristic2;
int mydebug = 0;
bool only_read_mode = true;
bool scan_connect_mode = false;
bool mode_Ext = false;
bool start_notify = false;
var Characteristic_UUID;
bool newtime = false;
bool device_connect_on_servise = false;

int list_val_test = 0;

int chanell = 0;

//-------------------------------  Структуры для BLE --------------------------------

bool isWritten = false; // Флаг для контроля записи

var my_devise_1,
    my_devise_2,
    my_devise_3,
    my_devise_4,
    my_devise_5,
    my_devise_6,
    my_devise_7,
    my_devise_8,
    my_devise_9; // итд

// ИЛИ КАК???

//var my_devise_N = List<dynamic>.generate(10, (index) => null);  // Инициализируем список с типом dynamic из 10 элементов

var my_device_N = <dynamic>[]; // Изначально пустой список

int device_connect_status = 0;

int packet_count = 0, tempere_lowByte = 0, tempere_HigthByte = 0;

bool connect_status_busy = false;

//List<int> dataToWrite = [1];

//универсальній формат любого масисива
//List<int> intBuffer = List<T>.filled(length, initialValue);
// или в явном виде:

List<int> dataToWrite =
    List<int>.filled(10, 0); // Список int, длиной 10, инициализированный нулями

int setup_temp = 0;

BluetoothDevice getDeviceFromScanResult(ScanResult r) {
  return r.device; // Возвращаем устройство из ScanResult
}

String getDeviceIdFromDetails(BluetoothDevice myDevice) {
  print(" функция getDeviceIdFromDetails  вывод тест'}");
  print("remoteId: ${myDevice.remoteId ?? 'Нет значения'}");
  // Возвращаем значение remoteId как строку
  return myDevice.remoteId.toString();
}

String getDeviceNameFromDetails(BluetoothDevice myDevice) {
  print(" функция getDeviceNameFromDetails  вывод тест'}");
  print("name: ${myDevice.name ?? 'Нет значения'}");
  // Возвращаем значение remoteId как строку
  return myDevice.name.toString();
}

void printMyDeviceDetails(BluetoothDevice myDevice) {
  print("Функция printMyDeviceDetails: вывод информации об устройстве");

  // Основные доступные свойства
  print("remoteId: ${myDevice.remoteId ?? 'Нет значения'}");
  print("name: ${myDevice.name ?? 'Нет значения'}");
  //print("type: ${myDevice.type ?? 'Нет значения'}");
  print("isConnected: ${myDevice.isConnected ?? 'Нет значения'}");
  print("mtuNow: ${myDevice.mtuNow ?? 'Нет значения'}");

  // Список доступных сервисов
  print("services: ${myDevice.services?.length ?? 'Нет значения'}");

  print("Функция printMyDeviceDetails завершена");
}

/// Функция parseColor принимает строку с шестнадцатеричным значением цвета в формате `#RRGGBB` или `#AARRGGBB`
/// и преобразует её в объект Color.
///
/// Пример использования:
/// - `#39D2C0` — будет автоматически интерпретирован как непрозрачный цвет с добавлением `FF`
/// - `#0039D2C0` — цвет с 0% непрозрачности (полностью прозрачный)
/// - `#FF39D2C0` — цвет с 100% непрозрачности
///
/// Аргументы:
/// - `hexColor` (String): шестнадцатеричное значение цвета, начиная с `#`
///
/// Возвращает:
/// - Объект Color, который можно использовать для присвоения цвета в Flutter
///

Color parseColor(String hexColor) {
  // Удаляем символ "#" в начале строки, если он присутствует
  hexColor = hexColor.replaceFirst('#', '');

  // Проверяем длину hexColor и добавляем непрозрачность, если она отсутствует
  if (hexColor.length == 6) {
    // Добавляем FF для 100% непрозрачности
    hexColor = 'FF$hexColor';
  }

  // Конвертируем строку в Color и возвращаем результат
  return Color(int.parse('0x$hexColor'));
}

// Рекурсивная функция для вывода всех деталей устройства
void printDeviceDetails(Map<String, dynamic> device, {int indent = 0}) {
  final indentStr = ' ' * indent;
  device.forEach((key, value) {
    if (value is Map<String, dynamic>) {
      print("$indentStr$key:");
      printDeviceDetails(value, indent: indent + 2);
    } else if (value is List) {
      print("$indentStr$key: [");
      for (var item in value) {
        if (item is Map<String, dynamic>) {
          printDeviceDetails(item, indent: indent + 2);
        } else {
          print('$indentStr  $item');
        }
      }
      print("$indentStr]");
    } else {
      print("$indentStr$key: $value");
    }
  });
}

void printDetailsForDeviceById(String targetDeviceId) {
  try {
    var device1 = ALLbluetoothDevicesBuffer.firstWhere(
      (device1) => device1['id'] == targetDeviceId,
    );

    printDeviceDetails(device1);
  } catch (e) {
    print("Устройство с ID $targetDeviceId не найдено.");
  }
}

void compareDeviceDetails(String targetDeviceId, ScanResult r) {
  try {
    // Получаем устройство из ALLbluetoothDevicesBuffer по ID
    var deviceFromBuffer = ALLbluetoothDevicesBuffer.firstWhere(
      (device) => device['id'] == targetDeviceId,
    );

    print("Детали устройства из буфера:");
    printDeviceDetails(deviceFromBuffer);

    print("\nДетали устройства r.device:");
    // Преобразуем r.device в Map<String, dynamic>, если это возможно
    var deviceDetails = {
      'id': r.device.id.toString(),
      'name': r.device.name,
      // добавьте остальные поля, доступные для r.device
    };
    printDeviceDetails(deviceDetails);
  } catch (e) {
    print("Устройство с ID $targetDeviceId не найдено.");
  }
}

//-------------------ГЛОБАЛЬНЫЙ ОНОВЫЙ ТАЙМЕР---------------------------------

Timer? _backgroundTimer; // Глобальная переменная для таймера

/// Инициализация таймера
void startBackgroundTimer({required int intervalMs}) {
  // Проверяем, не запущен ли таймер уже
  if (_backgroundTimer != null && _backgroundTimer!.isActive) {
    debugPrint("Таймер уже запущен.");
    return;
  }

  // Запускаем таймер
  _backgroundTimer =
      Timer.periodic(Duration(milliseconds: intervalMs), (timer) {
    _onTimerTick(); // Вызываем обработчик событий
  });

  debugPrint("Таймер запущен с интервалом $intervalMs мс.");
}

/// Остановка таймера
void stopBackgroundTimer() {
  if (_backgroundTimer != null) {
    _backgroundTimer!.cancel();
    _backgroundTimer = null;
    debugPrint("Таймер остановлен.");
  } else {
    debugPrint("Таймер не запущен, нечего останавливать.");
  }
}

/// Обработчик таймера, вызывающий пользовательский код
void _onTimerTick() {
  debugPrint("Обработчик таймера: ${DateTime.now()}");
  // Ваш пользовательский код здесь
}

List<String> globalDeviceIds = []; // Глобальный список ID
int globalDeviceIndex = 0; // Глобальный указатель

Future<void> updateGlobalDeviceIds() async {
  globalDeviceIds = FFAppState()
      .ListOfMyDevice1
      .map((device) => device.id)
      .where((id) => id != null)
      .toList();

  // print('Обновлён список ID: $globalDeviceIds');
}

List<String> globalDeviceIdsV2 = []; // Глобальный список ID
int globalDeviceIndexV2 = 0; // Глобальный указатель

Future<void> updateGlobalDeviceIdsV2() async {
  globalDeviceIdsV2 = FFAppState()
      .ListOfMyDevice1
      .map((device) => device.id)
      .where((id) => id != null)
      .toList();

  // print('Обновлён список ID: $globalDeviceIds');
}

//-------------------------------------------------------------------------------
List<String> globalDeviceIdsV3 = []; // Новый список только активных устройств
List<String> previousGlobalDeviceIdsV3 = []; // Предыдущее состояние списка

Future<void> updateGlobalDeviceIdsV3() async {
  // Формируем список только активных устройств
  List<String> newDeviceIds = globalDeviceIdsV2.where((deviceId) {
    int deviceStatus = readListOfMyDevice1Field(deviceId, 'statusConnectState');
    return deviceStatus == 1; // Устройство активно
  }).toList();

  // Проверяем, изменился ли список
  if (!listEquals(globalDeviceIdsV3, newDeviceIds)) {
    globalDeviceIdsV3 = newDeviceIds; // Обновляем список

    // Если список обновился и не пустой
    if (globalDeviceIdsV3.isNotEmpty) {
      print(
          'Обновлён список активных устройств: $globalDeviceIdsV3'); // Со скобками
      print(
          'Обновлён список активных устройств: ${globalDeviceIdsV3.join(', ')}'); // Без скобок
    }
  }
}

// Сравнение двух списков на равенство
bool listEquals(List<String> list1, List<String> list2) {
  if (list1.length != list2.length) return false;
  for (int i = 0; i < list1.length; i++) {
    if (list1[i] != list2[i]) return false;
  }
  return true;
}
//--------------------------------------------------------------------------------------

// РАБОТАЕТ

Future<void> processNextDevice() async {
  // Если список ID пустой — ничего не делаем
  if (globalDeviceIds.isEmpty) {
    // print('Нет устройств для обработки');
    return;
  }

  var scan_my_devise, local_scanResultDevice;

  // Инкрементируем указатель
  globalDeviceIndex = (globalDeviceIndex + 1) % globalDeviceIds.length;

  int local_device_connect_status = 0;

  // Получаем ID текущего устройства

  String? currentDeviceId = await getCurrentDeviceId();

  if (currentDeviceId == null) {
    print('Ошибка: currentDeviceId оказался null');
    return;
  }

  // print('Текущий ID для обработки: $currentDeviceId');

  local_scanResultDevice =
      findDeviceById(currentDeviceId, ALLbluetoothDevicesBuffer);
  scan_my_devise = getDeviceFromScanResult(local_scanResultDevice);

  local_device_connect_status = await checkDeviceConnectionStatus(
      scan_my_devise); // проверка статуса подключения после подключения

  // print('=== processAllDevices  Проверка конечного списка ===');

  updateDeviceStatus(currentDeviceId, local_device_connect_status);

  // Асинхронно обрабатываем устройство
}

// чтение данных от термостата по конкретному ID

Future<void> processNextDeviceReadData() async {
  // Если список ID пустой — ничего не делаем
  if (globalDeviceIds.isEmpty) {
    // print('Нет устройств для обработки');
    return;
  }

  var scan_my_devise, local_scanResultDevice;

  // Инкрементируем указатель
  // globalDeviceIndex = (globalDeviceIndex + 1) % globalDeviceIds.length;

  int local_device_connect_status = 0;

  // Получаем ID текущего устройства

  //String? currentDeviceId = await getCurrentDeviceIdV2();

  String? currentDeviceId = FFAppState()
      .selectedDeviceId; // в режиме переподключения на выбраные в литс вью девайс

  myID2 = currentDeviceId;

  local_scanResultDevice =
      findDeviceById(currentDeviceId, ALLbluetoothDevicesBuffer);

  scan_my_devise = getDeviceFromScanResult(local_scanResultDevice);

//-----------------------------------------------------------------------------

//String myID;

  local_device_connect_status = readListOfMyDevice1Field(
      myID2, // читаем статус из ссотояния Лист вью
      'statusConnectState');

//  local_device_connect_status = 1;

  if (local_device_connect_status == 1) {
    streamSubscriptionV2(scan_my_devise);
    //debugPrint('Новое значение    myID   : ${myID}');
  }
  // Асинхронно обрабатываем устройство

  // Инкрементируем указатель для режма  одновременно подключения - нужно отлаживатьчя есть ошибки

  // globalDeviceIndexV2 = (globalDeviceIndexV2 + 1) % globalDeviceIdsV2.length;
}

Future<void> handleDeviceById(String deviceId) async {
  // Находим устройство в буфере
  var scanResultDevice = findDeviceById(deviceId, ALLbluetoothDevicesBuffer);
  if (scanResultDevice == null) {
    print('Устройство $deviceId не найдено в буфере');
    return;
  }

  var myDevice = scanResultDevice.device;

  // Проверяем статус подключения
  var deviceConnectStatus = await checkDeviceConnectionStatus(myDevice);

  // Обновляем статус и цвет
  if (deviceConnectStatus == 2) {
    updateListOfMyDevice1Field(deviceId, 'statusConnectState', "Disconnected");
    updateListOfMyDevice1Field(
        deviceId, 'statusConnectColor', parseColor("#E1DDDD"));
    print('Устройство $deviceId: Disconnected');
  } else if (deviceConnectStatus == 1) {
    updateListOfMyDevice1Field(deviceId, 'statusConnectState', "Connected");
    updateListOfMyDevice1Field(
        deviceId, 'statusConnectColor', parseColor("#39D2C0"));
    print('Устройство $deviceId: Connected');
  }
}

Future<void> processAllDevices() async {
  // print(
  //   'Начинаем обработку всех устройств, количество: ${globalDeviceIds.length}');

  // Последовательно обрабатываем все устройства
  for (int i = 0; i < globalDeviceIds.length; i++) {
    await processNextDevice(); // Вызываем твою функцию для каждого устройства
  }

  // print('Обработка всех устройств завершена');
}

Future<void> processAllDevicesRead() async {
  // Если список ID пустой — ничего не делаем
  if (globalDeviceIdsV2.isEmpty) {
    //  print('Нет устройств для обработки');
    return;
  }

  // print(
  //   'Начинаем обработку всех устройств, количество: ${globalDeviceIds.length}');

  // Последовательно обрабатываем все устройства
  for (int i = 0; i < globalDeviceIdsV2.length; i++) {
    //await processNextDevice(); // Вызываем твою функцию для каждого устройства
    await processNextDeviceReadData();
  }

  // print('Обработка всех устройств завершена');
}

Future<String> getCurrentDeviceId() async {
  if (globalDeviceIds.isEmpty) {
    print('Список ID пуст. Возвращаем значение по умолчанию.');
    return ''; // Возвращаем пустую строку, чтобы избежать null
  }

  // Имитируем асинхронный доступ
  //await Future.delayed(Duration(milliseconds: 1)); // Минимальная задержка
  return globalDeviceIds[globalDeviceIndex];
}

Future<String> getCurrentDeviceIdV2() async {
  if (globalDeviceIdsV2.isEmpty) {
    print('Список ID пуст. Возвращаем значение по умолчанию.');
    return ''; // Возвращаем пустую строку, чтобы избежать null
  }

  // Имитируем асинхронный доступ
  //await Future.delayed(Duration(milliseconds: 1)); // Минимальная задержка
  return globalDeviceIdsV2[globalDeviceIndexV2];
}

void setupCustomErrorHandling() {
  FlutterError.onError = (FlutterErrorDetails details) {
    // Фильтруем ошибки, связанные с google_fonts
    if (details.exceptionAsString().contains('google_fonts') ||
        details.exceptionAsString().contains('Failed to load font') ||
        details.exceptionAsString().contains('SocketException') ||
        details.exceptionAsString().contains('Failed host lookup')) {
      return; // Пропускаем эти сообщения
    }

    // Обрабатываем остальные ошибки
    FlutterError.dumpErrorToConsole(details);
  };

  print('Custom error handling setup complete');
}

void disableSystemLogs() {
  final originalDebugPrint = debugPrint;

  debugPrint = (String? message, {int? wrapWidth}) {
    if (message == null) return;

    // Фильтруем системные логи
    if (message.contains('ERROR:flutter') || message.contains('E/flutter')) {
      // Игнорируем системные сообщения
      return;
    }

    // Выводим только пользовательские сообщения
    originalDebugPrint(message, wrapWidth: wrapWidth);
  };
}

void suppressSpecificError() {
  FlutterError.onError = (FlutterErrorDetails details) {
    if (details.exceptionAsString().contains('No host specified in URI')) {
      // Игнорируем ошибку
      return;
    }
    FlutterError.presentError(details);
  };
}

//List<Map<String, dynamic>> writeCharacteristicsStruct = [];

var readCharacteristicsStruct = <dynamic>[]; // Изначально пустой список
var writeCharacteristicsStruct = <dynamic>[]; // Изначально пустой список

var idKeyWrite = <dynamic>[];
var idKeyRead = <dynamic>[];

void addCharacteristicToList(
    List<dynamic> dataBuffer, List<dynamic> idBuffer, String id, dynamic data) {
  // Проверяем, содержит ли dataBuffer уже такое же значение
  if (!dataBuffer.any((item) => item.toString() == data.toString())) {
    dataBuffer.add(data); // Добавляем уникальные данные
    idBuffer.add(id); // Добавляем соответствующий ID
  }
}

int? getIndexById(List<dynamic> idBuffer, String id) {
  // Ищем индекс переданного ID
  return idBuffer.indexOf(id);
}

dynamic getCharacteristicById(
    List<dynamic> dataBuffer, List<dynamic> idBuffer, String id) {
  // Получаем индекс для указанного ID
  int? index = getIndexById(idBuffer, id);

  // Проверяем, найден ли индекс
  if (index != -1 && index != null) {
    return dataBuffer[index]; // Возвращаем объект из основного массива
  }

  return null; // Возвращаем null, если ID не найден
}

// ДЛЯ уменьшения износа пмаяти ЛИСТ ВЬЮ списка девайсов

void updateDeviceStatus(String deviceId, int newStatus) {
  // Считываем текущее сохранённое состояние устройства
  int currentStatus = readListOfMyDevice1Field(deviceId, 'statusConnectState');

  // Проверяем, изменился ли статус
  if (currentStatus != newStatus) {
    // Определяем цвет на основе нового статуса
    String newColor;
    if (newStatus == 1) {
      // Бирюзовый цвет для коннекта
      newColor = "#39D2C0";

      // Промежуточный код, если потребуется
      // print('Устройство подключено: $deviceId');

      updateListOfMyDevice1Field(
          deviceId, 'onOffKnobState', 0); // готово к отключению
      updateListOfMyDevice1Field(deviceId, 'onOffKnobValue', 'on');

// обновляем глобальную перменную статуса устрйотсва (его НАДПИСИ ) для отображения ВНТРИ ДЕВАЙСА
      FFAppState().OnOffKnobValueBufer = 'on';
    } else {
      // Светло-серый цвет для дисконнекта
      newColor = "#E1DDDD";

// также сбрасываем ПРИЦЕПОМ надпись и сотсояние кнопки в ИСХОДНОЕ
      updateListOfMyDevice1Field(deviceId, 'onOffKnobValue', 'off');

// обновляем глобальную перменную статуса устрйотсва (его НАДПИСИ ) для отображения ВНТРИ ДЕВАЙСА
      FFAppState().OnOffKnobValueBufer = 'off';

      updateListOfMyDevice1Field(
          deviceId, 'onOffKnobState', 1); // готово к подключению

      // Промежуточный код, если потребуется
      //print('Устройство отключено: $deviceId');
    }

    // Обновляем статус соединения
    FFAppState().StatusConnectState = newStatus;

    print(' FFAppState().StatusConnectState: $FFAppState().StatusConnectState');

    updateListOfMyDevice1Field(
        deviceId, // Обновили значение в ЛИСТ ВЬЮ данного девайса
        'statusConnectState',
        FFAppState().StatusConnectState);

    // Обновляем цвет состояния
    updateListOfMyDevice1Field(
        deviceId, // Обновили значение в ЛИСТ ВЬЮ данного девайса
        'statusConnectColor',
        parseColor(newColor));

// обновляем глобальную перменную статуса устрйотсва (его цвета ) для отображения ВНТРИ ДЕВАЙСА

    FFAppState().StatusConnectColorBufer = parseColor(newColor);
  } else {
    // Промежуточный код, если статус не изменился
    // print('Статус устройства не изменился: $deviceId');
  }
}

//import 'dart:convert'; // Для `jsonDecode()`

void allloadDeviceScheduleToRAM(String deviceId, String targetField) {
  var device = FFAppState().ListOfMyDevice1.firstWhere(
        (device) => device.id == deviceId,
        orElse: () => MyDeviceStruct(),
      );

  // 🔹 Используем переданный `targetField` для выбора массива
  var sourceList = device.toMap()[targetField] as List<dynamic>?;

  // ✅ Очищаем список перед обновлением
  //FFAppState().deviceShedulleList.clear();

  FFAppState().deviceShedulleList = [];

  // ✅ Если список пуст, просто обновляем состояние и выходим
  if (sourceList == null || sourceList.isEmpty) {
    debugPrint('❌ deviceShedulleList очищен, так как $targetField пуст');
    return;
  }

  // ✅ Заполняем новый список с обработкой JSON-строк
  List<SinglIntervalStruct> newScheduleList = [];

  for (var item in sourceList) {
    Map<String, dynamic> map;

    // Если данные хранятся как JSON-строка, декодируем
    if (item is String) {
      try {
        map = jsonDecode(item);
      } catch (e) {
        debugPrint('❌ Ошибка парсинга JSON: $e');
        continue;
      }
    } else {
      map = item as Map<String, dynamic>;
    }

    newScheduleList.add(SinglIntervalStruct.fromMap(map));
  }

  // ✅ Обновляем глобальное состояние и уведомляем UI
  FFAppState().deviceShedulleList = newScheduleList;
  debugPrint(
      '✅ ОБНОВЛЯЕМ deviceShedulleList (${FFAppState().deviceShedulleList.length}) для $targetField');
}

//import 'dart:convert'; // Для `jsonDecode()`
/// ✅ Вариант 3: Универсальный + обработка JSON-строк
/// 🔹 Если данные уже `Map<String, dynamic>`, работаем напрямую.
/// 🔹 Если данные — JSON-строка, сначала декодируем, потом передаём в `fromMap()`.
/// 🔹 Подходит для всех случаев, если структура данных может измениться.

void loadDeviceScheduleToRAM(String deviceId) {
  var device = FFAppState().ListOfMyDevice1.firstWhere(
        (device) => device.id == deviceId,
        orElse: () => MyDeviceStruct(),
      );

  var sourceList = device.toMap()["dayIntervals"] as List<dynamic>?;

  // ✅ Очищаем список перед обновлением
  FFAppState().deviceShedulleList.clear();

  // ✅ Если список пуст, просто обновляем состояние и выходим
  if (sourceList == null || sourceList.isEmpty) {
    debugPrint('❌ deviceShedulleList очищен, так как dayIntervals пуст');
    return;
  }

  // ✅ Заполняем новый список с обработкой JSON-строк
  List<SinglIntervalStruct> newScheduleList = [];

  for (var item in sourceList) {
    Map<String, dynamic> map;

    // Если данные хранятся как JSON-строка, декодируем
    if (item is String) {
      try {
        map = jsonDecode(item);
      } catch (e) {
        debugPrint('❌ Ошибка парсинга JSON: $e');
        continue;
      }
    } else {
      map = item as Map<String, dynamic>;
    }

    newScheduleList.add(SinglIntervalStruct.fromMap(map));
  }

  // ✅ Обновляем глобальное состояние и уведомляем UI
  FFAppState().deviceShedulleList = newScheduleList;
  debugPrint(
      '✅ ОБНОВЛЯЕМ deviceShedulleList: ${FFAppState().deviceShedulleList.length}');
}

/*
 Когда использовать?

    Если sourceList может иногда хранить JSON-строки вместо Map<String, dynamic>.
    Если хочешь автоматическую обработку любых случаев.
    Если данные могут приходить в разном формате в зависимости от версии FlutterFlow.

❌ Когда НЕ использовать?

    Если точно знаешь, что sourceList всегда Map<String, dynamic> (тогда хватит Варианта 2).

*/

//import 'dart:convert'; // Для `jsonDecode()`
/// ✅ Вариант 3: Универсальный + обработка JSON-строк
/// 🔹 Если данные уже `Map<String, dynamic>`, работаем напрямую.
/// 🔹 Если данные — JSON-строка, сначала декодируем, потом передаём в `fromMap()`.
/// 🔹 Подходит для всех случаев, если структура данных может измениться.

void loadDeviceStandartScheduleToRAM(String deviceId) {
  var device = FFAppState().ListOfMyDevice1.firstWhere(
        (device) => device.id == deviceId,
        orElse: () => MyDeviceStruct(),
      );

  var sourceList = device.toMap()["standartDayIntervals"] as List<dynamic>?;

  // ✅ Очищаем список перед обновлением
  FFAppState().deviceShedulleList.clear();

  // ✅ Если список пуст, просто обновляем состояние и выходим
  if (sourceList == null || sourceList.isEmpty) {
    debugPrint(
        '❌ deviceShedulleList очищен, так как standartDayIntervals пуст');
    return;
  }

  // ✅ Заполняем новый список с обработкой JSON-строк
  List<SinglIntervalStruct> newScheduleList = [];

  for (var item in sourceList) {
    Map<String, dynamic> map;

    // Если данные хранятся как JSON-строка, декодируем
    if (item is String) {
      try {
        map = jsonDecode(item);
      } catch (e) {
        debugPrint('❌ Ошибка парсинга JSON: $e');
        continue;
      }
    } else {
      map = item as Map<String, dynamic>;
    }

    newScheduleList.add(SinglIntervalStruct.fromMap(map));
  }

  // ✅ Обновляем глобальное состояние и уведомляем UI
  FFAppState().deviceShedulleList = newScheduleList;
  debugPrint(
      '✅ ОБНОВЛЯЕМ deviceShedulleList: ${FFAppState().deviceShedulleList.length}');
}

// ----------------------------------- ДЕМО РЕЖИМ ------------------------------

void bleScanDemo() {
  bluetoothDevicesBuffer.clear(); // Очищаем буфер перед тестом

// Заполняем  фейковыми девайсами

  bluetoothDevicesBuffer.addAll([
    {
      'id': '00:11:22:33:44:55',
      'name': 'VEGA-LTC 030 : BLE',
      'rssi': -45
    }, // 📡 Устройство с именем
    {
      'id': '66:77:88:99:AA:BB',
      'name': 'VEGA-LTC 070 : BLE',
      'rssi': -50
    }, // 📡 Другое именованное устройство
    {
      'id': 'CC:DD:EE:FF:00:11',
      'name': 'VEGA-LTC 090 : BLE',
      'rssi': -70
    }, // 🔹 Безымянное устройство
  ]);

// ОБНОВЛЯЕМ ЛИСТ ВЬЮ  " СПИСОК УСТРОСТВ"

  FFAppState().ListBleDevice = bluetoothDevicesBuffer
      .map((device) => BleDeviceStruct(
            name: device['name'],
            id: device['id'],
            rssi: device['rssi'],
          ))
      .toList();

  print("🔍 BLE Scan Demo: найдено ${bluetoothDevicesBuffer.length} устройств");
  for (var device in bluetoothDevicesBuffer) {
    print("Имя: ${device['name'].isEmpty ? 'Unnamed Device' : device['name']}, "
        "ID: ${device['id']}, RSSI: ${device['rssi']}");
  }
}

//  ДЛЯ РАБОТЫ С РАСАПИСАНИЕМ  РАБОТАЕТ С ОДНМЕРНЫМИ СПИСКАМИ И ДВУМЕРНЫМИ
/*

updateDeviceShedulleField(FFAppState().selectedDeviceId,"day1IntervalsCustom[$lastIndex].temperatureLowByte", readbufer);

updateDeviceShedulleField(FFAppState().selectedDeviceId,"days[0]dayIntervalsCustom[$lastIndex].timeMinut",readbufer); 


*/

// групповое обновление
void batchUpdateShedulle(String deviceId, Map<String, dynamic> updates) {
  int index = FFAppState().myDeviceShedulle.indexWhere((s) => s.id == deviceId);
  if (index == -1) return; // Если не найдено – выходим

  // 🔹 Берём текущий объект и превращаем в Map
  Map<String, dynamic> updatedSchedule =
      FFAppState().myDeviceShedulle[index].toMap();

  int totalLength = updates.entries.fold(0,
      (prev, entry) => prev + entry.key.length + entry.value.toString().length);

  print("Общая длина ключей и значений: $totalLength");

  // 🔹 Применяем все обновления сразу
  updates.forEach((field, value) {
    print("🔍 field length = ${field.length}, field = '$field'");

    if (field.contains("[")) {
      updatedSchedule = analyzeShedulleBaseField(updatedSchedule, field, value);
    } else {
      updatedSchedule[field] = value;
    }
  });

  // 🔹 Перезаписываем всю структуру в списке
  FFAppState().myDeviceShedulle[index] =
      DeviceShedulleStruct.fromMap(updatedSchedule);
}

// одиночно обновление
//-----------------------------------------------------------------------
void updateDeviceShedulleField(
    String deviceId, String targetField, dynamic newValue) {
  int index = FFAppState().myDeviceShedulle.indexWhere((s) => s.id == deviceId);
  if (index == -1) return; // Если не найдено – выходим

  FFAppState().updateMyDeviceShedulleAtIndex(
    index,
    (oldSchedule) {
      Map<String, dynamic> updatedSchedule = oldSchedule.toMap();

      if (targetField.contains("[")) {
        // Если сложное поле (например, dayIntervals1[2].startTime)
        updatedSchedule =
            analyzeShedulleBaseField(updatedSchedule, targetField, newValue);

        // print("🎯 Финальная структура: $updatedSchedule");
      } else {
        // Простое поле – обновляем напрямую
        updatedSchedule[targetField] =
            newValue; //вот тут не переобноялет финишное одиночное поле
      }

      // Возвращаем обновлённую структуру без ручного перечисления всех полей
      return DeviceShedulleStruct.fromMap(updatedSchedule);
    },
  );
}

//-----------------------------------------------------------------------

// NEW

Map<String, dynamic> analyzeShedulleBaseField(
    Map<String, dynamic> updatedSchedule,
    String targetField,
    dynamic newValue) {
  Map<String, dynamic> route = parseTargetField(targetField);
  Map<String, dynamic>? block1 = route["block1"];
  Map<String, dynamic>? block2 = route["block2"];
  String finalKey = route["finalKey"];

  Map<String, dynamic> nestedMap = updatedSchedule;

  // 🔹 БЛОК 1 (Первый уровень вложенности) - Определяем день
  if (block1 != null) {
    String key = block1["key"];
    int index = block1["index"];

    //   print("🔹 БЛОК 1: Работаем с ключом `$key`, индекс `$index`");

    if (nestedMap[key] == null) {
      //  print("🟢 `nestedMap[$key]` отсутствует. Создаём новый список.");
      //nestedMap[key] = [];
    } else if (nestedMap[key] is! List) {
      //   print(
      //        "❌ Ошибка: `nestedMap[$key]` уже содержит объект, но должен быть список! Пропускаем запись.");
      return updatedSchedule;
    }

    List<Map<String, dynamic>> list =
        (nestedMap[key] as List?)?.cast<Map<String, dynamic>>() ?? [];

    //   print("🔹 `nestedMap[$key]` сейчас: $list");

    // ✅ Если `index` больше длины списка — добавляем недостающие элементы
    while (list.length <= index) {
      list.add({});
      //     print("🟢 Добавлен новый объект в `nestedMap[$key][$list.length - 1]`");
    }

    nestedMap[key] = list;
    nestedMap =
        list[index]; // ✅ Теперь `nestedMap` указывает на объект в списке
  }

  // 🔹 БЛОК 2 (Второй уровень вложенности) - Определяем `dayIntervalsCustom` или `dayIntervalsStandart`
  if (block2 != null) {
    String key = block2["key"];
    int index = block2["index"];

    //   print("🔹 БЛОК 2: Работаем с ключом `$key`, индекс `$index`");

    if (nestedMap[key] == null) {
      //   print("🟢 `nestedMap[$key]` отсутствует. Создаём новый список.");
      //  nestedMap[key] = [];
    } else if (nestedMap[key] is! List) {
      //   print(
      //       "❌ Ошибка: `nestedMap[$key]` уже содержит объект, но должен быть список! Пропускаем запись.");
      return updatedSchedule;
    }

    List<Map<String, dynamic>> list =
        (nestedMap[key] as List?)?.cast<Map<String, dynamic>>() ?? [];

    //   print("🔹 `nestedMap[$key]` сейчас: $list");

    // ✅ Если `index` больше длины списка — добавляем недостающие элементы
    while (list.length <= index) {
      list.add({});
      //    print("🟢 Добавлен новый объект в `nestedMap[$key][$list.length - 1]`");
    }

    nestedMap[key] = list;
    nestedMap =
        list[index]; // ✅ Теперь `nestedMap` указывает на объект в списке

    // 🔥 ОБНОВЛЯЕМ СПИСОК ПЕРЕД ВОЗВРАТОМ
    //  list[index] = Map<String, dynamic>.from(nestedMap);
  }

  // 🔹 БЛОК 3 (Запись конечного значения)
//  print("✅ Записываем значение `$newValue` в `$finalKey`");

  nestedMap[finalKey] = newValue.toString(); //обязательно явное пиведение типов

  // 🔥 **Обязательно обновляем `updatedSchedule` обратно!**

  /*
  if (block1 != null && block2 != null) {
    updatedSchedule[block1["key"]][block1["index"]][block2["key"]][block2["index"]] = nestedMap;
  } else if (block1 != null) {
    updatedSchedule[block1["key"]][block1["index"]] = nestedMap;
  } else {
    updatedSchedule[finalKey] = newValue.toString();
  }

*/

  // print("🎯 Финальная структура: $updatedSchedule");

  return updatedSchedule;
}

//-----------------------------------------------------------------------

// С учетом точек
Map<String, dynamic> parseTargetField(String targetField) {
  // 🔹 Разбиваем путь по [] и . (но не теряем точки в конечных полях)
  List<String> parts = targetField
      .split(RegExp(r'\[|\]|\.'))
      .where((p) => p.isNotEmpty)
      .toList();
  int depth = parts.length;

  Map<String, dynamic>? block1;
  Map<String, dynamic>? block2;
  String finalKey = parts.last;

  // 🔸 Одиночное поле в корне (например, "deviceName")
  if (depth == 1) {
    block1 = null;
    block2 = null;
  }

  // 🔸 Поле внутри списка (например, days[0])
  else if (depth == 2) {
    block1 = {"key": parts[0], "index": int.tryParse(parts[1])};
    block2 = null;
    finalKey = "";
  }

  // 🔸 Поле внутри списка объектов (например, days[0].dayIntervalsCustom[2].icon)
  else if (depth == 3) {
    block1 = {"key": parts[0], "index": int.tryParse(parts[1])};
    block2 = null;
  }

  // 🔸 Поле внутри объекта, но в пути есть слово без индекса (например, days[0].dayIntervalsStandart[3].icon)
  else if (depth == 4 &&
      !parts[2].contains(RegExp(r'\d')) &&
      (parts[2].contains("Custom") || parts[2].contains("Standart"))) {
    block1 = {"key": parts[0], "index": int.tryParse(parts[1])};
    block2 = {"key": parts[2], "index": int.tryParse(parts[3])};
  }

  // 🔸 Поле внутри вложенного списка (например, days[0].dayIntervalsCustom[2].temperatureHigtByte)
  else if (depth == 5) {
    block1 = {"key": parts[0], "index": int.tryParse(parts[1])};
    block2 = {"key": parts[2], "index": int.tryParse(parts[3])};
  }

  // 🔸 Теоретически возможный глубокий уровень (например, days[0].dayIntervalsCustom[2].nestedField.someValue)
  else if (depth > 5) {
    block1 = {"key": parts[0], "index": int.tryParse(parts[1])};
    block2 = {"key": parts[2], "index": int.tryParse(parts[3])};
    finalKey = parts.sublist(4).join(".");
  }

  // 🔸 Лог, если структура неожиданная
  else {
    print(
        "⚠️ parseTargetField: Неожиданный формат пути: $targetField (depth: $depth)");
  }

  return {
    "block1": block1,
    "block2": block2,
    "finalKey": finalKey,
    "depth": depth,
  };
}

//-----------------------------------------------------------------------
String filterShedulleBaseField(String baseField) {
  RegExp regex = RegExp(r'^(.*?)(\[\d+\])?$'); // Берём всё ДО и ПОСЛЕ `[]`
  Match? match = regex.firstMatch(baseField);
  if (match == null) return baseField;

  String arrayName = match.group(1) ?? baseField; // Основное название (без [])
  String? indexPart = match.group(2); // Квадратные скобки + число, если есть

  return indexPart != null ? "$arrayName$indexPart" : arrayName;
}

dynamic readDeviceShedulleField(String deviceId, String targetField) {
  int index = FFAppState().myDeviceShedulle.indexWhere((s) => s.id == deviceId);
  if (index == -1) return null; // Если расписание не найдено

  // Преобразуем в Map для универсального доступа
  Map<String, dynamic> schedule = FFAppState().myDeviceShedulle[index].toMap();

  // Разбираем путь к полю
  List<String> parts = targetField.split(RegExp(r'\[|\]\.?'));

  dynamic current = schedule;
  for (String part in parts) {
    if (current is Map<String, dynamic>) {
      if (!current.containsKey(part)) return null;
      current = current[part];
    } else if (current is List && int.tryParse(part) != null) {
      int listIndex = int.parse(part);
      if (listIndex >= current.length) return null;
      current = current[listIndex];
    } else {
      return null; // Некорректный путь
    }
  }

  return current;
}

//-----------------------------------------------------------------------
void initializeDeviceShedulle() {
  // Если в главном списке нет устройств, очищаем расписание полностью
  if (FFAppState().ListOfMyDevice1.isEmpty) {
    FFAppState().myDeviceShedulle = [];
    return;
  }

  // 🔹 Получаем ID всех доступных устройств
  List<String> activeDeviceIds =
      FFAppState().ListOfMyDevice1.map((device) => device.id).toList();

  // 🔹 Фильтруем расписания: оставляем только тех, у кого ID есть в `ListOfMyDevice1`
  FFAppState().myDeviceShedulle = FFAppState()
      .myDeviceShedulle
      .where((schedule) => activeDeviceIds.contains(schedule.id))
      .toList();

  // 🔹 Получаем ID, которые уже есть в `myDeviceShedulle` после очистки
  List<String> existingIds =
      FFAppState().myDeviceShedulle.map((schedule) => schedule.id).toList();

  // 🔹 Добавляем новые устройства, если их ещё нет в `myDeviceShedulle`
  List<DeviceShedulleStruct> newSchedules = FFAppState()
      .ListOfMyDevice1
      .where((device) => !existingIds.contains(device.id)) // Только новые
      .map((device) => DeviceShedulleStruct(
            id: device.id, // Копируем ID устройства
            //  dayIntervals1: [], // Пустой список кастомных интервалов
            //  standartDayIntervals1: [], // Пустой список стандартных интервалов
          ))
      .toList();

  // 🔹 Добавляем новые устройства в расписание
  FFAppState().myDeviceShedulle.addAll(newSchedules);

  debugPrint(
      '✅ initializeDeviceShedulle: Оставлено ${FFAppState().myDeviceShedulle.length} устройств после синхронизации.');
}

//-----------------------------------------------------------------------
void clearAllIntervals() {
  FFAppState().myDeviceShedulle = FFAppState().myDeviceShedulle.map((schedule) {
    return DeviceShedulleStruct(
      id: schedule.id, // Оставляем ID
      // dayIntervals1: [], // Полностью очищаем список кастомных интервалов
      // standartDayIntervals1: [], // Полностью очищаем список стандартных интервалов
    );
  }).toList();
}

//-----------------------------------------------------------------------
void allloadMyDeviceScheduleToRAM(String deviceId, String targetField) {
  // 🔹 Если путь заканчивается на `[]`, убираем их
  if (targetField.endsWith("[]")) {
    targetField = targetField.substring(0, targetField.length - 2);
  }

  var schedule = FFAppState().myDeviceShedulle.firstWhere(
        (schedule) => schedule.id == deviceId,
        orElse: () => DeviceShedulleStruct(),
      );

  // 🔹 Получаем список напрямую
  var sourceList = schedule.toMap()[targetField] as List<dynamic>?;

  // ✅ Очищаем список перед обновлением
  FFAppState().deviceShedulleList = [];

  // ✅ Если список пуст, просто выходим
  if (sourceList == null || sourceList.isEmpty) {
    debugPrint('❌ deviceShedulleList очищен, так как $targetField пуст');
    return;
  }

  // ✅ Заполняем новый список
  FFAppState().deviceShedulleList = sourceList
      .map((item) => SinglIntervalStruct.fromMap(item as Map<String, dynamic>))
      .toList();

  debugPrint(
      '✅ ОБНОВЛЯЕМ deviceShedulleList (${FFAppState().deviceShedulleList.length}) для $targetField');
}

//-----------------------------------------------------------------------

//новое

void myallloadMyDeviceScheduleToRAM(String deviceId, String targetField) {
  // 🔹 1. Находим расписание по ID устройства
  int scheduleIndex =
      FFAppState().myDeviceShedulle.indexWhere((s) => s.id == deviceId);
  if (scheduleIndex == -1) {
    debugPrint('❌ Устройство с id $deviceId не найдено.');
    return;
  }

  DeviceShedulleStruct schedule = FFAppState().myDeviceShedulle[scheduleIndex];

  // 🔹 2. Конвертируем исходные данные в Map
  Map<String, dynamic> scheduleMap = schedule.toMap();

  // 🔹 3. Определяем имя целевого списка (`dayIntervalsStandart` или `dayIntervalsCustom`)
  String targetListName = targetField.split(".").last.split("[")[0];

  debugPrint("🔹 Определён целевой список: `$targetListName`");

  // 🔹 4. Парсим путь вложенности
  List<Map<String, dynamic>> targetBUF = myparseTargetField(targetField);
  if (targetBUF.isEmpty) {
    debugPrint('❌ Ошибка: Неверный формат targetField: $targetField');
    return;
  }

  // 🔹 5. Ссылка на текущий уровень (ref начинает с корня)
  dynamic ref = scheduleMap;

  // 🔹 6. Идём по вложенности до последнего уровня
  for (int i = 0; i < targetBUF.length; i++) {
    String listName = targetBUF[i]["namelist"];
    int listIndex = targetBUF[i]["indexlist"];

    if (ref is Map<String, dynamic> && ref.containsKey(listName)) {
      List<dynamic>? currentList = ref[listName] as List<dynamic>?;

      if (currentList == null ||
          listIndex < 0 ||
          listIndex >= currentList.length) {
        debugPrint(
            '❌ Ошибка: Индекс $listIndex выходит за границы в "$listName"');
        FFAppState().deviceShedulleList = []; // ✅ Очистка видео буфера
        return;
      }

      // ✅ Проверяем, есть ли `targetListName` внутри `days[X]`
      if (currentList[listIndex] is Map<String, dynamic>) {
        Map<String, dynamic> dayObject = currentList[listIndex];

        if (!dayObject.containsKey(targetListName) ||
            dayObject[targetListName] == null) {
          debugPrint(
              "⚠️ Внимание: `$listName[$listIndex]` существует, но `$targetListName` отсутствует (NULL). Очищаем буфер.");
          FFAppState().deviceShedulleList = []; // ✅ Очистка видео буфера
        } else {
          ref = dayObject[
              targetListName]; // ✅ Теперь ref корректно указывает на `dayIntervalsStandart[]`
        }
      } else {
        debugPrint("❌ Ошибка: `$listName[$listIndex]` не является объектом.");
        FFAppState().deviceShedulleList = []; // ✅ Очистка видео буфера
        return;
      }

      debugPrint("✅ Переключились на `$listName[$listIndex].$targetListName`");
    } else {
      debugPrint('❌ Ошибка: Поле "$listName" не найдено.');
      FFAppState().deviceShedulleList = []; // ✅ Очистка видео буфера
      return;
    }
  }

  // 🔹 7. Достаем чистый список
  List<dynamic>? sourceList = ref is List<dynamic> ? ref : null;

  // 🔹 8. Очищаем и заполняем deviceShedulleList
  if (sourceList == null || sourceList.isEmpty) {
    debugPrint('⚠️ deviceShedulleList очищен, так как $targetField пуст');
    FFAppState().deviceShedulleList = []; // ✅ Очистка видео буфера
    return;
  }

  FFAppState().deviceShedulleList = sourceList
      .map((item) => SinglIntervalStruct.fromMap(item as Map<String, dynamic>))
      .toList();

  debugPrint(
      '✅ ОБНОВЛЯЕМ deviceShedulleList (${FFAppState().deviceShedulleList.length}) для $targetField');
}

//-----------------------------------------------------------------------
int ShedullegetIntervalsCount(String deviceId, String targetField) {
  DeviceShedulleStruct? schedule = FFAppState().myDeviceShedulle.firstWhere(
        (s) => s.id == deviceId,
        orElse: () => DeviceShedulleStruct(),
      );

  debugPrint('DEBUG: deviceId = $deviceId');
  debugPrint('DEBUG: targetField = $targetField');

  // 🔹 Убираем `[]` в конце, если есть
  String cleanTarget = targetField.replaceAll('[]', '');

  // 🔹 Разбираем путь через `.split('.')` + поддержка индексов `[x]`
  List<String> parts = cleanTarget.split(RegExp(r'\[|\]\.?'));

  // 🔹 Начинаем с корневой структуры
  dynamic nestedMap = schedule.toMap();

  for (String part in parts) {
    if (part.isEmpty) continue; // Игнорируем пустые элементы

    // 🔹 Если это индекс в списке (`[x]`), преобразуем в число
    int? index = int.tryParse(part);

    if (index != null && nestedMap is List) {
      // 🔹 Если индекс за границей списка → возвращаем реальную длину, а не 0
      if (index >= nestedMap.length) {
        debugPrint(
            "DEBUG: Индекс $index выходит за границы, возвращаем длину ${nestedMap.length}");

        return nestedMap.length;
      }
      nestedMap = nestedMap[index];
    } else if (nestedMap is Map<String, dynamic>) {
      if (!nestedMap.containsKey(part)) {
        debugPrint("DEBUG: Ключ $part отсутствует, возвращаем текущую длину");

        return 0; // 🔥 Если ключа нет — реально пусто, возвращаем 0
      }
      nestedMap = nestedMap[part];
    } else {
      return 0; // 🔥 Если путь не найден
    }
  }

  // 🔹 Если в конце мы получили `null`, заменяем его на `[]`
  if (nestedMap == null) {
    debugPrint("DEBUG: Финальный объект был null, создаём []");
    // nestedMap = [];

    return 0;
  }

  // 🔹 Если в конце мы получили список — возвращаем его длину
  return (nestedMap is List) ? nestedMap.length : 0;
}

//-----------------------------------------------------------------------
void deleteIntervalFromDeviceShedulle(String deviceId, String targetField) {
  // 🔹 1. Ищем устройство по ID
  int scheduleIndex =
      FFAppState().myDeviceShedulle.indexWhere((s) => s.id == deviceId);
  if (scheduleIndex == -1) {
    debugPrint('❌ Ошибка: Устройство с id $deviceId не найдено.');
    return;
  }

  DeviceShedulleStruct schedule = FFAppState().myDeviceShedulle[scheduleIndex];

  // 🔹 2. Исходные данные — конвертируем в Map
  Map<String, dynamic> updatedSchedule = schedule.toMap();

  // 🔹 3. Получаем путь вложенности (targegBUF)
  List<Map<String, dynamic>> targegBUF = myparseTargetField(targetField);
  if (targegBUF.isEmpty) {
    debugPrint('❌ Ошибка: Неверный формат targetField: $targetField');
    return;
  }

  // 🔹 4. ref связан с реальными данными (корень)
  dynamic ref = updatedSchedule;

  // 🔹 5. Идем по вложенности до предпоследнего уровня
  for (int i = 0; i < targegBUF.length - 1; i++) {
    String listName = targegBUF[i]["namelist"];
    int listIndex = targegBUF[i]["indexlist"];

    if (ref is Map<String, dynamic> && ref.containsKey(listName)) {
      List<dynamic>? currentList = ref[listName] as List<dynamic>?;

      if (currentList == null ||
          listIndex < 0 ||
          listIndex >= currentList.length) {
        debugPrint(
            '❌ Ошибка: Индекс $listIndex выходит за границы в "$listName"');
        return;
      }

      ref = currentList[listIndex];
    } else {
      debugPrint('❌ Ошибка: Поле "$listName" не найдено.');
      return;
    }
  }

  // 🔹 6. Последний шаг: удаление из реальных данных
  String targetListName = targegBUF.last["namelist"];
  int targetIndex = targegBUF.last["indexlist"];

  if (ref is Map<String, dynamic> && ref.containsKey(targetListName)) {
    List<dynamic>? targetList = ref[targetListName] as List<dynamic>?;

    if (targetList == null ||
        targetIndex < 0 ||
        targetIndex >= targetList.length) {
      debugPrint(
          '❌ Ошибка: Индекс $targetIndex выходит за границы в "$targetListName"');
      return;
    }

    //targetIndex = targetIndex -1;

    targetList.removeAt(targetIndex); // поехало дальше

    debugPrint(
        '✅ Удалён элемент $targetIndex из $targetListName. Новый список: $targetList');
  } else {
    debugPrint('❌ Ошибка: Поле "$targetListName" не найдено.');
    return;
  }

  // 🔹 7. Явно обновляем глобальное состояние (работает 100% во FlutterFlow)
  final updatedList = FFAppState().myDeviceShedulle.toList();
  updatedList[scheduleIndex] = DeviceShedulleStruct.fromMap(updatedSchedule);
  FFAppState().myDeviceShedulle = updatedList;
}

//-----------------------------------------------------------------------
List<Map<String, dynamic>> myparseTargetField(String targetField) {
  List<Map<String, dynamic>> targegBUF = []; // Итоговый список

  // 🔹 Если путь заканчивается на `[]`, убираем их
  if (targetField.endsWith("[]")) {
    targetField = targetField.substring(0, targetField.length - 2);
  }

  // Разбиваем строку на части по скобкам [] и точкам .
  List<String> parts = targetField.split(RegExp(r'[.\[\]]+'));

  for (int i = 0; i < parts.length - 1; i += 2) {
    int? index = int.tryParse(parts[i + 1]); // Парсим индекс
    if (index != null) {
      targegBUF.add(
          {"namelist": parts[i], "indexlist": index}); // ✅ Добавляем в список
    } else {
      debugPrint(
          '❌ Ошибка: Неверный индекс ${parts[i + 1]} в пути $targetField');
      return [];
    }
  }

  return targegBUF;
}

// АНАЛИЗ АКТИВНОСТИ КОМПОНЕНТА /СТРАНИЦЫ ИЛИ ДИАЛОГА  - пос локальному ТАЙМЕРУ

// Глобальные переменные для отслеживания состояния
int dialogCounter = 0; // Счётчик работы диалога (увеличивается таймером 1)
int lastCounter = 0; // Последнее зафиксированное значение счётчика
int stableIterations = 0; // Количество раз подряд, когда счётчик не изменился
bool isDialogOpen = false; // Флаг состояния диалога

void startTimer1() {
  // Timer.periodic(Duration(milliseconds: 10), (timer) {
  dialogCounter++; // Каждые 10 мс увеличиваем счётчик

  // Остановка таймера, если диалог уже закрыт
  if (!isDialogOpen) {
    // timer.cancel();
    print("❌ Timer1 остановлен, диалог закрыт.");
  }
  //});
}

void startTimer2() {
  //Timer.periodic(Duration(milliseconds: 20), (timer) {
  if (dialogCounter > lastCounter) {
    stableIterations = 0; // Счётчик растёт – диалог жив
  } else {
    stableIterations++; // Если счётчик не растёт – увеличиваем итерации
  }

  lastCounter = dialogCounter; // Обновляем последнее значение

  // Если 3 итерации подряд счётчик не изменился – диалог закрыт
  if (stableIterations >= 3) {
    isDialogOpen = false;
    // timer.cancel();
    print("❌ Timer2 остановлен, диалог точно закрыт!");
  } else {
    isDialogOpen = true;
  }
  // });
}

/*
Как использовать?
При открытии диалога (кастомный экшен onOpen):

dart
Копировать
Редактировать
isDialogOpen = true;
dialogCounter = 0; 
lastCounter = 0;
stableIterations = 0;

startTimer1(); // Запускаем таймер диалога
startTimer2(); // Запускаем таймер проверки


При закрытии диалога (кастомный экшен onClose):

dart
Копировать
Редактировать
isDialogOpen = false;



*/

Future<void> requestBatteryOptimizationDialog() async {
  final intent = AndroidIntent(
    action: 'android.settings.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS',
    data: 'package:com.yourcompany.yourapp', // Замени на свой ID пакета
  );
  await intent.launch();
}
