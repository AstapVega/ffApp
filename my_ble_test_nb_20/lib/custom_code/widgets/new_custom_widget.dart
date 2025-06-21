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

class NewCustomWidget extends StatefulWidget {
  const NewCustomWidget({
    super.key,
    this.width,
    this.height,
    this.part, // Добавили входной параметр для пути к изображению
  });

  final double? width;
  final double? height;
  final String? part; // Путь к изображению

  @override
  State<NewCustomWidget> createState() => _NewCustomWidgetState();
}

class _NewCustomWidgetState extends State<NewCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ??
          100.0, // Если ширина не указана, используется значение по умолчанию
      height: widget.height ??
          100.0, // Если высота не указана, используется значение по умолчанию
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            widget.part ??
                // 'assets/images/090_face2.png', // Используем переданный путь или дефолтный

                'assets/images/090_face1.png', // Используем переданный путь или дефолтный
          ),
          fit: BoxFit.cover, // Как изображение должно вписываться в контейнер
        ),
      ),
    );
  }
}
