import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'one_sensor_name_widget.dart' show OneSensorNameWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OneSensorNameModel extends FlutterFlowModel<OneSensorNameWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for SensorName widget.
  FocusNode? sensorNameFocusNode;
  TextEditingController? sensorNameTextController;
  String? Function(BuildContext, String?)? sensorNameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    sensorNameFocusNode?.dispose();
    sensorNameTextController?.dispose();
  }
}
