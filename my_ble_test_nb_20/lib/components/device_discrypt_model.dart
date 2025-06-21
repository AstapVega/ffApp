import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'device_discrypt_widget.dart' show DeviceDiscryptWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeviceDiscryptModel extends FlutterFlowModel<DeviceDiscryptWidget> {
  ///  State fields for stateful widgets in this component.

  InstantTimer? instantTimer;
  // State field(s) for DeviseDiscript widget.
  FocusNode? deviseDiscriptFocusNode;
  TextEditingController? deviseDiscriptTextController;
  String? Function(BuildContext, String?)?
      deviseDiscriptTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
    deviseDiscriptFocusNode?.dispose();
    deviseDiscriptTextController?.dispose();
  }
}
