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

import 'package:flutter_svg/flutter_svg.dart';

class CustomIconWidget extends StatefulWidget {
  const CustomIconWidget({
    super.key,
    this.width,
    this.height,
    this.part, // Путь к иконке (из Flutter Flow)
    this.iconSize, // Размер иконки
    this.iconColor, // Цвет иконки
  });

  final double? width; // Опциональная ширина
  final double? height; // Опциональная высота
  final String? part; // Путь к иконке
  final double? iconSize; // Размер иконки
  final Color? iconColor; // Цвет иконки

  @override
  State<CustomIconWidget> createState() => _CustomIconWidgetState();
}

class _CustomIconWidgetState extends State<CustomIconWidget> {
  @override
  Widget build(BuildContext context) {
    final String iconPath =
        widget.part ?? 'assets/fonts/period1.svg'; // <-- Твой путь!
    final double iconSize = widget.iconSize ?? 21.0;
    final Color iconColor = widget.iconColor ?? Colors.black;

    return Container(
      width: widget.width ?? iconSize,
      height: widget.height ?? iconSize,
      alignment: Alignment.center,
      child: iconPath.endsWith('.svg')
          ? SvgPicture.asset(
              iconPath,
              width: iconSize,
              height: iconSize,
              colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
            )
          : Image.asset(
              iconPath,
              width: iconSize,
              height: iconSize,
              fit: BoxFit.contain,
            ),
    );
  }
}
