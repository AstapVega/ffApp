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

import 'package:flutter/foundation.dart';

import 'dart:math'; // Подключаем библиотеку для математических операций

Future calculateAdjusted(int mode) async {
  // Add your function code here!

  if (mode == FFAppConstants.Height) {
    // FFAppState().sliderOffset = calculateAdjustedHeight(
    //   105); // минимальное базове смещение  = 102 длЯэндроида  4,5 экрана

    // FFAppState().sliderOffset = calculateAdjustedHeight(
    //     145); // минимальное базове смещение  = 102 длЯэндроида  4,5 экрана

    if (kIsWeb) {
      print("Web");
      print("Web");
      FFAppState().sliderOffset = 130;
    } else {
      FFAppState().sliderOffset = calculateAdjustedHeight(
          105); // минимальное базове смещение  = 102 длЯэндроида  4,5 экрана
    }

    //  FFAppState().sliderOffset = 130;

    //FFAppState().sliderOffset = FFAppState().sliderOffset;
  }
}

double calculateAdjustedHeight(double baseOffset) {
  final window = WidgetsBinding.instance.window;
  double devicePixelRatio = window.devicePixelRatio;

  // Физические размеры экрана
  double screenHeight = (window.physicalSize
      .height); // Физическая высота экрана + поправка на высоту  верхнего статус бара
  double screenWidth = window.physicalSize.width; // Физическая ширина экрана

  double logicalHeight =
      screenHeight / devicePixelRatio; // в логических пискелях весь экран
  double logicalWidth =
      screenWidth / devicePixelRatio; //в логических пикселях весь экрна

  final padding = window.viewPadding;
  // double screenHeightNonSaferia =
  //   (window.physicalSize.height - padding.top) / window.devicePixelRatio;

  double screenHeightNonSaferia;

  if (Platform.isIOS) {
    screenHeightNonSaferia =
        (window.physicalSize.height - padding.top - padding.bottom) /
            window.devicePixelRatio;
    FFAppState().SliderPageHigth = screenHeightNonSaferia;
  } else {
    screenHeightNonSaferia =
        (window.physicalSize.height - padding.top - padding.bottom) /
            window.devicePixelRatio;
    FFAppState().SliderPageHigth = screenHeightNonSaferia;
  }

//double screenHeight = (window.physicalSize.height - padding.top - padding.bottom) / window.devicePixelRatio;

//FFAppState().SliderPageHigth = logicalHeight;
  // FFAppState().SliderPageHigth = screenHeightNonSaferia;

  double dpi = devicePixelRatio * 160.0;

  // Используем sqrt из dart:math
  double diagonalInPixels = sqrt(pow(screenWidth, 2) + pow(screenHeight, 2));
  double diagonalInInches = diagonalInPixels / dpi;

  // Эталонная минимальная диоганаль экрана теоретически возможная
  double baseAspectRatio = 4.5; // Эталонное соотношение

  // Текущее соотношение сторон
  double currentAspectRatio;
  currentAspectRatio = diagonalInInches;

  double adjustmentFactor = 0;

  // Проверяем отклонение текущего коэффициента от эталонного
  if ((currentAspectRatio / baseAspectRatio) >= 1.05) {
    if (Platform.isAndroid) {
      // Если текущий коэффициент больше эталонного на 5% или больше, вводим поправку
      adjustmentFactor = ((currentAspectRatio / (baseAspectRatio * 0.92))) *
          1.1; // линейнон смещение по высоте
    }

    if (Platform.isIOS) {
      // Если текущий коэффициент больше эталонного на 5% или больше, вводим поправку
      adjustmentFactor = ((currentAspectRatio / (baseAspectRatio * 0.92))) *
          1.1; // линейнон смещение по высоте
    }
  } else {
    // Если отклонение меньше 5%, используем стандартный расчёт для маленького экрана 4,5

    if (Platform.isAndroid) {
      adjustmentFactor = currentAspectRatio / baseAspectRatio;
    }
    if (Platform.isIOS) {
      adjustmentFactor =
          (currentAspectRatio / baseAspectRatio); // линейнон смещение ??
    }
  }

  return baseOffset * adjustmentFactor;
}

double calculateAdjustedWidth(double baseOffset) {
  // Получаем текущие размеры экрана
  double screenWidth = WidgetsBinding.instance.window.physicalSize.width /
      WidgetsBinding.instance.window.devicePixelRatio;

  // Эталонная ширина (например, для экрана 720x1280)
  double baseWidth = 720.0;

  // Рассчитываем коэффициент, может быть больше 1 для широкоформатных экранов
  double adjustmentFactor = screenWidth / baseWidth;

  // Возвращаем пересчитанное смещение
  return baseOffset * adjustmentFactor;
}
