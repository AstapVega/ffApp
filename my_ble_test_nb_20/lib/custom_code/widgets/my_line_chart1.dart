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

import 'package:fl_chart/fl_chart.dart';

// Объявление кастомного графического виджета
class MyLineChart1 extends StatefulWidget {
  const MyLineChart1({
    super.key, // Ключ виджета, используется Flutter для идентификации
    this.width = 350, // Ширина графика по умолчанию
    this.height = 200, // Высота графика по умолчанию
    this.measuredData =
        const [], // Входной список данных: [x, t1, t2, x, t1, t2, ...]
    this.currentRightMinute =
        1064682025, // Правая граница оси X в минутах от эпохи
    this.viewSizeMinutes =
        1440, // Размер окна по X в минутах (по умолчанию сутки)
    this.minY = 150.0, // Минимальное значение по оси Y (например 15.0°C ×10)
    this.maxY = 300.0, // Максимальное значение по оси Y (например 30.0°C ×10)
    this.lineColorMeasured =
        const Color(0xFF42A5F5), // Цвет линии t1 (измеренная)
    this.lineColorTarget = const Color(0xFFFF9800), // Цвет линии t2 (целевая)
    this.lineWidth, // Толщина линии графика (если null — будет 2.0)
    required this.isCurved, // Нужно ли сглаживать линию (true — кривая)
    required this.showDots, // Показывать точки на графике или нет
    required this.tooltipEnabled, // Включить всплывающие подсказки при наведении/тапе
  });

  final double? width; // Параметр: ширина графика
  final double? height; // Параметр: высота графика
  final List<double>? measuredData; // Входные данные
  final int currentRightMinute; // Правая граница окна по времени
  final int? viewSizeMinutes; // Размер окна по X (в минутах)
  final double? minY; // Нижняя граница по Y
  final double? maxY; // Верхняя граница по Y
  final Color? lineColorMeasured; // Цвет линии t1
  final Color? lineColorTarget; // Цвет линии t2
  final double? lineWidth; // Толщина линий
  final bool isCurved; // Сглаживание линии
  final bool showDots; // Отображать точки или нет
  final bool tooltipEnabled; // Отображать тултипы или нет

  @override
  State<MyLineChart1> createState() =>
      _MyLineChart1State(); // Создаёт состояние
}

