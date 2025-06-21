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

import 'my_chart1action.dart';
import 'start_global_timer.dart';

Future selectChartInterval(int? intervalIndex) async {
  // Add your function code here!

  int DayIndex = 0;
  String BUFER = '';

  if (intervalIndex != null && intervalIndex <= 7) {
    // Код, если copyDayIndex не null и меньше/равен 7

    if (FFAppState().copyDayListMode == true) {
      DayIndex = intervalIndex ?? DayIndex;
      BUFER = FFAppState().selectIntervalList[DayIndex];
      FFAppState().selectIntervalList.clear();
      FFAppState().selectIntervalList.add(BUFER);

      '' + BUFER + ''; // обновляем глобальный буфер

      if (DayIndex == 0) // если " за сегодня"
      {
        // шаг 2: вычленение буферов
        buffers = extractBuffersFromTableV2(rawData,
            startIndex: rawData.length - 1440, endIndex: rawData.length - 1);

        FFAppState().LineCharData1 = passthroughV2(buffers, 'T1');
        FFAppState().LineCharData2 = passthroughV2(buffers, 'T2');

        {
          minX = 0;
          maxX = 1439;
          FFAppState().LineCharMinX = minX;
          FFAppState().LineCharMaxX = maxX;
          await savePref('lineChartMinX', minX);
          await savePref('lineChartMaxX', maxX);
          minX = (await loadPref('lineChartMinX')) as double? ?? 0.0;
          maxX = (await loadPref('lineChartMaxX')) as double? ?? 0.0;
        }

        //считаем длину данных
        FFAppState().dataChartLength = FFAppState().LineCharData1.length;

        FFAppState().LineChartUnixTimePoint =
            findUnixTimeByIndex(FFAppState().LineCharData1, minX.toInt());

        int timepoint = findIndexByUnixTime(
            FFAppState().LineCharData1, FFAppState().LineChartUnixTimePoint);

        FFAppState().tooltipLineChartX = timepoint.toDouble();
        FFAppState().scrollChannel = 1;
        FFAppState().LineChartOnTap =
            true; // включаем флаг обновления " RebuildAllPages

        FFAppState().LineChartZoom = false;
        FFAppState().panoramaMode =
            false; // переключаем режим источкника данных  для ДЕТАЛЬНОГО ВИДА

// вычисляем  и подговяливаем данные для вывода выбраного итервала для отбражения и для загрузки в СЛАЙДЕР

// 1. вычитываем выбраные  Хмин и Хмакс
// 2. преобразуем эти указатели в зачения времени в фомате 11.05.81 для вывода  в FFAppState().selectIntervalOut
// 3.

        int startindex = 0;
        int endindex = FFAppState().LineCharData1.length - 1;
        String startdate;
        String enddate;

//выводим крайнее левое значение
        FFAppState().LineChartUnixTimePoint =
            findUnixTimeByIndex(FFAppState().LineCharData1, startindex);
        startdate = formatUnixToDate(FFAppState().LineChartUnixTimePoint);

//выводим крайнее правое значение
        FFAppState().LineChartUnixTimePoint =
            findUnixTimeByIndex(FFAppState().LineCharData1, endindex);
        enddate = formatUnixToDate(FFAppState().LineChartUnixTimePoint);

        if (startdate != enddate) {
          FFAppState().selectIntervalOut = '$startdate - $enddate';
        } else {
          FFAppState().selectIntervalOut = '$startdate';
        }

        print('✅ График за СЕГОДНЯ загружен');
      }

      if (DayIndex == 1) // если " за вчера"
      {
        // шаг 2: вычленение буферов
        buffers = extractBuffersFromTableV2(rawData,
            startIndex: rawData.length - 1440 * 2,
            endIndex: (rawData.length - 1440) - 1);

        FFAppState().LineCharData1 = passthroughV2(buffers, 'T1');
        FFAppState().LineCharData2 = passthroughV2(buffers, 'T2');

        {
          minX = 0;
          maxX = 1439;
          FFAppState().LineCharMinX = minX;
          FFAppState().LineCharMaxX = maxX;
          await savePref('lineChartMinX', minX);
          await savePref('lineChartMaxX', maxX);
          minX = (await loadPref('lineChartMinX')) as double? ?? 0.0;
          maxX = (await loadPref('lineChartMaxX')) as double? ?? 0.0;
        }

        //считаем длину данных
        FFAppState().dataChartLength = FFAppState().LineCharData1.length;

        FFAppState().LineChartUnixTimePoint =
            findUnixTimeByIndex(FFAppState().LineCharData1, minX.toInt());

        int timepoint = findIndexByUnixTime(
            FFAppState().LineCharData1, FFAppState().LineChartUnixTimePoint);

        FFAppState().tooltipLineChartX = timepoint.toDouble();
        FFAppState().scrollChannel = 1;
        FFAppState().LineChartOnTap =
            true; // включаем флаг обновления " RebuildAllPages

        FFAppState().LineChartZoom = false;
        FFAppState().panoramaMode =
            false; // переключаем режим источкника данных  для ДЕТАЛЬНОГО ВИДА

        int startindex = 0;
        int endindex = FFAppState().LineCharData1.length - 1;
        // int endindex = 1439;
        String startdate = '';
        String enddate = '';

//выводим крайнее левое значение
        FFAppState().LineChartUnixTimePoint =
            findUnixTimeByIndex(FFAppState().LineCharData1, startindex);
        startdate = formatUnixToDate(FFAppState().LineChartUnixTimePoint);

//выводим крайнее правое значение
        FFAppState().LineChartUnixTimePoint =
            findUnixTimeByIndex(FFAppState().LineCharData1, endindex);
        enddate = formatUnixToDate(FFAppState().LineChartUnixTimePoint);

        if (startdate != enddate) {
          FFAppState().selectIntervalOut = '$startdate - $enddate';
        } else {
          FFAppState().selectIntervalOut = '$startdate';
        }

        print('✅ График за ВЧЕРА загружен');
      }

      if (DayIndex == 2) // если " за 3 дня"
      {
        // шаг 2: вычленение буферов
        buffers = extractBuffersFromTableV2(rawData,
            startIndex: rawData.length - 1440 * 3,
            endIndex: rawData.length - 1);

        FFAppState().LineCharData1 = passthroughV2(buffers, 'T1');
        FFAppState().LineCharData2 = passthroughV2(buffers, 'T2');

        {
          minX = 0;
          maxX = 1439;
          FFAppState().LineCharMinX = minX;
          FFAppState().LineCharMaxX = maxX;
          await savePref('lineChartMinX', minX);
          await savePref('lineChartMaxX', maxX);
          minX = (await loadPref('lineChartMinX')) as double? ?? 0.0;
          maxX = (await loadPref('lineChartMaxX')) as double? ?? 0.0;
        }

        //считаем длину данных
        FFAppState().dataChartLength = FFAppState().LineCharData1.length;

        FFAppState().LineChartUnixTimePoint =
            findUnixTimeByIndex(FFAppState().LineCharData1, minX.toInt());

        int timepoint = findIndexByUnixTime(
            FFAppState().LineCharData1, FFAppState().LineChartUnixTimePoint);

        FFAppState().tooltipLineChartX = timepoint.toDouble();
        FFAppState().scrollChannel = 1;
        FFAppState().LineChartOnTap =
            true; // включаем флаг обновления " RebuildAllPages

        FFAppState().LineChartZoom = false;
        FFAppState().panoramaMode =
            false; // переключаем режим источкника данных  для ДЕТАЛЬНОГО ВИДА

        int startindex = 0;
        int endindex = FFAppState().LineCharData1.length - 1;
        String startdate = '';
        String enddate = '';

//выводим крайнее левое значение
        FFAppState().LineChartUnixTimePoint =
            findUnixTimeByIndex(FFAppState().LineCharData1, startindex);
        startdate = formatUnixToDate(FFAppState().LineChartUnixTimePoint);
        FFAppState().startDateForSlider = FFAppState()
            .LineChartUnixTimePoint; // выводим крайнее левое значение
        // для слайдера  навигации

//выводим крайнее правое значение
        FFAppState().LineChartUnixTimePoint =
            findUnixTimeByIndex(FFAppState().LineCharData1, endindex);
        enddate = formatUnixToDate(FFAppState().LineChartUnixTimePoint);
        FFAppState().endDateForSlider = FFAppState()
            .LineChartUnixTimePoint; // выводим крайнее правое значение
        // для слайдера  навигации

        int nsteps =
            ((FFAppState().endDateForSlider - FFAppState().startDateForSlider) /
                        86400)
                    .floor() +
                1;
        FFAppState().nStepsForSlider = nsteps;

        if (startdate != enddate) {
          FFAppState().selectIntervalOut = '$startdate - $enddate';
        } else {
          FFAppState().selectIntervalOut = '$startdate';
        }

        print('✅ График за 3 дня загружен');
      }

      if (DayIndex == 3) // если " за 7 дней"
      {
        // шаг 2: вычленение буферов
        buffers = extractBuffersFromTableV2(rawData,
            startIndex: rawData.length - 1440 * 7,
            endIndex: rawData.length - 1);

        FFAppState().LineCharData1 = passthroughV2(buffers, 'T1');
        FFAppState().LineCharData2 = passthroughV2(buffers, 'T2');

        {
          minX = 0;
          maxX = 1439;
          FFAppState().LineCharMinX = minX;
          FFAppState().LineCharMaxX = maxX;
          await savePref('lineChartMinX', minX);
          await savePref('lineChartMaxX', maxX);
          minX = (await loadPref('lineChartMinX')) as double? ?? 0.0;
          maxX = (await loadPref('lineChartMaxX')) as double? ?? 0.0;
        }

        //считаем длину данных
        FFAppState().dataChartLength = FFAppState().LineCharData1.length;

        FFAppState().LineChartUnixTimePoint =
            findUnixTimeByIndex(FFAppState().LineCharData1, minX.toInt());

        int timepoint = findIndexByUnixTime(
            FFAppState().LineCharData1, FFAppState().LineChartUnixTimePoint);

        FFAppState().tooltipLineChartX = timepoint.toDouble();
        FFAppState().scrollChannel = 1;
        FFAppState().LineChartOnTap =
            true; // включаем флаг обновления " RebuildAllPages

        //по умолчанию переключаемся в режим детальный!
        FFAppState().LineChartZoom = false;
        FFAppState().panoramaMode =
            false; // переключаем режим источкника данных  для ДЕТАЛЬНОГО ВИДА

        int startindex = 0;
        int endindex = FFAppState().LineCharData1.length - 1;
        String startdate = '';
        String enddate = '';

//выводим крайнее левое значение
        FFAppState().LineChartUnixTimePoint =
            findUnixTimeByIndex(FFAppState().LineCharData1, startindex);
        startdate = formatUnixToDate(FFAppState().LineChartUnixTimePoint);
        FFAppState().startDateForSlider = FFAppState()
            .LineChartUnixTimePoint; // выводим крайнее левое значение
        // для слайдера  навигации

//выводим крайнее правое значение
        FFAppState().LineChartUnixTimePoint =
            findUnixTimeByIndex(FFAppState().LineCharData1, endindex);
        enddate = formatUnixToDate(FFAppState().LineChartUnixTimePoint);
        FFAppState().endDateForSlider = FFAppState()
            .LineChartUnixTimePoint; // выводим крайнее правое значение
        // для слайдера  навигации

        int nsteps =
            ((FFAppState().endDateForSlider - FFAppState().startDateForSlider) /
                        86400)
                    .floor() +
                1;
        FFAppState().nStepsForSlider = nsteps;

        if (startdate != enddate) {
          FFAppState().selectIntervalOut = '$startdate - $enddate';
        } else {
          FFAppState().selectIntervalOut = '$startdate';
        }

        print('✅ График 7 дней загружен');
      }

      if (DayIndex == 4) // если " за 14 дней"
      {
        // шаг 2: вычленение буферов
        buffers = extractBuffersFromTableV2(rawData,
            startIndex: rawData.length - 1440 * 14,
            endIndex: rawData.length - 1);

        FFAppState().LineCharData1 = passthroughV2(buffers, 'T1');
        FFAppState().LineCharData2 = passthroughV2(buffers, 'T2');

        {
          minX = 0;
          maxX = 1439;
          FFAppState().LineCharMinX = minX;
          FFAppState().LineCharMaxX = maxX;
          await savePref('lineChartMinX', minX);
          await savePref('lineChartMaxX', maxX);
          minX = (await loadPref('lineChartMinX')) as double? ?? 0.0;
          maxX = (await loadPref('lineChartMaxX')) as double? ?? 0.0;
        }

        //считаем длину данных
        FFAppState().dataChartLength = FFAppState().LineCharData1.length;

        FFAppState().LineChartUnixTimePoint =
            findUnixTimeByIndex(FFAppState().LineCharData1, minX.toInt());

        int timepoint = findIndexByUnixTime(
            FFAppState().LineCharData1, FFAppState().LineChartUnixTimePoint);

        FFAppState().tooltipLineChartX = timepoint.toDouble();
        FFAppState().scrollChannel = 1;
        FFAppState().LineChartOnTap =
            true; // включаем флаг обновления " RebuildAllPages

        //по умолчанию переключаемся в режим детальный!
        FFAppState().LineChartZoom = false;
        FFAppState().panoramaMode =
            false; // переключаем режим источкника данных  для ДЕТАЛЬНОГО ВИДА

        int startindex = 0;
        int endindex = FFAppState().LineCharData1.length - 1;
        String startdate = '';
        String enddate = '';

//выводим крайнее левое значение
        FFAppState().LineChartUnixTimePoint =
            findUnixTimeByIndex(FFAppState().LineCharData1, startindex);
        startdate = formatUnixToDate(FFAppState().LineChartUnixTimePoint);
        FFAppState().startDateForSlider = FFAppState()
            .LineChartUnixTimePoint; // выводим крайнее левое значение
        // для слайдера  навигации

//выводим крайнее правое значение
        FFAppState().LineChartUnixTimePoint =
            findUnixTimeByIndex(FFAppState().LineCharData1, endindex);
        enddate = formatUnixToDate(FFAppState().LineChartUnixTimePoint);
        FFAppState().endDateForSlider = FFAppState()
            .LineChartUnixTimePoint; // выводим крайнее правое значение
        // для слайдера  навигации

        int nsteps =
            ((FFAppState().endDateForSlider - FFAppState().startDateForSlider) /
                        86400)
                    .floor() +
                1;
        FFAppState().nStepsForSlider = nsteps;

        print('✅ График 14 дней загружен');
      }

      if (DayIndex == 5) // если " за 28 дней"
      {
        // шаг 2: вычленение буферов
        buffers = extractBuffersFromTableV2(rawData,
            startIndex: rawData.length - 1440 * 28,
            endIndex: rawData.length - 1);

        FFAppState().LineCharData1 = passthroughV2(buffers, 'T1');
        FFAppState().LineCharData2 = passthroughV2(buffers, 'T2');

        {
          minX = 0;
          maxX = 1439;
          FFAppState().LineCharMinX = minX;
          FFAppState().LineCharMaxX = maxX;
          await savePref('lineChartMinX', minX);
          await savePref('lineChartMaxX', maxX);
          minX = (await loadPref('lineChartMinX')) as double? ?? 0.0;
          maxX = (await loadPref('lineChartMaxX')) as double? ?? 0.0;
        }

        //считаем длину данных
        FFAppState().dataChartLength = FFAppState().LineCharData1.length;

        FFAppState().LineChartUnixTimePoint =
            findUnixTimeByIndex(FFAppState().LineCharData1, minX.toInt());

        int timepoint = findIndexByUnixTime(
            FFAppState().LineCharData1, FFAppState().LineChartUnixTimePoint);

        FFAppState().tooltipLineChartX = timepoint.toDouble();
        FFAppState().scrollChannel = 1;
        FFAppState().LineChartOnTap =
            true; // включаем флаг обновления " RebuildAllPages

        //по умолчанию переключаемся в режим детальный!
        FFAppState().LineChartZoom = false;
        FFAppState().panoramaMode =
            false; // переключаем режим источкника данных  для ДЕТАЛЬНОГО ВИДА

        int startindex = 0;
        int endindex = FFAppState().LineCharData1.length - 1;
        String startdate = '';
        String enddate = '';

//выводим крайнее левое значение
        FFAppState().LineChartUnixTimePoint =
            findUnixTimeByIndex(FFAppState().LineCharData1, startindex);
        startdate = formatUnixToDate(FFAppState().LineChartUnixTimePoint);
        FFAppState().startDateForSlider = FFAppState()
            .LineChartUnixTimePoint; // выводим крайнее левое значение
        // для слайдера  навигации

//выводим крайнее правое значение
        FFAppState().LineChartUnixTimePoint =
            findUnixTimeByIndex(FFAppState().LineCharData1, endindex);
        enddate = formatUnixToDate(FFAppState().LineChartUnixTimePoint);
        FFAppState().endDateForSlider = FFAppState()
            .LineChartUnixTimePoint; // выводим крайнее правое значение
        // для слайдера  навигации

        int nsteps =
            ((FFAppState().endDateForSlider - FFAppState().startDateForSlider) /
                        86400)
                    .floor() +
                1;
        FFAppState().nStepsForSlider = nsteps;

        print('✅ График 28 дней загружен');
      }

      if (DayIndex == 6) // если " за 6 месяцев"
      {
        // шаг 2: вычленение буферов
        buffers = extractBuffersFromTableV2(rawData,
            startIndex: rawData.length - 1440 * 182,
            endIndex: rawData.length - 1);

        FFAppState().LineCharData1 = passthroughV2(buffers, 'T1');
        FFAppState().LineCharData2 = passthroughV2(buffers, 'T2');

        {
          minX = 0;
          maxX = 1439;
          FFAppState().LineCharMinX = minX;
          FFAppState().LineCharMaxX = maxX;
          await savePref('lineChartMinX', minX);
          await savePref('lineChartMaxX', maxX);
          minX = (await loadPref('lineChartMinX')) as double? ?? 0.0;
          maxX = (await loadPref('lineChartMaxX')) as double? ?? 0.0;
        }

        //считаем длину данных
        FFAppState().dataChartLength = FFAppState().LineCharData1.length;

        FFAppState().LineChartUnixTimePoint =
            findUnixTimeByIndex(FFAppState().LineCharData1, minX.toInt());

        int timepoint = findIndexByUnixTime(
            FFAppState().LineCharData1, FFAppState().LineChartUnixTimePoint);

        FFAppState().tooltipLineChartX = timepoint.toDouble();
        FFAppState().scrollChannel = 1;
        FFAppState().LineChartOnTap =
            true; // включаем флаг обновления " RebuildAllPages"

        FFAppState().LineChartZoom = false;
        FFAppState().panoramaMode =
            false; // переключаем режим источкника данных  для ДЕТАЛЬНОГО ВИДА

        int startindex = 0;
        int endindex = FFAppState().LineCharData1.length - 1;
        String startdate = '';
        String enddate = '';

//выводим крайнее левое значение
        FFAppState().LineChartUnixTimePoint =
            findUnixTimeByIndex(FFAppState().LineCharData1, startindex);
        startdate = formatUnixToDate(FFAppState().LineChartUnixTimePoint);
        FFAppState().startDateForSlider = FFAppState()
            .LineChartUnixTimePoint; // выводим крайнее левое значение
        // для слайдера  навигации

//выводим крайнее правое значение
        FFAppState().LineChartUnixTimePoint =
            findUnixTimeByIndex(FFAppState().LineCharData1, endindex);
        enddate = formatUnixToDate(FFAppState().LineChartUnixTimePoint);
        FFAppState().endDateForSlider = FFAppState()
            .LineChartUnixTimePoint; // выводим крайнее правое значение
        // для слайдера  навигации

        int nsteps =
            ((FFAppState().endDateForSlider - FFAppState().startDateForSlider) /
                        86400)
                    .floor() +
                1;
        FFAppState().nStepsForSlider = nsteps;

        print('✅ График 182 дня загружен');
      }

      print(" copyDayOK ");
    } else {
      // при первом нажатии выпадает заполненый  СПИСОК!!
      FFAppState().selectIntervalList.clear();
      print(" TEST END ");
      BUFER = FFAppConstants.selectIntervalList[0]; //Выбираем Понедельник
      FFAppState().selectIntervalList.add(BUFER);
      BUFER = FFAppConstants.selectIntervalList[1]; //Выбираем Понедельник
      FFAppState().selectIntervalList.add(BUFER);
      BUFER = FFAppConstants.selectIntervalList[2]; //Выбираем Понедельник
      FFAppState().selectIntervalList.add(BUFER);
      BUFER = FFAppConstants.selectIntervalList[3]; //Выбираем Понедельник
      FFAppState().selectIntervalList.add(BUFER);
      BUFER = FFAppConstants.selectIntervalList[4]; //Выбираем Понедельник
      FFAppState().selectIntervalList.add(BUFER);
      BUFER = FFAppConstants.selectIntervalList[5]; //Выбираем Понедельник
      FFAppState().selectIntervalList.add(BUFER);
      BUFER = FFAppConstants.selectIntervalList[6]; //Выбираем Понедельник
      FFAppState().selectIntervalList.add(BUFER);
      BUFER = FFAppConstants.selectIntervalList[7]; //Выбираем Понедельник
      FFAppState().selectIntervalList.add(BUFER);
    }

    //copyDayListMode = !copyDayListMode; // инверсия значения

    FFAppState().copyDayListMode = !FFAppState().copyDayListMode;

    print(" TEST END ");
  }
}
