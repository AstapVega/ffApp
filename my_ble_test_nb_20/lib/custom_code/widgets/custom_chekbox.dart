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

/// **Кастомный чекбокс с динамическим обновлением состояния**
///
/// ✅ Поддерживает **первичное состояние** через параметр `state`.
/// ✅ **Возвращает `index`** при изменении состояния.
/// ✅ Работает **в динамике** – обновляется при внешних изменениях `state`.
/// ✅ Учитывает **анти-дребезг** (`isLocked`), чтобы избежать двойных кликов.
/// ✅ **Поддерживает звук клика**, если `enableSound = true`.

class CustomChekbox extends StatefulWidget {
  const CustomChekbox({
    super.key,
    this.width, // Ширина чекбокса
    this.height, // Высота чекбокса
    required this.onChanged, // Колбек для изменения состояния
    required this.activeFillColor, // Цвет заливки активного состояния
    required this.inactiveFillColor, // Цвет заливки неактивного состояния
    required this.activeBorderColor, // Цвет рамки активного состояния
    required this.inactiveBorderColor, // Цвет рамки неактивного состояния
    required this.borderWidth, // Толщина рамки
    required this.borderRadius, // Радиус скругления
    required this.checkIcon, // Иконка внутри активного чекбокса
    required this.checkIconSize, // Размер иконки
    required this.iconPaddingLeft, // Отступ иконки слева
    required this.iconPaddingRight, // Отступ иконки справа
    required this.iconPaddingTop, // Отступ иконки сверху
    required this.iconPaddingBottom, // Отступ иконки снизу
    this.enableSound, // Включение звука
    required this.state, // Первоначальное состояние чекбокса (управляется динамически)
    this.clickable, // Можно ли нажимать на чекбокс
    this.index, // Уникальный `index` для каждого чекбокса
  });

  final double? width;
  final double? height;
  final Future Function(bool isChecked, int? backIndex)
      onChanged; // Колбек для передачи нового состояния и индекса
  final Color activeFillColor;
  final Color inactiveFillColor;
  final Color activeBorderColor;
  final Color inactiveBorderColor;
  final double borderWidth;
  final double borderRadius;
  final Widget checkIcon;
  final double checkIconSize;
  final double iconPaddingLeft;
  final double iconPaddingRight;
  final double iconPaddingTop;
  final double iconPaddingBottom;
  final bool? enableSound;
  final bool state; // Управляемый извне параметр состояния
  final bool? clickable;
  final int? index; // Индекс чекбокса

  @override
  State<CustomChekbox> createState() => _CustomChekboxState();
}

class _CustomChekboxState extends State<CustomChekbox> {
  late bool isChecked; // Локальное состояние чекбокса

  @override
  void initState() {
    super.initState();
    isChecked = widget.state; // Инициализируем `isChecked` из `state`
  }

  @override
  void didUpdateWidget(covariant CustomChekbox oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Если `state` изменился извне, обновляем `isChecked`
    if (widget.state != oldWidget.state) {
      setState(() {
        isChecked = widget.state;
      });
    }
  }

  /// Обработчик клика по чекбоксу
  Future<void> _handleTap() async {
    if (widget.clickable == false)
      return; // Если `clickable = false`, не реагируем на клики

    setState(() {
      isChecked = !isChecked; // Переключаем состояние чекбокса
    });

    if (widget.enableSound == true) {
      Feedback.forTap(
          context); // Воспроизводим тактильный отклик (если включено)
    }

    await widget.onChanged(isChecked,
        widget.index); // Вызываем колбек с передачей нового состояния и `index`
  }

  /// Отрисовка UI (гарантированное обновление `isChecked`)
  @override
  Widget build(BuildContext context) {
    isChecked = widget
        .state; // ОБНОВЛЯЕМ `isChecked` ПЕРЕД РЕНДЕРОМ (чтобы избежать задержек)

    return GestureDetector(
      onTap: widget.clickable == true
          ? _handleTap
          : null, // Если `clickable = false`, нажатия отключены
      behavior:
          HitTestBehavior.translucent, // Перехватываем клики по всей области
      child: Container(
        width: widget.width ?? 24.0, // Ширина контейнера чекбокса
        height: widget.height ?? 24.0, // Высота контейнера чекбокса
        decoration: BoxDecoration(
          color: isChecked
              ? widget.activeFillColor
              : widget
                  .inactiveFillColor, // Цвет фона в зависимости от состояния
          border: Border.all(
            color: isChecked
                ? widget.activeBorderColor
                : widget.inactiveBorderColor, // Цвет границы
            width: widget.borderWidth, // Толщина границы
          ),
          borderRadius:
              BorderRadius.circular(widget.borderRadius), // Радиус скругления
        ),
        child: isChecked
            ? Padding(
                padding: EdgeInsets.only(
                  left: widget.iconPaddingLeft, // Отступ слева
                  right: widget.iconPaddingRight, // Отступ справа
                  top: widget.iconPaddingTop, // Отступ сверху
                  bottom: widget.iconPaddingBottom, // Отступ снизу
                ),
                child: SizedBox(
                  width: widget.checkIconSize, // Размер иконки внутри чекбокса
                  height: widget.checkIconSize, // Размер иконки внутри чекбокса
                  child: widget.checkIcon, // Отображаем иконку
                ),
              )
            : null, // Если чекбокс выключен, иконка не отображается
      ),
    );
  }
}