class _MyLineChart1State extends State<MyLineChart1> {
  @override
  Widget build(BuildContext context) {
    final double width =
        widget.width ?? 350; // Получаем ширину (если null — 350)
    final double height =
        widget.height ?? 200; // Получаем высоту (если null — 200)
    final List<double> raw =
        widget.measuredData ?? []; // Получаем данные графика

    final int currentRightMinute =
        widget.currentRightMinute; // Правая граница времени
    final int viewSizeMinutes =
        widget.viewSizeMinutes ?? 1440; // Размер временного окна

    final double minY = widget.minY ?? 150.0; // Нижняя граница Y
    final double maxY = widget.maxY ?? 300.0; // Верхняя граница Y

    final Color colorT1 =
        widget.lineColorMeasured ?? Colors.blue; // Цвет первой линии (t1)
    final Color colorT2 =
        widget.lineColorTarget ?? Colors.orange; // Цвет второй линии (t2)

    final double lineWidth = widget.lineWidth ?? 2.0; // Толщина линий
    final bool isCurved = widget.isCurved; // Сглаживание
    final bool showDots = widget.showDots; // Отображение точек
    final bool tooltipEnabled = widget.tooltipEnabled; // Отображение тултипов

    // Создаём два списка точек: для t1 и для t2
    final List<FlSpot> spotsT1 = [];
    final List<FlSpot> spotsT2 = [];

    // Преобразуем входной список [x, t1, t2, ...] в два отдельных потока FlSpot(x, y)
    for (int i = 0; i + 2 < raw.length; i += 3) {
      final x = raw[i]; // Время в минутах от эпохи
      final t1 = raw[i + 1]; // Значение температуры 1
      final t2 = raw[i + 2]; // Значение температуры 2
      spotsT1.add(FlSpot(x, t1)); // Добавляем точку для первой линии
      spotsT2.add(FlSpot(x, t2)); // Добавляем точку для второй линии
    }

    // Рассчитываем границы отображаемого временного окна (ось X)
    final double minX =
        (currentRightMinute - viewSizeMinutes).toDouble(); // Левая граница
    final double maxX = currentRightMinute.toDouble(); // Правая граница

    // Контейнер с графиком
    return Container(
      width: width, // Устанавливаем ширину
      height: height, // Устанавливаем высоту
      padding: const EdgeInsets.all(8), // Внутренний отступ
      child: LineChart(
        LineChartData(
          lineBarsData: [
            // Массив линий на графике
            LineChartBarData(
              spots: spotsT1, // Точки первой линии
              isCurved: isCurved, // Сглаживание
              color: colorT1, // Цвет
              barWidth: lineWidth, // Толщина
              dotData: FlDotData(show: showDots), // Точки
            ),
            LineChartBarData(
              spots: spotsT2, // Точки второй линии
              isCurved: isCurved,
              color: colorT2,
              barWidth: lineWidth,
              dotData: FlDotData(show: showDots),
            ),
          ],
          minX: minX, // Левая граница оси X
          maxX: maxX, // Правая граница оси X
          minY: minY, // Нижняя граница оси Y
          maxY: maxY, // Верхняя граница оси Y

          // Настройки сетки (grid)
          gridData: FlGridData(
            show: true, // Отображать сетку
            horizontalInterval:
                30, // Интервал по Y (например, 3.0°C если шкала ×10)
            verticalInterval: 240, // Интервал по X (например, каждые 4 часа)
            drawVerticalLine: true, // Вертикальные линии
            drawHorizontalLine: true, // Горизонтальные линии
            getDrawingHorizontalLine: (value) => FlLine(
              color: const Color(0xFFCCCCCC), // Цвет горизонтальных линий
              strokeWidth: 0.5, // Толщина линий
            ),
            getDrawingVerticalLine: (value) => FlLine(
              color: const Color(0xFFCCCCCC),
              strokeWidth: 0.5,
            ),
          ),

          // Подписи осей
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true, // Показывать подписи по X
                reservedSize: 38, // Высота под две строки
                interval: 240, // Интервал подписи по X (4 часа)
                getTitlesWidget: (value, meta) {
                  final epoch = DateTime.utc(1, 1, 1); // Начало эпохи
                  final dt = epoch.add(
                      Duration(minutes: value.toInt())); // Перевод x в дату
                  final timeStr =
                      "${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}"; // Часы:минуты
                  final dateStr =
                      "${dt.day.toString().padLeft(2, '0')}.${dt.month.toString().padLeft(2, '0')}.${(dt.year % 100).toString().padLeft(2, '0')}"; // Дата дд.мм.гг
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(timeStr,
                          style: const TextStyle(fontSize: 10),
                          textAlign: TextAlign.center),
                      Text(dateStr,
                          style:
                              const TextStyle(fontSize: 10, color: Colors.grey),
                          textAlign: TextAlign.center),
                    ],
                  );
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true, // Показывать подписи по Y
                interval: 30, // Шаг по Y (3.0°C при шкале ×10)
                getTitlesWidget: (value, meta) {
                  return Text('${(value / 10).toStringAsFixed(1)}°C',
                      style: const TextStyle(fontSize: 10));
                },
              ),
            ),
            topTitles: AxisTitles(
                sideTitles: SideTitles(
                    showTitles: false)), // Не показывать верхние подписи
            rightTitles: AxisTitles(
                sideTitles: SideTitles(
                    showTitles: false)), // Не показывать правые подписи
          ),

          // Настройка тултипов (всплывающих подсказок)
          lineTouchData: LineTouchData(
            enabled: tooltipEnabled, // Включить или выключить
            touchTooltipData: LineTouchTooltipData(
              tooltipPadding: const EdgeInsets.all(8), // Отступ внутри тултипа
              tooltipMargin: 8, // Внешний отступ тултипа
              getTooltipItems: (touchedSpots) {
                return touchedSpots.map((spot) {
                  final x = spot.x.toInt(); // Время
                  final epoch = DateTime.utc(1, 1, 1);
                  final dt = epoch.add(Duration(minutes: x));
                  final timeStr =
                      "${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}";
                  final dateStr =
                      "${dt.day.toString().padLeft(2, '0')}.${dt.month.toString().padLeft(2, '0')}.${(dt.year % 100).toString().padLeft(2, '0')}";
                  final y = (spot.y / 10).toStringAsFixed(1); // Температура
                  return LineTooltipItem(
                    '$timeStr\n$dateStr\nT: $y°C', // Текст тултипа
                    const TextStyle(fontSize: 12, color: Colors.black),
                  );
                }).toList();
              },
            ),
          ),
        ),
      ),
    );
  }
}
