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

import 'index.dart'; // Imports other custom widgets
import 'package:fl_chart/fl_chart.dart';

/// ===============================
///        TestLineChart1
/// ===============================
class TestLineChart1 extends StatefulWidget {
  const TestLineChart1({
    super.key, // Ключ виджета для оптимизаций Flutter
    this.width, // Ширина контейнера с графиком
    this.height, // Высота контейнера с графиком
    this.inputDATA1, // Старый формат данных (List<int>) канала 1
    this.inputDATA2, // Старый формат данных (List<int>) канала 2
    this.inputPanoramaTimeDATA1, // Данные канала 1 для режима панорамы
    this.inputPanoramaTimeDATA2, // Данные канала 2 для режима панорамы
    this.minX, // Минимальный индекс X для окна отображения
    this.maxX, // Максимальный индекс X для окна отображения
    this.minY, // Нижняя граница по оси Y
    this.maxY, // Верхняя граница по оси Y
    this.gridstepX, // Шаг вертикальных линий сетки
    this.gridstepY, // Шаг горизонтальных линий сетки
    this.panoramaMode, // Флаг: включен ли режим панорамы
    this.inputTimeDATA1, // Новый формат данных (List<LineChartStruct>) канала 1
    this.inputTimeDATA2, // Новый формат данных (List<LineChartStruct>) канала 2
    this.fixedTooltip, // Флаг: использовать ли кастомный «липкий» тултип
    this.onTap, // Callback при тапе на график, возвращает Unix-время
    this.getUnixXmin, // Callback для передачи Unix-времени начала окна
    this.tooltipLinePosition, // Внешняя позиция X для кастомного тултипа
  });

  final double? width, height; // Параметры размера
  final List<int>? inputDATA1, inputDATA2; // Старая плоская форма данных
  final List<LineChartStruct>? inputPanoramaTimeDATA1,
      inputPanoramaTimeDATA2; // Данные для режима панорамы
  final double? minX, maxX, minY, maxY; // Границы окна графика
  final double? gridstepX, gridstepY; // Шаги сетки
  final bool? panoramaMode; // Режим панорамы
  final List<LineChartStruct>? inputTimeDATA1,
      inputTimeDATA2; // Новый формат данных
  final bool? fixedTooltip; // Флаг кастомного тултипа
  final Future Function(int? curentTapTime)? onTap; // Callback тапа
  final Future Function(int? curentUnixXmin)?
      getUnixXmin; // Callback Unix начала окна
  final double? tooltipLinePosition; // Внешняя координата тултипа

  @override
  State<TestLineChart1> createState() => _State(); // Создает состояние виджета
}

/// ===============================
///            STATE
/// ===============================
class _State extends State<TestLineChart1> {
  List<LineBarSpot>?
      _frozenSpots; // Список «замороженных» спотов для кастомного тултипа
  double? _verticalX; // Координата вертикальной линии тултипа
  bool _showNative = false; // Показывать ли штатный тултип fl_chart
  late double _chartW; // Внутренняя ширина графика (без отступов)
  int? _lastUnixXmin; // Последнее отправленное время начала окна

  int _forceRedrawKey = 0; // Счетчик для принудительного пересоздания LineChart

  @override
  void initState() {
    super.initState(); // Стандартный вызов инициализации
    _applyFrozenTooltip(
        widget.tooltipLinePosition); // Первичная установка кастомного тултипа
  }

  @override
  void didUpdateWidget(covariant TestLineChart1 oldWidget) {
    super.didUpdateWidget(oldWidget); // Обновление виджета
    if (widget.panoramaMode != oldWidget.panoramaMode)
      setState(() {}); // При изменении режима панорамы перерисовать
    if (widget.tooltipLinePosition != oldWidget.tooltipLinePosition) {
      _applyFrozenTooltip(
          widget.tooltipLinePosition); // При изменении внешней позиции тултипа
    }
  }

