// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'dart:math' as math;
import 'dart:async'; // Импортируем библиотеку для таймеров
import 'dart:ui' as ui;
import 'package:intl/intl.dart' as intl;

/*

class SliderAndKeyCustomWidgetFF2 extends StatefulWidget {
  const SliderAndKeyCustomWidgetFF2({
    super.key,
    this.width,
    this.height,
    required this.onDataReceive,
    required this.value,
  });

  final double? width;
  final double? height;
  final Future Function(double dataReceive) onDataReceive;
  final double value;

  @override
  State<SliderAndKeyCustomWidgetFF2> createState() =>
      _SliderAndKeyCustomWidgetFF2State();
}

class _SliderAndKeyCustomWidgetFF2State
    extends State<SliderAndKeyCustomWidgetFF2> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

*/

// родной базовый прототип виджета при котором всё компилируется

class SliderAndKeyCustomWidgetFF2 extends StatefulWidget {
  const SliderAndKeyCustomWidgetFF2({
    super.key,
    this.width,
    this.height,
    required this.value, // Новый параметр для передачи текущего значения
    required this.onDataReceive, // Обратный вызов для получения изменений
  });

  // Печать значений при создании виджета

  final double? width; // Ширина виджета
  final double? height; // Высота виджета
  final double value; // Текущее значение
  final Future Function(double dataReceive) onDataReceive; // Обратный вызов

  @override
  State<SliderAndKeyCustomWidgetFF2> createState() =>
      _SliderAndKeyCustomWidgetFF2State();
}

class _SliderAndKeyCustomWidgetFF2State
    extends State<SliderAndKeyCustomWidgetFF2> {
  late double _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.value; // Инициализируем начальное значение
  }

  @override
  void didUpdateWidget(covariant SliderAndKeyCustomWidgetFF2 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value && _currentValue != widget.value) {
      setState(() {
        _currentValue = widget.value; // Обновляем только при изменении
      });
    }
  }

  void _updateValue(double newValue) {
    setState(() {
      _currentValue = newValue;
      // _currentValue = widget.value;
    });
    widget.onDataReceive(newValue); // Передаем обновленное значение наверх
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: CustomSliderButtonWidget(
        // Закомментируем value, если он не работает:
        // value: widget.value,
        value:
            _currentValue, // Передаём текущее значение // вот єта строчка ругается!!
        onChanged: _updateValue, // Обратный вызов для изменений
        width: widget.width,
        height: widget.height,
      ),
    );
  }
}

// в  ОТВЕТЕ не повторяй заново код из секции МОЙ ВИДЖЕТ  !!

//-----------------------------------------------------------------МОЙ ВИДЖЕТ--------------------------------------------------------

class CustomTextDirection {
  static const LTR = ui.TextDirection.ltr;
  static const RTL = ui.TextDirection.rtl;
}

// Пользовательский слайдер
class CustomSlider extends StatelessWidget {
  final double value; // Текущее значение слайдера
  final double min; // Минимальное значение слайдера
  final double max; // Максимальное значение слайдера
  final Color activeColor; // Цвет активного трека
  final Color inactiveColor; // Цвет неактивного трека
  final double circleDiameter; // Диаметр круга
  final double thumbDiameter; // Диаметр бегунка
  final Color thumbBorderColor; // Цвет границы бегунка
  final double thumbBorderWidth; // Ширина границы бегунка
  final Color thumbFillColor; // Цвет фона бегунка
  final double startAngle; // Начальная граница трека
  final double endAngle; // Конечная граница трека
  final double textSize; // Размер текста
  final Color textColor; // Цвет текста
  final double angleRangeStart; // Начальный угол диапазона в радианах
  final double angleRangeEnd; // Конечный угол диапазона в радианах
  final ValueChanged<double> onChanged; // Обратный вызов при изменении значения
  final double displayValue; // Значение для отображения внутри круга
  final double valueOffset; // Добавка значения
  final double tickLength; // Длина насечек
  final double tickWidth; // Толщина насечек
  final Color tickColor; // Цвет насечек
  final double trackWidth; // Толщина трека
  final Color progressColor; // Цвет прогресс-бара
  final double progressWidth; // Толщина прогресс-бара
  final Color backgroundColor; // Цвет фона контейнера
  final double insideTextSize; // Размер текста внутри круга
  final Color insideTextColor; // Цвет текста внутри круга
  final double knobTextSize; // Размер текста рядом с бегунком
  final Color knobTextColor; // Цвет текста рядом с бегунком
  final double integerPartTextSize; // Размер текста для целой части числа
  final Color integerPartTextColor; // Цвет текста для целой части числа
  final double decimalPartTextSize; // Размер текста для дробной части числа
  final Color decimalPartTextColor; // Цвет текста для дробной части числа
  final double decimalOffsetY; // Смещение дробной части по вертикали

