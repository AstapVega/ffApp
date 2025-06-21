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

import 'package:flutter_colorpicker/flutter_colorpicker.dart'
    as colorpicker; // Импорт библиотеки ColorPicker

// ========== ГЛОБАЛЬНЫЕ ПЕРЕМЕННЫЕ ==========
Function(Color)? globalOnColorSelected; // Функция для обработки выбора цвета

// Карта соответствия типов палитр (из кастомного enum в ColorPicker)
final Map<MyPaletteType, colorpicker.PaletteType> paletteMap = {
  MyPaletteType.hsv: colorpicker.PaletteType.hsv,
  MyPaletteType.hsvWithHue: colorpicker.PaletteType.hsvWithHue,
  MyPaletteType.hsvWithSaturation: colorpicker.PaletteType.hsvWithSaturation,
  MyPaletteType.hsvWithValue: colorpicker.PaletteType.hsvWithValue,
  MyPaletteType.hsl: colorpicker.PaletteType.hsl,
  MyPaletteType.hslWithLightness: colorpicker.PaletteType.hslWithLightness,
  MyPaletteType.hslWithSaturation: colorpicker.PaletteType.hslWithSaturation,
  MyPaletteType.hueWheel: colorpicker.PaletteType.hueWheel,
};

class MyColorPicker extends StatefulWidget {
  const MyColorPicker({
    super.key,
    this.width,
    this.height,
    required this.onColorChanged,
    required this.onColorSelected,
    this.pickerColor,
    this.pickerAreaHeightPercent,
    this.displayThumbColor,
    this.hexInputBar,
    this.availableColors,
    required this.setMyPaletteType,
    required this.setMyColorLabelType,
  });

  final double? width;
  final double? height;
  final Future Function(Color color) onColorChanged;
  final Future Function(Color selectedColor) onColorSelected;
  final Color? pickerColor;
  final double? pickerAreaHeightPercent;
  final bool? displayThumbColor;
  final bool? hexInputBar;
  final List<Color>? availableColors;
  final MyPaletteType setMyPaletteType;
  final List<MyColorLabelType> setMyColorLabelType;

  @override
  State<MyColorPicker> createState() => _MyColorPickerState();
}

class _MyColorPickerState extends State<MyColorPicker> {
  Color currentColor = Colors.yellow; // Текущий выбранный цвет

  @override
  void initState() {
    super.initState();
    // Устанавливаем начальный цвет (если передан)
    currentColor = widget.pickerColor ?? Colors.yellow;
  }

  @override
  void didUpdateWidget(MyColorPicker oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Обновляем цвет, если он изменился извне
    if (widget.pickerColor != oldWidget.pickerColor) {
      setState(() {
        currentColor = widget.pickerColor ?? Colors.yellow;
      });

      // Вызываем обработчик выбора цвета
      widget.onColorSelected(currentColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 300,
      height: widget.height ?? 500,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(0),
      ),
      child: Column(
        children: [
          // ========== COLOR PICKER ==========
          Expanded(
            child: colorpicker.ColorPicker(
              pickerColor: currentColor, // Текущий выбранный цвет
              onColorChanged: (Color newColor) {
                setState(() {
                  currentColor = newColor; // Обновляем текущий цвет
                });

                // Вызываем колбэк с обновлённым значением
                widget.onColorChanged(newColor);
              },
              paletteType: paletteMap[widget.setMyPaletteType] ??
                  colorpicker.PaletteType.hslWithHue, // Тип палитры
              showLabel: true, // Показывать ли подписи цвета
              pickerAreaBorderRadius: BorderRadius.zero,
              pickerAreaHeightPercent: widget.pickerAreaHeightPercent ?? 0.5,
              enableAlpha: false,
              displayThumbColor: widget.displayThumbColor ?? true,
            ),
          ),
        ],
      ),
    );
  }
}
