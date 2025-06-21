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

import 'package:flutter/cupertino.dart' as cupertino;

class CustomCupertinoDatePicker extends StatefulWidget {
  const CustomCupertinoDatePicker({
    super.key,
    this.width,
    this.height,
    required this.onDateTimeChanged,
    this.modePicker,
    this.initialCurentDateTime,
    this.minimumDate,
    this.maximumDate,
    required this.minuteInterval,
    required this.use24hFormat,
    this.scaleX =
        1.0, // 🔥 Коэффициент масштабирования по ширине (по умолчанию 1)
    this.scaleY =
        1.0, // 🔥 Коэффициент масштабирования по высоте (по умолчанию 1)
  });

  final double? width;
  final double? height;
  final Future Function(DateTime myDataTime) onDateTimeChanged;
  final MyCupertinoDatePickerMode? modePicker;
  final DateTime? initialCurentDateTime;
  final DateTime? minimumDate;
  final DateTime? maximumDate;
  final int minuteInterval;
  final bool use24hFormat;
  final double? scaleX; // 🔥 Новые параметры масштабирования
  final double? scaleY;

  @override
  State<CustomCupertinoDatePicker> createState() =>
      _CustomCupertinoDatePickerState();
}

class _CustomCupertinoDatePickerState extends State<CustomCupertinoDatePicker> {
  late DateTime selectedDateTime;

  @override
  void initState() {
    super.initState();
    selectedDateTime = widget.initialCurentDateTime ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 250,
      child: Transform.scale(
        scaleX: widget.scaleX, // 🔥 Маштабирование по ширине
        scaleY: widget.scaleY, // 🔥 Маштабирование по высоте
        child: cupertino.CupertinoDatePicker(
          mode: _getPickerMode(widget.modePicker),
          initialDateTime: selectedDateTime,
          minimumDate: widget.minimumDate,
          maximumDate: widget.maximumDate,
          minuteInterval: widget.minuteInterval,
          use24hFormat: widget.use24hFormat,
          onDateTimeChanged: (DateTime newDate) async {
            setState(() {
              selectedDateTime = newDate;
            });
            await widget.onDateTimeChanged(newDate);
          },
        ),
      ),
    );
  }

  // 🔥 Конвертация `MyCupertinoDatePickerMode` в `CupertinoDatePickerMode`
  cupertino.CupertinoDatePickerMode _getPickerMode(
      MyCupertinoDatePickerMode? mode) {
    if (mode == null) {
      return cupertino.CupertinoDatePickerMode.dateAndTime;
    }
    switch (mode) {
      case MyCupertinoDatePickerMode.time:
        return cupertino.CupertinoDatePickerMode.time;
      case MyCupertinoDatePickerMode.date:
        return cupertino.CupertinoDatePickerMode.date;
      case MyCupertinoDatePickerMode.dateAndTime:
      default:
        return cupertino.CupertinoDatePickerMode.dateAndTime;
    }
  }
}
