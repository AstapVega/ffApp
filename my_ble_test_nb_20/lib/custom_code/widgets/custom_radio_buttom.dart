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

/// Кастомный виджет `CustomRadioButtom`
///
/// Улучшенная версия с правильной обработкой внешнего состояния (`state`),
/// корректным обновлением и защитой от дребезга нажатий.
class CustomRadioButtom extends StatefulWidget {
  const CustomRadioButtom({
    super.key,
    this.width, // Опциональная ширина кнопки (по умолчанию 24.0)
    this.height, // Опциональная высота кнопки (по умолчанию 24.0)
    required this.onChanged, // Колбек при изменении состояния
    required this.activeFillColor, // Цвет заливки в активном состоянии
    required this.inactiveFillColor, // Цвет заливки в неактивном состоянии
    required this.activeBorderColor, // Цвет границы в активном состоянии
    required this.inactiveBorderColor, // Цвет границы в неактивном состоянии
    required this.borderThickness, // Толщина границы
    required this.innerCircleColor, // Цвет внутреннего круга (активное состояние)
    required this.innerCircleSize, // Размер внутреннего круга (0-1 от общего размера)
    required this.enableSound, // Включение/отключение звукового отклика
    this.state, // Внешнее управление состоянием (если null, управляется локально)
    this.clickable, // Можно ли нажимать (если null, считается `true`)
  });

  final double? width;
  final double? height;
  final Future Function(bool isSelected) onChanged;
  final Color activeFillColor;
  final Color inactiveFillColor;
  final Color activeBorderColor;
  final Color inactiveBorderColor;
  final double borderThickness;
  final Color innerCircleColor;
  final double innerCircleSize;
  final bool enableSound;
  final bool? state;
  final bool? clickable;

  @override
  State<CustomRadioButtom> createState() => _CustomRadioButtomState();
}

class _CustomRadioButtomState extends State<CustomRadioButtom> {
  bool isSelected = false; // Локальное состояние (если `state` не задано)
  bool isLocked = false; // Блокировка повторных нажатий (защита от дребезга)

  /// Первоначальная инициализация. Проверяем, есть ли `state` при создании.
  @override
  void initState() {
    super.initState();
    if (widget.state != null) {
      isSelected = widget
          .state!; // Если `state` задан, синхронизируем локальное состояние
    }
  }

  /// Обновление состояния при изменении `state` извне.
  @override
  void didUpdateWidget(covariant CustomRadioButtom oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.state != null && widget.state != oldWidget.state) {
      setState(() {
        isSelected =
            widget.state!; // Если `state` изменился, обновляем `isSelected`
      });
    }
  }

  /// Обработчик клика
  Future<void> _handleTap() async {
    if (widget.clickable == false || isLocked)
      return; // Если нажатия запрещены, выходим

    setState(() {
      isLocked = true; // Блокируем повторные нажатия
      isSelected = !isSelected; // Переключаем локальное состояние
    });

    if (widget.enableSound) {
      Feedback.forTap(context); // Включаем тактильный отклик (если разрешено)
    }

    // Вызываем колбэк, чтобы передать новое состояние
    await widget.onChanged(isSelected);

    // Разблокируем через 150 мс (защита от дребезга)
    Future.delayed(const Duration(milliseconds: 150), () {
      setState(() {
        isLocked = false;
      });
    });
  }

  /// Построение UI
  @override
  Widget build(BuildContext context) {
    double buttonSize =
        widget.width ?? 24.0; // Размер радиобаттона по умолчанию
    double innerCircleSize = buttonSize *
        (widget.innerCircleSize > 0 && widget.innerCircleSize <= 1
            ? widget.innerCircleSize
            : 0.5); // Проверка корректности размера внутреннего круга

    bool isClickable = widget.clickable ??
        true; // Если `clickable` не задан, кнопка кликабельна

    return GestureDetector(
      onTap: isClickable
          ? _handleTap
          : null, // Если `clickable = false`, клики отключены
      behavior: HitTestBehavior
          .translucent, // Позволяет кликать даже по прозрачным областям
      child: Container(
        width: buttonSize,
        height: buttonSize,
        decoration: BoxDecoration(
          color: isSelected
              ? widget.activeFillColor
              : widget.inactiveFillColor, // Цвет заливки (активный/неактивный)
          shape: BoxShape.circle, // Всегда круглая форма
          border: Border.all(
            color: isSelected
                ? widget.activeBorderColor
                : widget.inactiveBorderColor, // Цвет границы
            width: widget.borderThickness, // Толщина границы
          ),
        ),
        child: isSelected
            ? Center(
                child: Container(
                  width: innerCircleSize, // Размер внутреннего круга
                  height: innerCircleSize,
                  decoration: BoxDecoration(
                    color: widget.innerCircleColor, // Цвет внутреннего круга
                    shape: BoxShape.circle,
                  ),
                ),
              )
            : null, // Если `isSelected = false`, внутренний круг не рисуется
      ),
    );
  }
}

/*

   **Документация к `CustomRadioButtom`**

## **Описание**
`CustomRadioButtom` — это кастомный радиобаттон, который:
- Поддерживает управление состоянием извне (`state`).
- Может отключать кликабельность (`clickable = false`).
- Поддерживает звуковую обратную связь (`enableSound`).
- Работает без дребезга (`isLocked`).

---

## **Входные параметры**
| Параметр             | Тип                   | Описание |
|----------------------|----------------------|----------|
| `width`             | `double?`             | Ширина радиобаттона (по умолчанию `24.0`) |
| `height`            | `double?`             | Высота радиобаттона (по умолчанию `24.0`) |
| `onChanged`         | `Future Function(bool)` | Колбек, вызываемый при нажатии |
| `activeFillColor`   | `Color`               | Цвет фона в активном состоянии |
| `inactiveFillColor` | `Color`               | Цвет фона в неактивном состоянии |
| `activeBorderColor` | `Color`               | Цвет границы в активном состоянии |
| `inactiveBorderColor` | `Color`            | Цвет границы в неактивном состоянии |
| `borderThickness`   | `double`              | Толщина границы |
| `innerCircleColor`  | `Color`               | Цвет внутреннего круга |
| `innerCircleSize`   | `double`              | Размер внутреннего круга (от `0` до `1`) |
| `enableSound`       | `bool`                | Включает/выключает звуковую обратную связь |
| `state`             | `bool?`               | Управляет состоянием извне (`true` - вкл, `false` - выкл) |
| `clickable`         | `bool?`               | Отключает кликабельность (`false` - только индикатор) |

---


*/