  CustomSlider({
    required this.value,
    required this.min,
    required this.max,
    required this.activeColor,
    required this.inactiveColor,
    required this.circleDiameter,
    required this.thumbDiameter,
    required this.thumbBorderColor,
    required this.thumbBorderWidth,
    required this.thumbFillColor,
    required this.startAngle,
    required this.endAngle,
    required this.textSize,
    required this.textColor,
    required this.angleRangeStart,
    required this.angleRangeEnd,
    required this.onChanged,
    required this.displayValue,
    required this.valueOffset,
    required this.tickLength,
    required this.tickWidth,
    required this.tickColor,
    required this.trackWidth,
    required this.progressColor,
    required this.progressWidth,
    required this.backgroundColor,
    required this.insideTextSize,
    required this.insideTextColor,
    required this.knobTextSize,
    required this.knobTextColor,
    required this.integerPartTextSize,
    required this.integerPartTextColor,
    required this.decimalPartTextSize,
    required this.decimalPartTextColor,
    required this.decimalOffsetY,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Container(
        color: backgroundColor,
        width: circleDiameter,
        height: circleDiameter,
        child: GestureDetector(
          onPanUpdate: (details) {
            RenderBox box = context.findRenderObject() as RenderBox;
            Offset local = box.globalToLocal(details.globalPosition);
            double angle = (math.atan2(local.dy - circleDiameter / 2,
                        local.dx - circleDiameter / 2) +
                    3 * math.pi / 2) %
                (2 * math.pi);
            angle -= 1; // Коррекция
            double newValue = (angle / (2 * math.pi)) * (max - min) + min;

            double _angleRangeStartDegrees = angleRangeStart;
            double _angleRangeEndDegrees = angleRangeEnd;

            _angleRangeStartDegrees = _angleRangeStartDegrees * (math.pi / 180);
            _angleRangeEndDegrees = _angleRangeEndDegrees * (math.pi / 180);

            if (angle > _angleRangeStartDegrees &&
                angle < _angleRangeEndDegrees) {
              onChanged(newValue);
            }
          },
          child: CustomPaint(
            painter: CircularSliderPainter(
              value: value,
              min: min,
              max: max,
              activeColor: activeColor,
              inactiveColor: inactiveColor,
              thumbDiameter: thumbDiameter,
              thumbBorderColor: thumbBorderColor,
              thumbBorderWidth: thumbBorderWidth,
              thumbFillColor: thumbFillColor,
              startAngle: startAngle,
              endAngle: endAngle,
              textSize: textSize,
              textColor: textColor,
              displayValue: displayValue,
              valueOffset: valueOffset,
              tickLength: tickLength,
              tickWidth: tickWidth,
              tickColor: tickColor,
              trackWidth: trackWidth,
              progressColor: progressColor,
              progressWidth: progressWidth,
              insideTextSize: insideTextSize,
              insideTextColor: insideTextColor,
              knobTextSize: knobTextSize,
              knobTextColor: knobTextColor,
              angleRangeStart: angleRangeStart,
              angleRangeEnd: angleRangeEnd,
              integerPartTextSize: integerPartTextSize,
              integerPartTextColor: integerPartTextColor,
              decimalPartTextSize: decimalPartTextSize,
              decimalPartTextColor: decimalPartTextColor,
              decimalOffsetY: decimalOffsetY,
            ),
          ),
        ),
      ),
    );
  }
}

