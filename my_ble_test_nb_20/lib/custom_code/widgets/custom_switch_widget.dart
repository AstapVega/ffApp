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

// Определение кастомного переключателя
class CustomSwitchWidget extends StatefulWidget {
  const CustomSwitchWidget({
    super.key,
    this.width, // Ширина виджета
    this.height, // Высота виджета
    required this.onChanged, // Колбек, который вызывается при изменении состояния
    required this.value, // Начальное состояние переключателя
    this.activeTrackColor, // Цвет активного трека
    this.inactiveTrackColor, // Цвет неактивного трека
    this.trackBorderColor, // Цвет рамки трека
    this.trackBorderWidth, // Толщина рамки трека
    this.activeThumbColor, // Цвет активного бегунка
    this.inactiveThumbColor, // Цвет неактивного бегунка
    this.activeThumbImage, // Изображение активного бегунка
    this.inactiveThumbImage, // Изображение неактивного бегунка
    this.thumbBorderColor, // Цвет рамки бегунка
    this.thumbBorderWidth, // Толщина рамки бегунка
    required this.thumbRadius, // Радиус бегунка
    required this.trackHeight, // Высота трека
    required this.trackLength, // Длина трека
    this.part, // Фон трека (если используется)
    required this.animationDurationMs, // Длительность анимации в миллисекундах
    required this.shadowColor, // Цвет тени бегунка
    required this.shadowBlurRadius, // Радиус размытия тени
    required this.shadowOffsetX, // Смещение тени по X
    required this.shadowOffsetY, // Смещение тени по Y
    this.enableSound = true, // Флаг для включения звука при переключении
  });

  // Определение входных параметров
  final double? width;
  final double? height;
  final Future Function(bool outputState) onChanged;
  final bool value;
  final Color? activeTrackColor;
  final Color? inactiveTrackColor;
  final Color? trackBorderColor;
  final double? trackBorderWidth;
  final Color? activeThumbColor;
  final Color? inactiveThumbColor;
  final String? activeThumbImage;
  final String? inactiveThumbImage;
  final Color? thumbBorderColor;
  final double? thumbBorderWidth;
  final double thumbRadius;
  final double trackHeight;
  final double trackLength;
  final String? part;
  final int animationDurationMs;
  final Color shadowColor;
  final double shadowBlurRadius;
  final double shadowOffsetX;
  final double shadowOffsetY;
  final bool? enableSound;

  @override
  State<CustomSwitchWidget> createState() => _CustomSwitchWidgetState();
}

class _CustomSwitchWidgetState extends State<CustomSwitchWidget> {
  late bool currentValue; // Локальное состояние переключателя
  bool isLocked = false; // Флаг блокировки для предотвращения повторных событий

  @override
  void initState() {
    super.initState();
    currentValue = widget.value; // Устанавливаем начальное состояние
  }

  // Обработчик нажатий на переключатель
  Future<void> _handleToggle() async {
    if (isLocked) return; // Если заблокировано, выходим

    setState(() {
      isLocked = true; // Устанавливаем блокировку
      currentValue = !currentValue; // Переключаем состояние
    });

    // Воспроизводим звуковой отклик, если включено
    if (widget.enableSound ?? true) {
      Feedback.forTap(context);
    }

    // Вызываем колбек после завершения анимации
    await Future.delayed(
      Duration(milliseconds: widget.animationDurationMs),
      () => widget.onChanged(currentValue),
    );

    // Снимаем блокировку через 150 мс
    await Future.delayed(const Duration(milliseconds: 150), () {
      setState(() {
        isLocked = false; // Снимаем блокировку
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double effectiveThumbDiameter =
        widget.thumbRadius * 2; // Диаметр бегунка
    final double trackWidth = widget.trackLength; // Длина трека
    final double trackHeight = widget.trackHeight; // Высота трека

    return GestureDetector(
      behavior: HitTestBehavior.opaque, // Перехватываем клики по всей области
      onTap: _handleToggle, // Привязываем обработчик нажатий
      child: Padding(
        padding: const EdgeInsets.all(4.0), // Увеличиваем зону клика
        child: Container(
          width: widget.width ?? trackWidth, // Устанавливаем ширину трека
          height: widget.height ?? trackHeight, // Устанавливаем высоту трека
          child: Stack(
            alignment: Alignment.center, // Центровка содержимого
            children: [
              // Отображение трека
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: trackWidth, // Длина трека
                  height: trackHeight, // Высота трека
                  decoration: BoxDecoration(
                    color: currentValue
                        ? widget.activeTrackColor ?? Colors.green
                        : widget.inactiveTrackColor ?? Colors.grey,
                    border: Border.all(
                      color: widget.trackBorderColor ?? Colors.transparent,
                      width: widget.trackBorderWidth ?? 0.0,
                    ),
                    borderRadius: BorderRadius.circular(trackHeight / 2),
                    image: widget.part != null
                        ? DecorationImage(
                            image: AssetImage(widget.part!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                ),
              ),
              // Отображение бегунка
              AnimatedAlign(
                alignment: currentValue
                    ? Alignment.centerRight
                    : Alignment.centerLeft, // Положение бегунка
                duration: Duration(milliseconds: widget.animationDurationMs),
                curve: Curves.easeInOut, // Плавность анимации
                child: Container(
                  width: effectiveThumbDiameter, // Ширина бегунка
                  height: effectiveThumbDiameter, // Высота бегунка
                  decoration: BoxDecoration(
                    color: currentValue
                        ? widget.activeThumbColor ?? Colors.white
                        : widget.inactiveThumbColor ?? Colors.black,
                    border: Border.all(
                      color: widget.thumbBorderColor ?? Colors.transparent,
                      width: widget.thumbBorderWidth ?? 0.0,
                    ),
                    borderRadius:
                        BorderRadius.circular(widget.thumbRadius), // Скругление
                    boxShadow: [
                      BoxShadow(
                        color: widget.shadowColor,
                        blurRadius: widget.shadowBlurRadius,
                        offset: Offset(
                          widget.shadowOffsetX,
                          widget.shadowOffsetY,
                        ),
                      ),
                    ],
                    image: currentValue && widget.activeThumbImage != null
                        ? DecorationImage(
                            image: AssetImage(widget.activeThumbImage!),
                            fit: BoxFit.cover,
                          )
                        : widget.inactiveThumbImage != null
                            ? DecorationImage(
                                image: AssetImage(widget.inactiveThumbImage!),
                                fit: BoxFit.cover,
                              )
                            : null,
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

/*
### Документация

#### Назначение
CustomSwitchWidget — это пользовательский виджет для создания кастомного переключателя.

#### Входные параметры
- **`onChanged`**: Колбек, вызываемый при изменении состояния.
- **`value`**: Текущее состояние переключателя.
- **Цвета**: `activeTrackColor`, `inactiveTrackColor`, `activeThumbColor`, `inactiveThumbColor`.
- **Размеры**: `width`, `height`, `thumbRadius`, `trackHeight`, `trackLength`.
- **Анимация**: `animationDurationMs` определяет скорость переключения.
- **Звук**: `enableSound` включает/отключает звуковую обратную связь.

#### Логика работы
1. При нажатии вызывается `_handleToggle`, который:
   - Переключает состояние `currentValue`.
   - Блокирует повторные нажатия с помощью `isLocked`.
   - Вызывает колбек и воспроизводит звук (если включено).
2. Состояние бегунка обновляется с помощью `AnimatedAlign`.

#### Особенности
- Полная кастомизация внешнего вида.
- Блокировка повторных кликов для предотвращения дребезга.
- Плавная анимация переключения.

*/
