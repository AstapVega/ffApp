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

import 'index.dart'; // Импорт других кастомных виджетов
import '/custom_code/actions/index.dart'; // Импорт кастомных экшенов

import 'index.dart'; // Повторный импорт на всякий случай

// ===============================
// БЛОК 1.
// Объявление кастомного слайдера
// ===============================
class MyCustomSlider extends StatefulWidget {
  const MyCustomSlider({
    super.key,
    this.width, // Ширина виджета
    this.height, // Высота виджета
    this.min, // Минимальное значение
    this.max, // Максимальное значение
    this.inputvalue, // Начальное значение бегунка
    this.onChanged, // Колбэк при изменении значения
    this.onChangeStart, // Колбэк при начале касания бегунка
    this.labelBuilder, // Построитель кастомной подписи
    this.trackHeight, // Толщина трека
    this.trackColor, // Цвет трека
    this.thumbSize, // Размер бегунка
    this.thumbColor, // Цвет бегунка
    this.nSteps, // ← НОВОЕ: количество логических шагов (точек) дискретизации
    this.backgroundColor, // Фон контейнера
    this.trackBorderRadius, // Скругление углов трека
  });

  final double? width;
  final double? height;
  final double? min;
  final double? max;
  final double? inputvalue;
  final Future Function(double? outputvalue)? onChanged;
  final Future Function(double? startValue)? onChangeStart;
  final Widget Function()? labelBuilder;
  final double? trackHeight;
  final Color? trackColor;
  final double? thumbSize;
  final Color? thumbColor;
  final int? nSteps; // ← ИМЕННО ТАК: количество шагов (точек), например 100–400
  final Color? backgroundColor;
  final double? trackBorderRadius;

  @override
  State<MyCustomSlider> createState() => _MyCustomSliderState();
}

// ===============================
// БЛОК 2.
// Состояние кастомного слайдера
// ===============================
class _MyCustomSliderState extends State<MyCustomSlider> {
  late double currentValue; // Локальное значение бегунка

  @override
  void initState() {
    super.initState();
    currentValue =
        widget.inputvalue ?? widget.min ?? 0.0; // Установка начального значения
  }

  @override
  Widget build(BuildContext context) {
    // Установка всех параметров с дефолтами
    final double min = widget.min ?? 0.0;
    final double max = widget.max ?? 100.0;
    final int nSteps =
        widget.nSteps ?? 100; // ← Количество логических шагов (точек)
    final double width = widget.width ?? double.infinity;
    final double height = widget.height ?? 60.0;
    final double trackHeight = widget.trackHeight ?? 4.0;
    final Color trackColor = widget.trackColor ?? Colors.grey;
    final double trackRadius = widget.trackBorderRadius ?? trackHeight / 2;
    final double thumbSize = widget.thumbSize ?? 16.0;
    final Color thumbColor = widget.thumbColor ?? Colors.blueAccent;
    final Color backgroundColor = widget.backgroundColor ?? Colors.transparent;

    // Пересчёт количества делений слайдера
    final int divisions = nSteps > 1 ? nSteps - 1 : 1;

    // Локальная коррекция трека
    final double fineAdjust = 24.0; // Ручная подгонка (в пикселях)
    final double visualTrackWidth = width - thumbSize - fineAdjust;
    final double visualTrackMargin = (thumbSize + fineAdjust) / 2;

    return Container(
      width: width,
      height: height,
      color: backgroundColor,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          // ===============================
          // БЛОК 3.
          // Декоративный трек
          // ===============================
          Container(
            width: visualTrackWidth,
            height: trackHeight,
            margin: EdgeInsets.symmetric(horizontal: visualTrackMargin),
            decoration: BoxDecoration(
              color: trackColor,
              borderRadius: BorderRadius.circular(trackRadius),
            ),
          ),

          // ===============================
          // БЛОК 4.
          // Основной слайдер с прозрачными треками
          // ===============================
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: trackHeight,
              activeTrackColor: Colors.transparent,
              inactiveTrackColor: Colors.transparent,
              thumbShape: RoundSliderThumbShape(
                enabledThumbRadius: thumbSize / 2,
              ),
              thumbColor: thumbColor,
              overlayColor: thumbColor.withOpacity(0.15),
            ),
            child: Slider(
              value: currentValue.clamp(min, max), // Ограничение значений
              min: min,
              max: max,
              divisions:
                  divisions, // ← Используем рассчитанное количество делений
              onChangeStart: (value) async {
                if (widget.onChangeStart != null) {
                  await widget.onChangeStart!(
                      value); // Вызов колбэка при начале касания
                }
              },
              onChanged: (value) async {
                setState(() {
                  currentValue = value; // Обновление локального состояния
                });
                if (widget.onChanged != null) {
                  await widget.onChanged!(value); // Вызов внешнего колбэка
                }
              },
            ),
          ),

          // ===============================
          // БЛОК 5.
          // Подпись над бегунком (если задана)
          // ===============================
          if (widget.labelBuilder != null)
            Positioned(
              left: ((currentValue - min) / (max - min)) * (width - thumbSize),
              top: 0,
              child: widget.labelBuilder!(),
            ),
        ],
      ),
    );
  }
}