class CircularSliderPainter extends CustomPainter {
  final double value;
  final double min;
  final double max;
  final Color activeColor;
  final Color inactiveColor;
  final double thumbDiameter;
  final Color thumbBorderColor;
  final double thumbBorderWidth;
  final Color thumbFillColor;
  final double startAngle;
  final double endAngle;
  final double textSize;
  final Color textColor;
  final double displayValue;
  final double valueOffset;
  final double tickLength;
  final double tickWidth;
  final Color tickColor;
  final double trackWidth;
  final Color progressColor;
  final double progressWidth;
  final double insideTextSize;
  final Color insideTextColor;
  final double knobTextSize;
  final Color knobTextColor;
  final double angleRangeStart;
  final double angleRangeEnd;
  final double integerPartTextSize;
  final Color integerPartTextColor;
  final double decimalPartTextSize;
  final Color decimalPartTextColor;
  final double decimalOffsetY;

  CircularSliderPainter({
    required this.value,
    required this.min,
    required this.max,
    required this.activeColor,
    required this.inactiveColor,
    required this.thumbDiameter,
    required this.thumbBorderColor,
    required this.thumbBorderWidth,
    required this.thumbFillColor,
    required this.startAngle,
    required this.endAngle,
    required this.textSize,
    required this.textColor,
    required this.displayValue,
    required this.valueOffset,
    required this.tickLength,
    required this.tickWidth,
    required this.tickColor,
    required this.trackWidth,
    required this.progressColor,
    required this.progressWidth,
    required this.insideTextSize,
    required this.insideTextColor,
    required this.knobTextSize,
    required this.knobTextColor,
    required this.angleRangeStart,
    required this.angleRangeEnd,
    required this.integerPartTextSize,
    required this.integerPartTextColor,
    required this.decimalPartTextSize,
    required this.decimalPartTextColor,
    required this.decimalOffsetY,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint trackPaint = Paint()
      ..color = inactiveColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = trackWidth;

    Paint thumbPaint = Paint()
      ..color = thumbFillColor
      ..style = PaintingStyle.fill;

    Paint thumbBorderPaint = Paint()
      ..color = thumbBorderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = thumbBorderWidth;

    Paint tickPaint = Paint()
      ..color = tickColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = tickWidth;

    Paint progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = progressWidth;

    double radius = size.width / 2;
    Offset center = Offset(radius, radius);

    // Поворот всего canvas, чтобы трек начинался "снизу"
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(math.pi);
    canvas.translate(-center.dx, -center.dy);

    double startAngleRad = (math.pi + startAngle * (math.pi / 180));
    double endAngleRad = (math.pi * 3 + endAngle * (math.pi / 180));

    // Рисуем трек
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 10),
      startAngleRad,
      endAngleRad - startAngleRad,
      false,
      trackPaint,
    );

    // Расчет sweepAngle для прогресс-бара
    double sweepAngle = 2 * math.pi * ((value - min) / (max - min));
    if (sweepAngle < angleRangeStart * (math.pi / 180)) {
      sweepAngle = angleRangeStart * (math.pi / 180);
    } else if (sweepAngle > angleRangeEnd * (math.pi / 180)) {
      sweepAngle = angleRangeEnd * (math.pi / 180);
    }

