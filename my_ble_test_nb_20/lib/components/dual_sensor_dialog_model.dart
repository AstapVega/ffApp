import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'dual_sensor_dialog_widget.dart' show DualSensorDialogWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DualSensorDialogModel extends FlutterFlowModel<DualSensorDialogWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DeviseDiscript widget.
  FocusNode? deviseDiscriptFocusNode1;
  TextEditingController? deviseDiscriptTextController1;
  String? Function(BuildContext, String?)?
      deviseDiscriptTextController1Validator;
  // State field(s) for DeviseDiscript widget.
  FocusNode? deviseDiscriptFocusNode2;
  TextEditingController? deviseDiscriptTextController2;
  String? Function(BuildContext, String?)?
      deviseDiscriptTextController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    deviseDiscriptFocusNode1?.dispose();
    deviseDiscriptTextController1?.dispose();

    deviseDiscriptFocusNode2?.dispose();
    deviseDiscriptTextController2?.dispose();
  }
}