  /// Применяет «липкий» тултип по внешней координате pos
  void _applyFrozenTooltip(double? pos) {
    if (pos == null) return; // Если позиция не задана, ничего не делаем
    final idx = pos.round(); // Индекс ближайшей точки
    final src1 = widget.panoramaMode == true
        ? widget.inputPanoramaTimeDATA1
        : widget.inputTimeDATA1; // Источник данных канала 1
    final src2 = widget.panoramaMode == true
        ? widget.inputPanoramaTimeDATA2
        : widget.inputTimeDATA2; // Источник данных канала 2
    if (src1 == null ||
        src2 == null ||
        idx >= src1.length ||
        idx >= src2.length) return; // Проверка границ

    final y1 = src1[idx].temper / 10.0; // Значение T1
    final y2 = src2[idx].temper / 10.0; // Значение T2

    setState(() {
      _verticalX = pos; // Устанавливаем вертикальную линию
      _frozenSpots = [
        // Формируем список спотов для отрисовки
        LineBarSpot(
          LineChartBarData(
              spots: [], isCurved: true, color: Colors.deepOrangeAccent),
          0,
          FlSpot(pos, y1),
        ),
        LineBarSpot(
          LineChartBarData(spots: [], isCurved: true, color: Colors.green),
          1,
          FlSpot(pos, y2),
        ),
      ];
      _showNative = false; // Скрываем штатный тултип
      _forceRedrawKey++; // Меняем key для принудительного redraw
    });
  }

  /// Текстовая метка для линии: 'T1 = 23.4°' или 'T2 = 25.1°'
  String _spotLabel(LineBarSpot s) =>
      '${s.barIndex == 0 ? 'T1' : 'T2'} = ${s.y.toStringAsFixed(1)}°';

  /// Преобразует Unix-время в словарь {'date': 'dd.MM.yy', 'time': 'HH:mm'}
  Map<String, String> _dt(int x) {
    final src = widget.panoramaMode == true
        ? widget.inputPanoramaTimeDATA1
        : widget.inputTimeDATA1;
    if (src == null || x >= src.length) {
      return {'date': '--.--.--', 'time': '00:00'};
    }
    final dt =
        DateTime.fromMillisecondsSinceEpoch(src[x].time * 1000, isUtc: true);
    return {
      'date':
          '${dt.day.toString().padLeft(2, '0')}.${dt.month.toString().padLeft(2, '0')}.${dt.year.toString().substring(2)}',
      'time':
          '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}',
    };
  }