    // Рисуем прогресс
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 10),
      startAngleRad,
      sweepAngle,
      false,
      progressPaint,
    );

    // Рисуем насечки
    for (int i = 0; i < 100; i++) {
      double tickAngleDegrees = (i / 100) * 360 - 180;
      double tickAngle = tickAngleDegrees * (math.pi / 180);

      double startAngleDegrees = -35;
      double endAngleDegrees = 220;

      if (startAngleDegrees < 0) {
        startAngleDegrees += 360;
      }
      if (endAngleDegrees < 0) {
        endAngleDegrees += 360;
      }

      double currentAngleDegrees = tickAngleDegrees;
      if (currentAngleDegrees < 0) {
        currentAngleDegrees += 360;
      }

      if ((startAngleDegrees <= endAngleDegrees &&
              currentAngleDegrees >= startAngleDegrees &&
              currentAngleDegrees <= endAngleDegrees) ||
          (startAngleDegrees > endAngleDegrees &&
              (currentAngleDegrees >= startAngleDegrees ||
                  currentAngleDegrees <= endAngleDegrees))) {
        double tickX1 = center.dx + (radius - 15) * math.cos(tickAngle);
        double tickY1 = center.dy + (radius - 15) * math.sin(tickAngle);
        double tickX2 =
            center.dx + (radius - (15 - tickLength)) * math.cos(tickAngle);
        double tickY2 =
            center.dy + (radius - (15 - tickLength)) * math.sin(tickAngle);
        canvas.drawLine(
            Offset(tickX1, tickY1), Offset(tickX2, tickY2), tickPaint);
      }
    }

    // Бегунок
    double knobAngle = startAngleRad + sweepAngle;
    double thumbX = center.dx + (radius - 10) * math.cos(knobAngle);
    double thumbY = center.dy + (radius - 10) * math.sin(knobAngle);

    canvas.drawCircle(Offset(thumbX, thumbY), thumbDiameter / 2, thumbPaint);
    canvas.drawCircle(
        Offset(thumbX, thumbY), thumbDiameter / 2, thumbBorderPaint);

    drawTextAlongsideKnob(
      canvas,
      knobAngle,
      thumbX,
      thumbY,
      value + valueOffset,
      center,
      radius,
      knobTextSize,
      knobTextColor,
    );

// Рисуем значения внутри круга  ИЛИ ТУШИМ ЗНАЧЕНИЕ ВЫВОДИМОЕ

/*
    drawInsideValues(
      canvas,
      center,
      displayValue,
      insideTextSize,
      insideTextColor,
      integerPartTextSize,
      integerPartTextColor,
      decimalPartTextSize,
      decimalPartTextColor,
      decimalOffsetY,
    );

    */

    // print('knobAngle: $knobAngle');

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  // Текст рядом с бегунком
  void drawTextAlongsideKnob(
      Canvas canvas,
      double knobAngle,
      double thumbX,
      double thumbY,
      double value,
      Offset center,
      double radius,
      double textSize,
      Color textColor) {
    double textOffsetX = thumbX + 38 * math.cos(knobAngle);
    double textOffsetY = thumbY + 38 * math.sin(knobAngle);

    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: '${roundToNearestHalf(value)}',
        style: TextStyle(
          color: textColor,
          fontSize: textSize,
        ),
      ),
      textDirection: CustomTextDirection.LTR,
    );
    textPainter.layout();

    canvas.save();
    canvas.translate(textOffsetX, textOffsetY);
    canvas.rotate(-math.pi);
    textPainter.paint(
        canvas, Offset(-textPainter.width / 2, -textPainter.height / 2));
    canvas.restore();
  }

  // Текст внутри круга
  void drawInsideValues(
      Canvas canvas,
      Offset center,
      double value,
      double textSize,
      Color textColor,
      double integerPartTextSize,
      Color integerPartTextColor,
      double decimalPartTextSize,
      Color decimalPartTextColor,
      double decimalOffsetY) {
    String displayText = '${roundToNearestHalf(value)} °C';

    List<String> parts = displayText.split('.');
    String integerPart = parts[0];
    String decimalPart = parts.length > 1 ? '.${parts[1]}' : '';

    TextPainter integerTextPainter = TextPainter(
      text: TextSpan(
        text: integerPart,
        style: TextStyle(
          color: integerPartTextColor,
          fontSize: integerPartTextSize,
        ),
      ),
      textDirection: CustomTextDirection.LTR,
    );
    integerTextPainter.layout();

    TextPainter decimalTextPainter = TextPainter(
      text: TextSpan(
        text: decimalPart,
        style: TextStyle(
          color: decimalPartTextColor,
          fontSize: decimalPartTextSize,
        ),
      ),
      textDirection: CustomTextDirection.LTR,
    );
    decimalTextPainter.layout();

    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(math.pi);
    canvas.translate(-center.dx, -center.dy);

    integerTextPainter.paint(
        canvas,
        Offset(
            center.dx -
                (integerTextPainter.width + decimalTextPainter.width) / 2,
            center.dy - integerTextPainter.height / 2));
    decimalTextPainter.paint(
        canvas,
        Offset(
            center.dx -
                (integerTextPainter.width + decimalTextPainter.width) / 2 +
                integerTextPainter.width,
            center.dy - decimalTextPainter.height / 2 + decimalOffsetY));

    canvas.restore();
  }
}

