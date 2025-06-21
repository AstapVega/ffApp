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

import 'package:flutter_spinkit/flutter_spinkit.dart'; // Подключение flutter_spinkit

// Описание соответствия номера и типа лоудера:
// loaderType = 1 -> SpinKitCircle (Круговой лоудер)
// loaderType = 2 -> SpinKitSquareCircle (Плитка)
// loaderType = 3 -> SpinKitChasingDots (Преследующие точки)
// loaderType = 4 -> SpinKitFadingFour (Затухающие четыре)
// loaderType = 5 -> SpinKitFadingCube (Затухающие кубы)
// loaderType = 6 -> SpinKitDoubleBounce (Двойной отскок)
// loaderType = 7 -> SpinKitWave (Волна)
// loaderType = 8 -> SpinKitWanderingCubes (Блуждающие кубы)
// loaderType = 9 -> SpinKitPulse (Пульсация)
// loaderType = 10 -> SpinKitRotatingCircle (Вращающийся круг)
// loaderType = 11 -> SpinKitRotatingPlain (Вращающаяся плоскость)
// loaderType = 12 -> SpinKitThreeBounce (Три отскока)

class LoadingCustomWidget extends StatefulWidget {
  const LoadingCustomWidget({
    super.key,
    this.width,
    this.height,
    required this.loaderType,
    required this.color,
  });

  final double? width;
  final double? height;
  final int loaderType;
  final Color color;

  @override
  State<LoadingCustomWidget> createState() => _LoadingCustomWidgetState();
}

class _LoadingCustomWidgetState extends State<LoadingCustomWidget> {
  @override
  Widget build(BuildContext context) {
    // Определяем лоудер в зависимости от типа loaderType
    Widget loader;

    switch (widget.loaderType) {
      case 1:
        loader = SpinKitCircle(
          color: widget.color,
          size: (widget.width ?? 50),
        );
        break;
      case 2:
        loader = SpinKitSquareCircle(
          color: widget.color,
          size: (widget.width ?? 50),
        );
        break;
      case 3:
        loader = SpinKitChasingDots(
          color: widget.color,
          size: (widget.width ?? 50),
        );
        break;
      case 4:
        loader = SpinKitFadingFour(
          color: widget.color,
          size: (widget.width ?? 50),
        );
        break;
      case 5:
        loader = SpinKitFadingCube(
          color: widget.color,
          size: (widget.width ?? 50),
        );
        break;
      case 6:
        loader = SpinKitDoubleBounce(
          color: widget.color,
          size: (widget.width ?? 50),
        );
        break;
      case 7:
        loader = SpinKitWave(
          color: widget.color,
          size: (widget.width ?? 50),
        );
        break;
      case 8:
        loader = SpinKitWanderingCubes(
          color: widget.color,
          size: (widget.width ?? 50),
        );
        break;
      case 9:
        loader = SpinKitPulse(
          color: widget.color,
          size: (widget.width ?? 50),
        );
        break;
      case 10:
        loader = SpinKitRotatingCircle(
          color: widget.color,
          size: (widget.width ?? 50),
        );
        break;
      case 11:
        loader = SpinKitRotatingPlain(
          color: widget.color,
          size: (widget.width ?? 50),
        );
        break;
      case 12:
        loader = SpinKitThreeBounce(
          color: widget.color,
          size: (widget.width ?? 50),
        );
        break;
      default:
        loader = SpinKitCircle(
          color: widget.color,
          size: (widget.width ?? 50),
        );
    }

    return Container(
      width: widget.width,
      height: widget.height,
      child: Center(child: loader), // Центрируем лоудер внутри контейнера
    );
  }
}