  @override
  Widget build(BuildContext context) {
    final int startX = (widget.minX ?? 0).round(); // Начальный индекс окна
    final int endX = (widget.maxX ?? 1439).round(); // Конечный индекс окна
    final minY = widget.minY ?? 15.0; // Нижняя граница Y
    final maxY = widget.maxY ?? 30.0; // Верхняя граница Y

    // После рендера передаем текущий Unix-время начала окна
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final src = widget.panoramaMode == true
          ? widget.inputPanoramaTimeDATA1
          : widget.inputTimeDATA1;
      if (widget.getUnixXmin != null && src != null && startX < src.length) {
        final cur = src[startX].time;
        if (_lastUnixXmin != cur) {
          _lastUnixXmin = cur;
          widget.getUnixXmin!(cur);
        }
      }
    });

    // Авто-установка внутреннего тултипа при первом рендере
    if (widget.tooltipLinePosition != null && _frozenSpots == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _applyFrozenTooltip(widget.tooltipLinePosition);
      });
    }

    // Подготовка точек графиков для обоих каналов
    final List<FlSpot> s1 = [], s2 = [];
    for (int i = startX; i <= endX; i++) {
      final y1 = widget.panoramaMode == true
          ? (i < (widget.inputPanoramaTimeDATA1?.length ?? 0)
              ? widget.inputPanoramaTimeDATA1![i].temper / 10.0
              : 0.0)
          : (i < (widget.inputTimeDATA1?.length ?? 0)
              ? widget.inputTimeDATA1![i].temper / 10.0
              : 0.0);
      final y2 = widget.panoramaMode == true
          ? (i < (widget.inputPanoramaTimeDATA2?.length ?? 0)
              ? widget.inputPanoramaTimeDATA2![i].temper / 10.0
              : 0.0)
          : (i < (widget.inputTimeDATA2?.length ?? 0)
              ? widget.inputTimeDATA2![i].temper / 10.0
              : 0.0);
      s1.add(FlSpot(i.toDouble(), y1));
      s2.add(FlSpot(i.toDouble(), y2));
    }

    _chartW =
        (widget.width ?? 300) - 7 - 14; // Вычисление внутренней ширины графика

    return Stack(children: [
      // Основной график
      Container(
        width: widget.width, // Ширина контейнера
        height: widget.height, // Высота контейнера
        padding: const EdgeInsets.fromLTRB(7, 40, 14, 14), // Отступы: L,T,R,B
        child: LineChart(
          key: ValueKey(
              _forceRedrawKey), // Key меняется для принудительного redraw
          LineChartData(
            lineTouchData: widget.fixedTooltip == true
                ? LineTouchData(
                    enabled: true, // Включаем тач-события
                    handleBuiltInTouches:
                        true, // Разрешаем fl_chart обрабатывать тач
                    touchCallback: (event, response) {
                      // Обработка тача
                      final src = widget.panoramaMode == true
                          ? widget.inputPanoramaTimeDATA1
                          : widget.inputTimeDATA1;
                      if (response?.lineBarSpots != null &&
                          response!.lineBarSpots!.isNotEmpty) {
                        setState(() {
                          _frozenSpots =
                              response.lineBarSpots; // Сохраняем точки тапа
                          _verticalX = response
                              .lineBarSpots!.first.x; // Сохраняем координату X
                          _showNative = true; // Показываем штатный тултип
                        });
                        final idx = response.lineBarSpots!.first.x.toInt();
                        final int? curTap = (src != null && idx < src.length)
                            ? src[idx].time
                            : null;
                        if (widget.onTap != null)
                          widget.onTap!(curTap); // Вызываем внешний callback
                      }
                      if (event is FlTapUpEvent ||
                          event is FlPanEndEvent ||
                          event is FlLongPressEnd) {
                        setState(() =>
                            _showNative = false); // Скрываем штатный тултип
                      }
                    },
                    getTouchedSpotIndicator: (bar, spots) => spots.map((i) {
                      return TouchedSpotIndicatorData(
                        FlLine(
                            color: bar.color!,
                            strokeWidth: 1), // Вертикальная линия
                        FlDotData(
                          show: true,
                          getDotPainter: (s, p, b, _) => FlDotCirclePainter(
                            radius: 6,
                            color: b.color!,
                            strokeWidth: 2,
                            strokeColor: Colors.white,
                          ),
                        ),
                      );
                    }).toList(),
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipColor: (_) =>
                          Colors.grey.shade200, // Фон тултипа
                      tooltipPadding:
                          const EdgeInsets.all(4), // Padding внутрь тултипа
                      tooltipRoundedRadius: 8, // Скругление углов
                      getTooltipItems: (spots) {
                        if (!_showNative) return []; // Если штатный не нужен
                        spots.sort((a, b) => a.barIndex.compareTo(b.barIndex));
                        final dt = _dt(spots.first.x.toInt());
                        final d = dt['date']!, t = dt['time']!;
                        return spots.map((s) {
                          final base =
                              '${s.barIndex == 0 ? 'T1' : 'T2'} = ${s.y.toStringAsFixed(1)}°';
                          final txt =
                              s == spots.last ? '$base\n\n$d\n$t' : base;
                          return LineTooltipItem(
                              txt,
                              const TextStyle(
                                  fontSize: 10, color: Colors.black));
                        }).toList();
                      },
                    ),
                  )
                : LineTouchData(), // Если fixedTooltip==false
            lineBarsData: _bars(s1, s2), // Данные линий графика
            extraLinesData: _extra(), // Дополнительные вертикальные линии
            titlesData: _titles(), // Подписи осей
            gridData: FlGridData(
              // Сетка
              show: true,
              horizontalInterval: widget.gridstepY ?? 5,
              verticalInterval: widget.gridstepX ?? 240,
            ),
            borderData: FlBorderData(
              // Рамка вокруг графика
              show: true,
              border: const Border.fromBorderSide(
                  BorderSide(color: Colors.black26)),
            ),
            minX: widget.minX ?? 0, // Минимальное X
            maxX: widget.maxX ?? 1439, // Максимальное X
            minY: minY, // Минимальное Y
            maxY: maxY, // Максимальное Y
          ),
        ),
      ),

      // «Липкий» клон тултипа (кастомный) поверх графика
      if (widget.fixedTooltip == true && _frozenSpots != null && !_showNative)
        Positioned(
          left: () {
            final minX = widget.minX ?? 0;
            final maxX = widget.maxX ?? 1439;
            final pos = _frozenSpots!.first.x;
            final pct = (pos - minX) / (maxX - minX);
            double offset = 7 + pct * _chartW - 40; // Влево от линии
            if (pos - minX < 110) // Если близко к левому краю
              offset = 7 + pct * _chartW + 26; // Размещаем справа
            return offset;
          }(),
          top: 40, // Отступ сверху
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black26),
            ),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              ..._frozenSpots!.map((s) =>
                  Text(_spotLabel(s), style: const TextStyle(fontSize: 10))),
              const SizedBox(height: 4),
              Text(_dt(_frozenSpots!.first.x.toInt())['date']!,
                  style: const TextStyle(fontSize: 10)),
              Text(_dt(_frozenSpots!.first.x.toInt())['time']!,
                  style: const TextStyle(fontSize: 10)),
            ]),
          ),
        ),
    ]);
  }

  /// Возвращает две линии графика: оранжевая и зеленая
  List<LineChartBarData> _bars(List<FlSpot> s1, List<FlSpot> s2) => [
        LineChartBarData(
          spots: s1, // Данные первой линии
          isCurved: true, // Скругленная линия
          color: Colors.deepOrangeAccent, // Цвет линии
          barWidth: 1.5, // Толщина линии
          dotData: FlDotData(
            // Точки на линии
            show: true,
            getDotPainter: (d, _, b, __) {
              final f = _frozenSpots?.any(
                      (s) => s.x == d.x && s.y == d.y && s.barIndex == 0) ??
                  false;
              return FlDotCirclePainter(
                radius: f ? 6 : 0, // Радиус 6 для замороженных, иначе 0
                color: b.color!,
                strokeWidth: f ? 2 : 0,
                strokeColor: Colors.white,
              );
            },
          ),
        ),
        LineChartBarData(
          spots: s2,
          isCurved: true,
          color: Colors.green,
          barWidth: 1.5,
          dotData: FlDotData(
            show: true,
            getDotPainter: (d, _, b, __) {
              final f = _frozenSpots?.any(
                      (s) => s.x == d.x && s.y == d.y && s.barIndex == 1) ??
                  false;
              return FlDotCirclePainter(
                radius: f ? 6 : 0,
                color: b.color!,
                strokeWidth: f ? 2 : 0,
                strokeColor: Colors.white,
              );
            },
          ),
        ),
      ];

  /// Возвращает дополнительные вертикальные линии (только для кастомного тултипа)
  ExtraLinesData _extra() => ExtraLinesData(
        verticalLines: _verticalX == null
            ? [] // Нет линии, если _verticalX не задан
            : [
                VerticalLine(
                  x: _verticalX!, // Координата X
                  color: Colors.blue, // Цвет линии
                  strokeWidth: 1, // Толщина линии
                  dashArray: [4, 2], // Пунктир
                )
              ],
      );

  /// Настройки подписей (тайтлов) осей
  FlTitlesData _titles() => FlTitlesData(
        show: true,
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true, // Включаем подписи по оси Y
            interval: widget.gridstepY ?? 5, // Шаг подписей
            reservedSize: 20, // Место слева
            getTitlesWidget: (v, _) => Text('${v.toStringAsFixed(0)}°',
                style: const TextStyle(fontSize: 10)),
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: (widget.maxX ?? 0) - (widget.minX ?? 0) >
                0, // Если окно не пустое
            interval: widget.gridstepX ?? 240, // Шаг подписей X
            reservedSize: 42,
            getTitlesWidget: (value, _) {
              final idx = value.toInt();
              if (idx == (widget.minX ?? 0).round() ||
                  idx == (widget.maxX ?? 0).round())
                return const SizedBox.shrink(); // Пропускаем крайние подписи
              final src = widget.panoramaMode == true
                  ? widget.inputPanoramaTimeDATA1
                  : widget.inputTimeDATA1;
              if (src == null || idx >= src.length)
                return const SizedBox.shrink();
              final dt = DateTime.fromMillisecondsSinceEpoch(
                  src[idx].time * 1000,
                  isUtc: true);
              final t =
                  '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
              final d =
                  '${dt.day.toString().padLeft(2, '0')}.${dt.month.toString().padLeft(2, '0')}.${dt.year.toString().substring(2)}';
              final prev = idx - (widget.gridstepX ?? 240).toInt();
              final newDate = prev < 0 ||
                  (prev < src.length &&
                      DateTime.fromMillisecondsSinceEpoch(src[prev].time * 1000,
                                  isUtc: true)
                              .day !=
                          dt.day);
              return Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: newDate ? Colors.black26 : Colors.transparent,
                        width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Text(t, style: const TextStyle(fontSize: 10)),
                    const SizedBox(height: 3),
                    Text(d, style: const TextStyle(fontSize: 9)),
                  ]),
                ),
              );
            },
          ),
        ),
        topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false)), // Скрыть подписи сверху
        rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false)), // Скрыть подписи справа
      );
}