// Функция округления до 0.5
double roundToNearestHalf(double value) {
  return (value * 2).round() / 2.0;
}

//-----------------------------------------------SLIDER WRAPPER-----------------------------------------------

class CustomSliderWrapper extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  CustomSliderWrapper({
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomSlider(
            value: value,
            min: 0,
            max: 47,
            activeColor: Color.fromARGB(0, 230, 8, 8),
            inactiveColor: Color.fromARGB(0, 15, 15, 15),
            circleDiameter: 255,
            thumbDiameter: 40,
            thumbBorderColor: const Color.fromARGB(255, 180, 180, 180),
            thumbBorderWidth: 1.0,
            thumbFillColor: const Color.fromARGB(
                255, 255, 255, 255), //Color thumbFillColor цвет фона бегунка
            //thumbFillColor: const Color.fromARGB(
            //   255, 241, 244, 248), //Color thumbFillColor цвет фона бегунка
            startAngle: 144.5,
            endAngle: 39.5,
            textSize: 20,
            textColor: Color.fromARGB(255, 206, 203, 203),
            angleRangeStart: -10.0,
            angleRangeEnd: 260.5,
            onChanged: onChanged,
            displayValue: value + 6.0,
            valueOffset: 6.0,
            tickLength: 10.0,
            tickWidth: 0.3,
            tickColor: Color.fromARGB(0, 255, 255, 255),
            trackWidth: 10,
            progressColor: Color.fromARGB(0, 250, 2, 2),
            progressWidth: 10,
            insideTextSize: 35,
            insideTextColor: Color.fromARGB(255, 73, 73, 73),
            knobTextSize: 16,
            knobTextColor: Color.fromARGB(255, 134, 134, 134),
            backgroundColor: Color.fromARGB(0, 250, 250, 250),
            integerPartTextSize: 30,
            integerPartTextColor: Color.fromARGB(255, 73, 73, 73),
            decimalPartTextSize: 20,
            decimalPartTextColor: Color.fromARGB(255, 73, 73, 73),
            decimalOffsetY: 3.0,
          ),
        ],
      ),
    );
  }
}

/*
//-----------------------------------------------SLIDER WRAPPER-----------------------------------------------
class CustomSliderWrapper extends StatelessWidget {
  final double value; // Текущее значение
  final ValueChanged<double> onChanged; // Колбэк для обновления значения

  CustomSliderWrapper({

    required this.value,
    required this.onChanged,

  });




  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomSlider(
            value: value, // Передаем текущее значение
            min: 0,
            max: 47,
            activeColor: Color.fromARGB(255, 230, 8, 8),
            inactiveColor: Color.fromARGB(255, 15, 15, 15),
            circleDiameter: 255,
            thumbDiameter: 40,
            thumbBorderColor: const Color.fromARGB(255, 180, 180, 180),
            thumbBorderWidth: 1.0,
            thumbFillColor: const Color.fromARGB(255, 255, 255, 255),
            startAngle: 144.5,
            endAngle: 39.5,
            textSize: 20,
            textColor: Color.fromARGB(255, 206, 203, 203),
            angleRangeStart: -10.0,
            angleRangeEnd: 260.5,
            onChanged: onChanged, // Колбэк при изменении
            displayValue: value + 6.0,
            valueOffset: 6.0,
            tickLength: 10.0,
            tickWidth: 0.3,
            tickColor: Color.fromARGB(255, 255, 255, 255),
            trackWidth: 10,
            progressColor: Color.fromARGB(255, 250, 2, 2),
            progressWidth: 10,
            insideTextSize: 35,
            insideTextColor: Color.fromARGB(255, 73, 73, 73),
            knobTextSize: 16,
            knobTextColor: Color.fromARGB(255, 134, 134, 134),
            backgroundColor: Color.fromARGB(255, 250, 250, 250),
            integerPartTextSize: 30,
            integerPartTextColor: Color.fromARGB(255, 73, 73, 73),
            decimalPartTextSize: 20,
            decimalPartTextColor: Color.fromARGB(255, 73, 73, 73),
            decimalOffsetY: 3.0,
          ),
        ],
      ),
    );
  }
}

*/

