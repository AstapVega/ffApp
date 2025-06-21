import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'device_page55_widget.dart' show DevicePage55Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DevicePage55Model extends FlutterFlowModel<DevicePage55Widget> {
  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimerPage3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimerPage3?.cancel();
  }
}
