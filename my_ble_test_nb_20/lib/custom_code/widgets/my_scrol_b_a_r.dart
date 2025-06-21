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
import 'package:flutter/foundation.dart'; // Для kIsWeb
import 'package:flutter/gestures.dart'; // Для PointerDeviceKind

// Кастомное поведение скролла: разрешаем прокрутку мышью и стилусом, но запрещаем пальцем (touch)
class NoTouchScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.mouse, // Разрешаем прокрутку мышью
        PointerDeviceKind.stylus, // Разрешаем прокрутку стилусом
      };
}

/// Основной кастомный виджет горизонтальной прокрутки с управлением свайпом и скроллбаром
class MyScrolBAR extends StatefulWidget {
  const MyScrolBAR({
    super.key, // Ключ для виджета (стандартно)
    this.width, // Ширина контейнера (опционально)
    this.height, // Высота контейнера (опционально)
    required this.component, // Функция, возвращающая содержимое скролла (обязательна)
    this.shiftleft, // Сигнал на сдвиг влево (единичка = команда)
    this.shiftright, // Сигнал на сдвиг вправо (единичка = команда)
    this.shiftstep, // Шаг сдвига в пикселях (по умолчанию 1)
    this.showScrollbar, // Показывать полосу прокрутки (булево)
    this.allowSwipe, // Разрешать свайпы пальцем (булево)
    this.scrollChannel, // Канал скроллбара (0-панорама, 1-деталь)
  });

  final double? width; // Ширина контейнера
  final double? height; // Высота контейнера
  final Widget Function() component; // Контент внутри скролла
  final int? shiftleft; // Сигнал на сдвиг влево
  final int? shiftright; // Сигнал на сдвиг вправо
  final int? shiftstep; // Шаг сдвига
  final bool? showScrollbar; // Показывать скроллбар
  final bool? allowSwipe; // Разрешать свайпы
  final int? scrollChannel; // Канал скроллбара

  @override
  State<MyScrolBAR> createState() => _MyScrolBARState(); // Создаём состояние
}

// Состояние для кастомного скроллбара
class _MyScrolBARState extends State<MyScrolBAR> {
  late final ScrollController _controller; // Контроллер прокрутки
  double _scrollbarThickness = 8.0; // Толщина скроллбара по умолчанию
  static const double _scrollbarAreaHeight = 24.0; // Высота зоны скроллбара

  // --- ДВА ЛОКАЛЬНЫХ СОСТОЯНИЯ ДЛЯ ОФФСЕТА (канал 0 / канал 1) ---
  double _offset0 = 0.0; // Позиция скролла для канала 0 (панорама)
  double _offset1 = 0.0; // Позиция скролла для канала 1 (деталь)
  int? _lastChannel; // Последний применённый канал

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();

    // Восстанавливаем позицию скролла после первого рендера
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _lastChannel = widget.scrollChannel ?? 0;
      final startOffset = _lastChannel == 0 ? _offset0 : _offset1;
      _safeJump(startOffset);
    });
  }

  @override
  void didUpdateWidget(covariant MyScrolBAR oldWidget) {
    super.didUpdateWidget(oldWidget);
    final int step = widget.shiftstep ?? 1;

    // ---------- обработка смены канала ----------
    final currentChannel = widget.scrollChannel ?? 0;
    if (_lastChannel != currentChannel) {
      // 1) сохраняем позицию старого канала
      if (_lastChannel == 0) {
        _offset0 = _controller.offset;
      } else {
        _offset1 = _controller.offset;
      }
      // 2) подгружаем позицию нового канала
      final newOffset = currentChannel == 0 ? _offset0 : _offset1;
      _safeJump(newOffset);
      _lastChannel = currentChannel;
    }

    // ---------- реакции на команды сдвига ----------
    if (widget.shiftleft == 1) _moveScroll(-step);
    if (widget.shiftright == 1) _moveScroll(step);
  }

  // Мгновенная прокрутка на delta пикселей (без анимации)
  void _moveScroll(int delta) {
    final max = _controller.position.maxScrollExtent;
    final newOffset = (_controller.offset + delta).clamp(0.0, max);
    _controller.jumpTo(newOffset);
  }

  // Безопасный jumpTo — если контент ещё не промерян, ждём след. кадр
  void _safeJump(double offset) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final max = _controller.position.maxScrollExtent;
      _controller.jumpTo(offset.clamp(0.0, max));
    });
  }

  // Обработчик касания: увеличиваем толщину полосы только если касание в зоне скроллбара
  void _onPointerDown(PointerDownEvent event) {
    final local = event.localPosition;
    final h = widget.height ?? 200.0; // Защита от null
    if (local.dy >= h - _scrollbarAreaHeight) {
      setState(() => _scrollbarThickness = 12.0);
    }
  }

  // Обработчик отпускания: возвращаем толщину обратно
  void _onPointerUp(PointerUpEvent event) {
    setState(() => _scrollbarThickness = 8.0);
  }

  @override
  Widget build(BuildContext context) {
    final bool allowUserScroll = widget.allowSwipe ?? true;
    Widget content;

    if (widget.showScrollbar == true) {
      // --- вариант с видимой полосой прокрутки ---
      content = Listener(
        onPointerDown: _onPointerDown,
        onPointerUp: _onPointerUp,
        child: Scrollbar(
          controller: _controller,
          thumbVisibility: true,
          thickness: _scrollbarThickness,
          radius: const Radius.circular(8),
          interactive: true,
          child: ScrollConfiguration(
            behavior: allowUserScroll
                ? const MaterialScrollBehavior()
                : NoTouchScrollBehavior(),
            child: SingleChildScrollView(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              child: widget.component(),
            ),
          ),
        ),
      );
    } else {
      // --- вариант без полосы прокрутки ---
      content = ScrollConfiguration(
        behavior: allowUserScroll
            ? const MaterialScrollBehavior()
            : NoTouchScrollBehavior(),
        child: SingleChildScrollView(
          controller: _controller,
          scrollDirection: Axis.horizontal,
          child: widget.component(),
        ),
      );
    }

    return Container(
      width: widget.width,
      height: widget.height,
      child: content,
    );
  }

  @override
  void dispose() {
    // Сохраняем актуальный оффсет перед уничтожением
    if (_lastChannel == 0) {
      _offset0 = _controller.offset;
    } else {
      _offset1 = _controller.offset;
    }
    _controller.dispose();
    super.dispose();
  }
}