//-----------------------------------------------КНОПКИ-----------------------------------------------
class PrimitiveButtonContainer extends StatefulWidget {
  final double topOffset; // Смещение сверху
  final ValueChanged<double> onUpdateValue; // Обратный вызов для обновления
  final double currentValue; // Текущее значение
  final bool showControlField; // Флаг отображения поля
  final double offsetValue; // Смещение
  final double buttonSpacing; // Расстояние между кнопками

  PrimitiveButtonContainer({
    required this.topOffset,
    required this.onUpdateValue,
    required this.currentValue,
    this.showControlField = false,
    this.offsetValue = 6.0,
    this.buttonSpacing = 130.0,
  });

  @override
  _PrimitiveButtonContainerState createState() =>
      _PrimitiveButtonContainerState();
}

class _PrimitiveButtonContainerState extends State<PrimitiveButtonContainer> {
  Timer? _incrementTimer;
  Timer? _decrementTimer;

  void _startIncrementing() {
    _incrementTimer?.cancel();
    _incrementTimer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (roundToNearestHalf(widget.currentValue + widget.offsetValue) < 40) {
        _updateValue(widget.currentValue + 0.5);
      }
    });
  }

  void _stopIncrementing() {
    _incrementTimer?.cancel();
  }

  void _startDecrementing() {
    _decrementTimer?.cancel();
    _decrementTimer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (roundToNearestHalf(widget.currentValue + widget.offsetValue) > 5) {
        _updateValue(widget.currentValue - 0.5);
      }
    });
  }

  void _stopDecrementing() {
    _decrementTimer?.cancel();
  }

  void _updateValue(double newValue) {
    newValue = roundToNearestHalf(newValue);
    widget.onUpdateValue(newValue);
  }

  @override
  Widget build(BuildContext context) {
    double displayValue =
        roundToNearestHalf(widget.currentValue) + widget.offsetValue;

    return Positioned(
      top: widget.topOffset,
      left: 0,
      right: 0,
      child: Container(
        width: 300,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: const Color.fromARGB(0, 33, 149, 243),
            width: 2.0,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  if (roundToNearestHalf(
                          widget.currentValue + widget.offsetValue) >
                      5) {
                    _updateValue(widget.currentValue - 0.5);
                  }
                },
                onLongPressStart: (_) => _startDecrementing(),
                onLongPressEnd: (_) => _stopDecrementing(),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 236, 236, 236),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '-',
                      style: TextStyle(
                        color: Color.fromARGB(255, 53, 53, 53),
                        fontSize: 36,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: widget.buttonSpacing),
              if (widget.showControlField)
                Text(
                  displayValue.toStringAsFixed(1),
                  style: TextStyle(fontSize: 24),
                ),
              if (widget.showControlField)
                SizedBox(width: widget.buttonSpacing),
              GestureDetector(
                onTap: () {
                  if (roundToNearestHalf(
                          widget.currentValue + widget.offsetValue) <
                      40) {
                    _updateValue(widget.currentValue + 0.5);
                  }
                },
                onLongPressStart: (_) => _startIncrementing(),
                onLongPressEnd: (_) => _stopIncrementing(),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 236, 236, 236),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '+',
                      style: TextStyle(
                        color: Color.fromARGB(255, 53, 53, 53),
                        fontSize: 36,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//-----------------------------------------------КНОПКИ-----------------------------------------------

//-----------------------------------------------ГЛАВНЫЙ ВИДЖЕТ-----------------------------------------------
/*
class CustomSliderButtonWidget extends StatefulWidget {
  final double? width;
  final double? height;
  final ValueChanged<double> onChanged;
  final double topOffset;

  CustomSliderButtonWidget({
    required this.onChanged,
    this.width,
    this.height,
    this.topOffset = 0.0,
  });

  @override
  _CustomSliderButtonWidgetState createState() =>
      _CustomSliderButtonWidgetState();
}

class _CustomSliderButtonWidgetState extends State<CustomSliderButtonWidget> {
  double _currentValue = 20.0;
  double _containerTopOffset = 250; // Смещение контейнера сверху

  void _updateValue(double newValue) {
    setState(() {
      _currentValue = newValue;
      widget.onChanged(newValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Важно: теперь оборачиваем все в Stack, чтобы Positioned не ругался
    return Stack(
      children: [
        Positioned(
          top: widget.topOffset,
          left: 0,
          right: 0,
          child: Container(
            width: widget.width,
            height: widget.height,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Container(
                width: 350,
                height: 350,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: CustomSliderWrapper(
                        value: _currentValue,
                        onChanged: _updateValue,
                      ),
                    ),

// потушили кнопки
                    // КНОПКИ + И -
/*
                    PrimitiveButtonContainer(
                      topOffset: _containerTopOffset,
                      onUpdateValue: _updateValue,
                      currentValue: _currentValue,
                    ),
*/
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

*/

//-----------------------------------------------ГЛАВНЫЙ ВИДЖЕТ-----------------------------------------------

class CustomSliderButtonWidget extends StatefulWidget {
  final double? width;
  final double? height;
  final ValueChanged<double> onChanged;
  final double topOffset;

  // ПРАВКА: Добавлен параметр `value` для синхронизации значения
  final double value; // Новый параметр

  CustomSliderButtonWidget({
    required this.onChanged,
    this.width,
    this.height,
    this.topOffset = 0.0,
    required this.value, // ПРАВКА: Новый обязательный параметр
  });

  @override
  _CustomSliderButtonWidgetState createState() =>
      _CustomSliderButtonWidgetState();
}

class _CustomSliderButtonWidgetState extends State<CustomSliderButtonWidget> {
  // ИЗНАЧАЛЬНО: Локальное значение текущего состояния слайдера
  late double _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget
        .value; // ПРАВКА: Инициализация локального значения из входного параметра
  }

  @override
  void didUpdateWidget(covariant CustomSliderButtonWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // ПРАВКА: Синхронизация значения снаружи
    if (oldWidget.value != widget.value) {
      setState(() {
        _currentValue = widget.value;
      });
    }
  }

  void _updateValue(double newValue) {
    setState(() {
      _currentValue = newValue; // Обновляем локальное значение
      widget.onChanged(newValue); // Передаем новое значение наружу через колбэк
    });
  }

  @override
  Widget build(BuildContext context) {
    // Важно: теперь оборачиваем все в Stack, чтобы Positioned не ругался
    return Stack(
      children: [
        Positioned(
          top: widget.topOffset,
          left: 0,
          right: 0,
          child: Container(
            width: widget.width,
            height: widget.height,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Container(
                width: 350,
                height: 350,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: CustomSliderWrapper(
                        value: _currentValue, // Используем локальное значение
                        onChanged: _updateValue, // Обратный вызов
                      ),
                    ),

// потушили кнопки
                    // КНОПКИ + И -
/*
                    PrimitiveButtonContainer(
                      topOffset: _containerTopOffset,
                      onUpdateValue: _updateValue,
                      currentValue: _currentValue,
                    ),
*/
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
