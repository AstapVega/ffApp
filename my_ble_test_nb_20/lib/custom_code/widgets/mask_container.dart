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

class MaskContainer extends StatefulWidget {
  const MaskContainer({
    super.key,
    this.width,
    this.height,
    this.enableTouch,
    this.backgroundImagePath,
  });

  final double? width;
  final double? height;
  final bool? enableTouch;
  final String? backgroundImagePath;

  @override
  State<MaskContainer> createState() => _MaskContainerState();
}

class _MaskContainerState extends State<MaskContainer> {
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !(widget.enableTouch ??
          false), // 🔥 Блокируем тапы, если enableTouch = false
      child: Container(
        width: widget.width ?? double.infinity,
        height: widget.height ?? double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent, // 🔥 Контейнер по умолчанию прозрачный
          image: widget.backgroundImagePath != null &&
                  widget.backgroundImagePath!.isNotEmpty
              ? DecorationImage(
                  image: AssetImage(widget.backgroundImagePath!),
                  fit: BoxFit.cover,
                )
              : null, // 🔥 Если путь пустой, фон просто не добавляется (без null)
        ),
      ),
    );
  }
}
