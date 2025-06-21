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

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'dart:async';
import 'dart:io' show Platform;

Future newCustomActionPeriodic() async {
  // Add your function code here!

  FFAppState().ReadTimer++;

  if (FFAppState().ReadTimer == 1) // можно часе..синхронизация  1 к N

  {
    FFAppState().ReadTimer =
        0; //сбрасываем таймер //что бы не показывать дублирование данны

    // printCurrentTime();
    //debugPrint(
    //  "Фонове обновление N /раз в секунду сразу после загрузки старницы ");

    if ((FFAppState().ListOfMyDevice1.isNotEmpty) &
        (FFAppState().selectedDeviceId != "")) {
      await updateGlobalDeviceIds();
      await updateGlobalDeviceIdsV2();

      if (device_connect_on_servise == true) // если готово к чтению
      {
        if (connect_status_busy == false) {
          await updateGlobalDeviceIdsV3(); // Обновляем списки  активных устройствq

          //debugPrint(' TEST ');

          await processNextDeviceReadData();

          //debugPrint(' TEST ');

          printCurrentTime();
        }
      }
    }

    //debugPrint('Новое значение: ${_value.toString()}');

    //  streamSubscription(my_devise);
  }
}

// --проверка обновления перменнной

int prev_val = 0; // Предыдущее значение

bool checkForUpdate() {
  if (list_val_test != prev_val) {
    prev_val = list_val_test; // Обновляем предыдущее значение
    return true; // Если значение изменилось
  }
  return false; // Если значение не изменилось
}

//-------------------------------тестирование очистики массива для литс вью

void updateMyList_v0(int index, int value, bool clear) {
  // Если флаг clear равен true, полностью очищаем список
  if (clear) {
    FFAppState().MyList.clear(); // Полностью очищаем список
  } else {
    // Преобразуем числовое значение в строку
    String stringValue = value.toString();

    // Если индекс больше текущего размера списка, заполняем недостающие элементы
    while (FFAppState().MyList.length <= index) {
      FFAppState().MyList.add(''); // Добавляем пустые строки для заполнения
    }

    // Обновляем элемент на указанном индексе
    FFAppState().MyList[index] = stringValue;
  }
}

int list_val_test = 0;

int counter = 0;
